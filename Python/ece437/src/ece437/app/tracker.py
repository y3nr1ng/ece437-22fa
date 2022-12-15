from PySide2.QtCore import Signal, Slot, QDateTime
from PySide2.QtWidgets import QWidget
import logging
import numpy as np
from scipy.ndimage.filters import gaussian_filter

__all__ = ['TrackerWidget']

logger = logging.getLogger(__name__)

class TrackerWidget(QWidget):
    update_tracker_state = Signal(bool)
    update_tracker_position = Signal(float, float)

    def __init__(self):
        super().__init__()

        self._prev_com = None

    @Slot(QDateTime, np.ndarray)
    def on_acquired_new_frame(self, timestamp: QDateTime, image: np.ndarray) -> None:
        com = self._calcaulte_center_of_mass(image)
        if com is not None:
            if self._prev_com is None:
                self.update_tracker_state.emit(True)
            logger.debug(f"com (x={com[0]:.2f}, y={com[1]:.2f})")
            self.update_tracker_position.emit(com[0], com[1])
        else:
            if self._prev_com is not None:
                self.update_tracker_state.emit(False)

        self._prev_com = com

    @classmethod
    def _calcaulte_center_of_mass(
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

        # mask non-outliers
        weights = image.copy()
        weights[(dv / mad) <= threshold] = 0
        if np.sum(weights > 0) < fill_ratio * image.size:
            return None

        ny, nx = image.shape
        xv, yv = np.meshgrid(range(nx), range(ny), indexing="xy")

        # extract non-zero coordinates
        array = np.stack([xv, yv, weights], axis=-1)
        array = array[np.nonzero(weights)]

        com = np.average(array[:, :2], axis=0, weights=array[:, 2])
        return com