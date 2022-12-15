from PySide2.QtWidgets import QMainWindow
import numpy as np
from .viewer import CameraViewerWidget
from .camera import CameraWorker
from ece437.ok import OKFrontPanel
from .tracker import TrackerWidget

class MainWindow(QMainWindow):
    def __init__(self, fp: OKFrontPanel, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self._fp = fp

        self.camera = CameraWorker(self._fp, refresh_rate=20)
        self.viewer = CameraViewerWidget(self.camera)
        self.tracker = TrackerWidget()

        self.setup_viewer()
        self.setup_tracker()

        # FIXME simple hack to match window with the image
        self.resize(self.viewer.width(), self.viewer.height())

        self.start()

    def setup_viewer(self)->None:
        self.setCentralWidget(self.viewer)

    def setup_tracker(self): 
        self.camera.acquired_new_frame.connect(self.tracker.on_acquired_new_frame)

        self.tracker.update_tracker_state.connect(self.viewer.on_update_tracker_state)
        self.tracker.update_tracker_position.connect(self.viewer.on_update_tracker_position)
        
    def start(self) -> None:
        self.viewer.start()
        #self.tracker.start()