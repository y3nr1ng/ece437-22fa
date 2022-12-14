from PySide2.QtWidgets import QMainWindow
import numpy as np
from .viewer import CameraViewerWidget
from ece437.ok import OKFrontPanel

class MainWindow(QMainWindow):
    def __init__(self, fp: OKFrontPanel, *args, **kwargs):
        super().__init__(*args, **kwargs)

        viewer = CameraViewerWidget(fp)
        self.setCentralWidget(viewer)

        self.show()
