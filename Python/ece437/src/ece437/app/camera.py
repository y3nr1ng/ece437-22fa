import logging
from ece437.presets import CMV300_SPI_ENDPOINTS, CMV300_DATA_ENDPOINTS
from ece437.spi import SPIController
from ece437.sensor import CMV300
from PySide2.QtCore import QTimer, Signal, QObject
from ece437.ok import OKFrontPanel
import numpy as np
from abc import ABC, abstractmethod

__all__ = ["BaseCameraWorker", "CameraWorker"]

logger = logging.getLogger(__name__)


class BaseCameraWorker(ABC, QObject):
    new_frame = Signal(np.ndarray)

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

    def run(self) -> None:
        self.timer = QTimer()
        self.timer.setInterval(self.frame_interval)
        self.timer.timeout.connect(self.grab_frame)
        self.timer.start()
        logger.debug("camera worker timer started")

    def finished(self) -> None:
        self.timer.stop()
        logger.debug("camera worker timer stopped")

    @abstractmethod
    def grab_frame(self) -> None:
        """Grab a frame and emit it as a signal."""
        raise NotImplementedError()


class CameraWorker(BaseCameraWorker):
    def __init__(self, fp: OKFrontPanel, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

        self._spi = SPIController(fp, CMV300_SPI_ENDPOINTS)
        self._data = CMV300(fp, self._spi, CMV300_DATA_ENDPOINTS)

    def run(self) -> None:
        self._spi.open()
        self._data.open()
        super().run()

    def finished(self) -> None:
        super().run()
        self._data.close()
        self._spi.close()

    def grab_frame(self) -> None:
        image = self._data.get_image()
        self.new_frame.emit(image)
