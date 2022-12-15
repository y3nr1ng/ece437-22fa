from PySide2.QtCore import QThread, QDateTime, Slot
from PySide2.QtWidgets import QWidget, QLabel
from PySide2.QtGui import QPixmap, QImage, QResizeEvent
import logging
from .camera import BaseCameraWorker
from .matplotlib import MplImageWidget
import numpy as np

__all__ = ["CameraViewerWidget"]

logger = logging.getLogger(__name__)


class ImageWidget(QWidget):
    def __init__(self) -> None:
        super().__init__()

        self._label = QLabel(self)
        self._resized = False

    def update_image(self, image: QImage) -> None:
        self._label.setPixmap(QPixmap.fromImage(image))
        
        if not self._resized:
            self._label.resize(image.width(), image.height())
            self._resized = True

class CameraViewerWidget(ImageWidget):
    """
    Args:
        fp (OKFrontPanel): the OK FP instance
        refresh_rate (float, optional): refresh rate in Hz
    """

    def __init__(self, camera: BaseCameraWorker, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

        self._camera = camera
        self._camera.acquired_new_frame.connect(self.on_acquired_new_frame)

        self._thread = QThread()
        self._camera.moveToThread(self._thread)
        self._thread.started.connect(self._camera.run)
        self._thread.finished.connect(self._camera.finished)

    def start(self) -> None:
        self._thread.start()

    def stop(self) -> None:
        self._thread.quit()
        self._thread.wait()

    @Slot(QDateTime, QImage)
    def on_acquired_new_frame(self, timestamp: QDateTime, image: QImage) -> None:
        logger.info(f'new frame, {timestamp}')
        self.update_image(image)
