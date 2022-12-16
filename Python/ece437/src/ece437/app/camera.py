import logging
from ece437.presets import CMV300_SPI_ENDPOINTS, CMV300_DATA_ENDPOINTS
from ece437.spi import SPIController
from ece437.sensor import CMV300
from PySide2.QtCore import QTimer, QThread, Signal, QObject, QDateTime
from PySide2.QtGui import QImage
from ece437.ok import OKFrontPanel
import numpy as np
from abc import abstractmethod
from .qt import AbstractQObject
from datetime import datetime

__all__ = ["BaseCameraWorker", "CameraWorker"]

logger = logging.getLogger(__name__)


class BaseCameraWorker(QObject, metaclass=AbstractQObject):
    """
    Base class for camera.
    
    Args:
        refresh_rate (float, optional): frame refresh rate in Hz
    """

    acquired_new_frame = Signal(np.ndarray)
    timeout = Signal()

    def __init__(self, refresh_rate: float = 25):
        super().__init__()

        self._refresh_rate = refresh_rate

    @property
    def refresh_rate(self) -> float:
        return self._refresh_rate

    @property
    def frame_interval(self) -> int:
        """
        Frame interval in milliseconds.
        
        Notes:
            Not guaranteed to match the refresh rate.
        """
        return int(1000 / self.refresh_rate)

    @property
    @abstractmethod
    def current_frame(self):
        """Latest acquired frame."""

    def run(self) -> None:
        self._timer = QTimer()
        self._timer.timeout.connect(self.grab_frame)
        self._timer.setInterval(self.frame_interval)

        self._timer.start()

    def finished(self) -> None:
        self._timer.stop()

    @abstractmethod
    def grab_frame(self) -> None:
        """Grab a frame and emit it as a signal."""
        raise NotImplementedError()


class CameraWorker(BaseCameraWorker):
    def __init__(self, fp: OKFrontPanel, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

        self._spi = SPIController(fp, CMV300_SPI_ENDPOINTS)
        self._data = CMV300(fp, self._spi, CMV300_DATA_ENDPOINTS)

        self._n_timeout_redo = 0

    @property
    def current_frame(self):
        return self._frame_buffer

    def run(self) -> None:
        self._n_timeout_redo = 0 # start fresh

        self._spi.open()
        self._data.open()

        self._data.set_exposure(10)
        t_exp = self._data.get_exposure()
        logger.info(f"exposure time {t_exp} ms")
        super().run()

    def finished(self) -> None:
        super().finished()
        self._data.close()
        self._spi.close()

    def grab_frame(self) -> None:
        try:
            t0 = datetime.now()
            array = self._data.get_image_array()
            t1 = datetime.now()

            self._n_timeout_redo = 0 # success read, no timeouts
        except TimeoutError as err:
            logger.exception(err)
            self._n_timeout_redo += 1

            if self._n_timeout_redo == 1:
                # 1) re-capture
                logger.warning('timeout redo 1, re-capture')
                self.grab_frame()
            elif self._n_timeout_redo == 2:
                # 2) reset camera
                logger.warning('timeout redo 2, reset camera')
                self._data.reset()
            else:
                # 3) top-level
                logger.warning('timeout redo 3, complete reset')
                self.timeout.emit()

            # NOTE do not continue below, they are for correct operations
            return

        delta = t1 - t0
        dt = delta.total_seconds() * 1000
        logger.info(f"t_frame={dt:.3f} ms")

        self.acquired_new_frame.emit(array)
