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

        self._controller = self._pid(k_p=0.2, k_i=0, k_d=0)
        self._controller.send(None)

    def start(self) -> None:
        self._thread.start()

    def stop(self) -> None:
        self._thread.quit()
        self._thread.wait()
        self._motor.finished()

    @Slot(QDateTime, np.ndarray)
    def on_acquired_new_frame(self, timestamp: QDateTime, image: np.ndarray) -> None:
        #self._frame_index += 1
        #if self._frame_index % 5 != 0: # reduce update rate
        #    return

        pos = self._find_object_center(image)
        if pos is not None:
            if self._prev_pos is None:
                self.update_tracker_state.emit(True)

            logger.debug(f"object @ (x={pos[0]:.2f}, y={pos[1]:.2f})")
            self.update_tracker_position.emit(pos[0], pos[1])

            # move till object is close to screen center
            if self._prev_pos is not None:
                # we have record to predict
                _, nx = image.shape
                dx = pos[0] - nx/2. 

                t = timestamp.msecsTo(self._t_prev)
                x = self._controller.send([t, dx, 0])

                self.new_object_offset.emit(x)
        else:
            if self._prev_pos is not None:
                self.update_tracker_state.emit(False)

        self._prev_pos = pos
        self._t_prev = timestamp

    def _pid(self, k_p: float = 1, k_i :float=0, k_d: float=0, MV_bar = 0):
        # initialized stored data
        e_prev = 0
        t_prev = 0   
        I = 0

        # initial control
        MV = MV_bar

        while True:
            # yield x, wait for new t, pv, sp
            t, pv, sp = yield MV

            e = sp - pv

            P = k_p * e
            I = I + k_i * e * (t - t_prev)
            D = k_d * (e - e_prev) / (t - t_prev)

            MV = MV_bar + P + I + D

            # update stored data
            e_prev = e
            t_prev = t

    @classmethod
    def _find_object_center(
        cls,
        image: np.ndarray,
        sigma: float = 7,
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