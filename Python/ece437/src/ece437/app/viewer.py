from PySide2.QtCore import QThread, QDateTime, Slot, Signal
from PySide2.QtWidgets import QWidget, QLabel, QGridLayout
from PySide2.QtGui import QTransform
import logging
from .camera import BaseCameraWorker
import pyqtgraph as pg
from typing import Tuple
import numpy as np

__all__ = ["CameraViewerWidget"]

logger = logging.getLogger(__name__)


class CameraViewerWidget(QWidget):
    """
    Args:
        fp (OKFrontPanel): the OK FP instance
        refresh_rate (float, optional): refresh rate in Hz
    """

    def __init__(self, camera: BaseCameraWorker, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

        self._layout = QGridLayout(self)

        # canvas
        gv = pg.GraphicsView()
        self._layout.addWidget(gv, 0, 0, 1, 1)

        # viewbox to house the image and crosshair
        self._vb = pg.ViewBox(enableMouse=False)
        self._vb.setAspectLocked()
        self._vb.invertY(True)
        gv.setCentralItem(self._vb)

        # image display
        self._image = pg.ImageItem()
        self._image.setOpts(axisOrder="row-major")
        self._vb.addItem(self._image, ignoreBounds=False)

        # crosshair
        self._vline = pg.InfiniteLine(angle=90, movable=False)
        self._hline = pg.InfiniteLine(angle=0, movable=False)

        # camera and its threads
        self._camera = camera
        self._camera.acquired_new_frame.connect(self.on_acquired_new_frame)
        self._camera.timeout.connect(self.on_timeout)

        self._thread = QThread()
        self._camera.moveToThread(self._thread)
        self._thread.started.connect(self._camera.run)
        self._thread.finished.connect(self._camera.finished)

    def start(self) -> None:
        self._thread.start()

    def stop(self) -> None:
        self._thread.quit()
        self._thread.wait()

    @Slot()
    def on_timeout(self):
        logger.error("camera timeout, attempt to reset")
        self.stop()
        self.start()

    @Slot(QDateTime, np.ndarray)
    def on_acquired_new_frame(self, timestamp: QDateTime, image: np.ndarray) -> None:
        logger.info(f"new frame, {timestamp}")
        self._image.setImage(image, autoLevels=True)

    @Slot(bool)
    def on_update_tracker_state(self, state: bool) -> None:
        if state:
            if self._vline not in self._vb.addedItems:
                self._vb.addItem(self._vline)
            if self._hline not in self._vb.addedItems:
                self._vb.addItem(self._hline)
        else:
            if self._vline in self._vb.addedItems:
                self._vb.removeItem(self._vline)
            if self._hline in self._vb.addedItems:
                self._vb.removeItem(self._hline)

    @Slot(float, float)
    def on_update_tracker_position(self, x: float, y: float) -> None:
        self._vline.setPos(x)
        self._hline.setPos(y)

