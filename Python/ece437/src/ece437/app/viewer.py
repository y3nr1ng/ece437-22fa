import numpy as np
from PySide2.QtCore import QThread, Slot
import logging
from .camera import BaseCameraWorker
from .matplotlib import MplImageWidget

__all__ = ["CameraViewerWidget"]

logger = logging.getLogger(__name__)


class CameraViewerWidget(MplImageWidget):
    """
    Args:
        fp (OKFrontPanel): the OK FP instance
        refresh_rate (float, optional): refresh rate in Hz
    """

    def __init__(self, camera: BaseCameraWorker, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

        self._camera = camera
        self._camera.new_frame.connect(self.update_viewer)

        self._thread = QThread()
        self._camera.moveToThread(self._thread)
        self._thread.started.connect(self._camera.run)
        self._thread.finished.connect(self._camera.finished)

    def start(self) -> None:
        self._thread.start()

    def stop(self) -> None:
        self._thread.quit()
        self._thread.wait()

    def update_viewer(self, image) -> None:
        self.image_axes.set_data(image)
        self.canvas.draw()

