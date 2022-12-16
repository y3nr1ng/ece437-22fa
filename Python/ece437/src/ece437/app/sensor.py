from PySide2.QtCore import Signal, Slot, QDateTime, QThread, QObject
from PySide2.QtWidgets import QWidget
import logging
from ece437.sensor import LSM303Accelerometer, LSM303Magnetometer
from ece437.presets import I2C_1_ENDPOINTS
from ece437.i2c import I2CController

__all__ = ['SensorWorker']

logger = logging.getLogger(__name__)

class SensorWorker(QObject):
    def __init__(self, fp, update_rate: float = 100) -> None:
        super().__init__()
        
        self.i2c1 = I2CController(fp, I2C_1_ENDPOINTS)
        self.acc = LSM303Accelerometer(self.i2c1)
        self.mag = LSM303Magnetometer(self.i2c1)
        self._update_rate = update_rate

    @property
    def update_rate(self) -> float:
        """Motor update rate."""
        return self._update_rate

    @property
    def update_interval(self) -> int:
        """Motor update interval in milliseconds."""
        return round(1000 / self.update_rate)

    def run(self) -> None:
        self.i2c1.open()
        self.acc.configure()
        self.mag.configure()

        self._timer = QTimer()
        self._timer.timeout.connect(self.dump_sensor_log)
        self._timer.setInterval(self.update_interval)

        self._timer.start()

    def finished(self) -> None:
        self._timer.stop()

        self.i2c1.close()

    def dump_sensor_log(self) -> None:
        x, y, z = self.acc.read()
        #logger.info(f'ACC: (x={x:.03f}, y={y:.03f}, z={z:.03f})')
        x, y, z = self.mag.read()
        #logger.info(f'MAG: (x={x:.03f}, y={y:.03f}, z={z:.03f})')

class SensorWidget(QWidget):
    def __init__(self, sensor) ->None:
        super().__init__()

        self._sensor = sensor

        self._thread = QThread()
        self._sensor.moveToThread(self._thread)
        self._thread.started.connect(self._sensor.run)
        self._thread.finished.connect(self._sensor.finished)

    def start(self) -> None:
        self._thread.start(priority=QThread.TimeCriticalPriority)

    def stop(self) -> None:
        self._thread.quit()
        self._thread.wait()
