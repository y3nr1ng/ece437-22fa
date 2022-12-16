from PySide2.QtWidgets import QMainWindow
import numpy as np
from .viewer import CameraViewerWidget
from .camera import CameraWorker
from ece437.ok import OKFrontPanel
from .tracker import TrackerWidget
from .motor import MotorWorker
import logging
from .sensor import SensorWidget, SensorWorker

__all__ = ['MainWindow']

logger = logging.getLogger(__name__)

class MainWindow(QMainWindow):
    def __init__(self, fp: OKFrontPanel, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.camera = CameraWorker(fp, refresh_rate=20)
        self.viewer = CameraViewerWidget(self.camera)
        self.motor = MotorWorker(fp)
        self.motor.calibrate(0.1)
        self.tracker = TrackerWidget(self.motor)
        self.sensor = SensorWorker(fp, update_rate=100)
        self.sensor_dump = SensorWidget(self.sensor)

        self.camera.acquired_new_frame.connect(self.viewer.on_acquired_new_frame)
        self.camera.acquired_new_frame.connect(self.tracker.on_acquired_new_frame)
        self.camera.timeout.connect(self.viewer.on_timeout)

        self.tracker.update_tracker_state.connect(self.viewer.on_update_tracker_state)
        self.tracker.update_tracker_position.connect(self.viewer.on_update_tracker_position)
        
        # NOTE use direct variable access right now, thread unsafe?
        #self.tracker.new_object_offset.connect(self.motor.on_new_object_offset)

        self.setCentralWidget(self.viewer)

        # FIXME simple hack to match window with the image
        self.resize(self.viewer.width(), self.viewer.height())

        self.start()
        
    def start(self) -> None:
        self.viewer.start()
        self.tracker.start()
        #self.sensor_dump.start()

    def closeEvent(self, event) -> None:
        self.tracker.stop()
        self.viewer.stop()
        #self.sensor_dump.stop()

        super().closeEvent(event)