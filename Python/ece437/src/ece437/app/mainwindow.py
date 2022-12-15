from PySide2.QtWidgets import QMainWindow
import numpy as np
from .viewer import CameraViewerWidget
from .camera import CameraWorker
from ece437.ok import OKFrontPanel

class MainWindow(QMainWindow):
    def __init__(self, fp: OKFrontPanel, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self._fp = fp

        self.setup_viewer()

    def setup_viewer(self)->None:
        camera = CameraWorker(self._fp, refresh_rate=40)
        viewer = CameraViewerWidget(camera)
        self.setCentralWidget(viewer)

        viewer.start()

        # FIXME simple hack to match window with the image
        self.resize(viewer.width(), viewer.height())