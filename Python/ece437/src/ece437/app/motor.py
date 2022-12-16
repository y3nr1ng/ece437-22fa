from PySide2.QtCore import QObject, QTimer, Slot
from .qt import AbstractQObject
import logging
from abc import abstractmethod
from ece437.presets import PMOD_1_ENDPOINTS
from ece437.ok import OKFrontPanel
from ece437.pmod import PMOD, PMODDirection

__all__ = ["BaseMotorWorker", "MotorWorker"]

logger = logging.getLogger(__name__)


class BaseMotorWorker(QObject, metaclass=AbstractQObject):
    def __init__(self, update_rate: float = 20) -> None:
        super().__init__()
        self._px_to_steps = 1

        self._update_rate = update_rate
        self._pv = 0  # motor offset measurement

        self._controller = self._pid(k_p=0.2, k_i=0, k_d=0)
        self._controller.send(None)

    @property
    def update_rate(self) -> float:
        """Motor update rate."""
        return self._update_rate

    @property
    def update_interval(self) -> int:
        """Motor update interval in milliseconds."""
        return round(1000 / self.update_rate)

    def calibrate(self, ratio: float) -> None:
        """Conversion factor from pixels to motor steps."""
        self._px_to_steps = ratio

    def run(self) -> None:
        self._timer = QTimer()
        self._timer.timeout.connect(self.update_motor_pos)
        self._timer.setInterval(self.update_interval)

        self._timer.start()

    def finished(self) -> None:
        self._timer.stop()

    def move(self, dist: float) -> None:
        steps = int(round(dist * self._px_to_steps))
        if abs(steps) < 3:
            return
        logger.debug(f"move {dist:.2f} px ({steps} steps)")
        self.move_steps(steps)

    @abstractmethod
    def move_steps(self, steps: int):
        """Move motor toward specified number of pulses."""

    @Slot(float)
    def on_new_object_offset(self, offset: float) -> None:
        logger.info(f"new_object_offset, offset={offset:.2f}")
        self._pv = offset

    def update_motor_pos(self) -> None:
        #x = self._controller.send([self.update_interval, 0, self._pv])
        x = self._pv
        self.move(-x)

    def _pid(self, k_p: float = 1, k_i: float = 0, k_d: float = 0, MV_bar=0):
        # initialized stored data
        e_prev = 0
        t_prev = 0
        I = 0

        # initial control
        MV = MV_bar

        while True:
            # yield x, wait for new t, pv, sp
            t, pv, sp = yield MV

            e = sp - pv

            P = k_p * e
            I = I + k_i * e * (t - t_prev)
            D = k_d * (e - e_prev) / (t - t_prev)

            MV = MV_bar + P + I + D

            # update stored data
            e_prev = e
            t_prev = t


class MotorWorker(BaseMotorWorker):
    def __init__(self, fp: OKFrontPanel, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

        self._pmod = PMOD(fp, PMOD_1_ENDPOINTS)

    def run(self) -> None:
        self._pmod.open()
        super().run()

    def finished(self) -> None:
        super().finished()
        self._pmod.close()

    def move_steps(self, steps: int) -> None:
        if steps == 0:
            return
        direction = PMODDirection.Reverse if steps > 0 else PMODDirection.Forward
        self._pmod.start(
            abs(steps), direction, block=False
        )  # NOTE in general, don't block

    def on_new_object_offset(self, offset: float) -> None:
        # ignore signal if motor is still running
        if not self._pmod._is_motor_done():
            return
        super().on_new_object_offset(offset)
