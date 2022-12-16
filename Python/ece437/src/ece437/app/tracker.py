from PySide2.QtCore import Signal, Slot, QDateTime, QThread
from PySide2.QtWidgets import QWidget
import logging
import numpy as np
from scipy.ndimage.filters import gaussian_filter
from .motor import BaseMotorWorker
from skimage.transform import hough_circle, hough_circle_peaks
from skimage.feature import canny
from datetime import datetime

__all__ = ['TrackerWidget']

logger = logging.getLogger(__name__)

class TrackerWidget(QWidget):
    # tracking state
    update_tracker_state = Signal(bool)
    update_tracker_position = Signal(float, float)

    # object offset toward center
    new_object_offset = Signal(float)

    def __init__(self, motor: BaseMotorWorker) ->None:
        super().__init__()

        self._motor = motor

        self._thread = QThread()
        self._motor.moveToThread(self._thread)
        self._thread.started.connect(self._motor.run)
        self._thread.finished.connect(self._motor.finished)

        self._prev_pos = None

        self._frame_index = 0
        self._drop_frame_ratio = 4

    def start(self) -> None:
        self._thread.start(priority=QThread.TimeCriticalPriority)

    def stop(self) -> None:
        self._thread.quit()
        self._thread.wait()

    @Slot(np.ndarray)
    def on_acquired_new_frame(self, image: np.ndarray) -> None:
        # NOTE drop frame to match motor update rate, 5 Hz
        #self._frame_index += 1
        #if self._frame_index % self._drop_frame_ratio != 0:
        #    return

        pos = self._find_object_center(image)

        # show/hide cursor
        if (pos is None) ^ (self._prev_pos is None):
            self.update_tracker_state.emit(pos is not None)
        self._prev_pos = pos

        if pos is None:
            return

        logger.debug(f"object @ (x={pos[0]:.2f}, y={pos[1]:.2f})")
        self.update_tracker_position.emit(pos[0], pos[1])

        _, nx = image.shape
        dx = pos[0] - nx/2. 
        #self.new_object_offset.emit(dx)
        self._motor._pv = dx # will this work?

    @classmethod
    def _find_object_center(
        cls,
        image: np.ndarray,
        sigma: float = 3,
        consistency: float = 1.4826,
        threshold: float = 5,
        fill_ratio: float = 0.05,
    ):
        image = gaussian_filter(image, sigma=sigma)

        # use mad to determine cutoff
        m = np.median(image)
        dv = image - m
        mad = consistency * np.median(np.abs(dv))

        if mad < 0.001:
            return None

        # mask non-outliers
        weights = image.copy()
        weights[(dv / mad) <= threshold] = 0
        if np.sum(weights) < 1:
            logger.warning('invalid intensity weight for centroid')
            return None
        elif np.sum(weights > 0) < fill_ratio * image.size:
            return None

        ny, nx = image.shape
        xv, yv = np.meshgrid(range(nx), range(ny), indexing="xy")

        # extract non-zero coordinates
        array = np.stack([xv, yv, weights], axis=-1)
        array = array[np.nonzero(weights)]

        com = np.average(array[:, :2], axis=0, weights=array[:, 2])
        return com