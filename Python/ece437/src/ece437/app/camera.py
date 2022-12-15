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

__all__ = ["BaseCameraWorker", "CameraWorker"]

logger = logging.getLogger(__name__)



class BaseCameraWorker(QObject, metaclass=AbstractQObject):
    """
    Base class for camera.
    
    Args:
        refresh_rate (float, optional): frame refresh rate in Hz
    """
    acquired_new_frame = Signal(QDateTime, QImage)

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

    def finished(self)-> None:
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

        ny, nx = self._data.shape
        self._image = QImage(nx, ny, QImage.Format_Grayscale8)

    @property
    def current_frame(self):
        return self._frame_buffer

    def run(self) -> None:
        self._spi.open()
        self._data.open()

        t_exp = self._data.get_exposure()
        print(f'exposure time {t_exp} ms')
        super().run()

    def finished(self) -> None:
        super().finished()
        self._data.close()
        self._spi.close()

    def grab_frame(self) -> None:
        try:
            bytes = self._data.get_image_bytes()
        except TimeoutError:
            print("get_image, TIMEOUT")
            self._data.reset()

        ny, nx = self._data.shape
        image = QImage(bytes, nx, ny, nx, QImage.Format_Grayscale8)
        self.acquired_new_frame.emit(QDateTime.currentDateTime(), image)
