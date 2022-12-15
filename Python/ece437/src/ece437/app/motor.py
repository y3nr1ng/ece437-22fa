from PySide2.QtCore import QObject
from .qt import AbstractQObject
import logging
from abc import abstractmethod
from ece437.presets import PMOD_1_ENDPOINTS
from ece437.ok import OKFrontPanel
from ece437.pmod import PMOD, PMODDirection

__all__ = ["BaseMotorWorker"]

logger = logging.getLogger(__name__)


class BaseMotorWorker(QObject, metaclass=AbstractQObject):
    def __init__(self) -> None:
        super().__init__()
        self._px_to_steps = 1

    def calibrate(self, ratio: float) -> None:
        self._px_to_steps = ratio

    def run(self) -> None:
        pass

    def finished(self) -> None:
        pass

    def move(self, dist) -> None:
        steps = int(round(dist * self._px_to_steps))
        logger.debug(f"move {dist:.2f} px ({steps} steps)")
        self.move_steps(steps)

    @abstractmethod
    def move_steps(self, steps: int):
        """Move motor toward specified number of pulses."""

    def on_new_object_offset(self, offset: float) -> None:
        self.move(offset)

class MotorWorker(BaseMotorWorker):
    def __init__(self, fp: OKFrontPanel, *args, **kwargs) -> None:
        super().__init__(*args, **kwargs)

        self._pmod = PMOD(fp, PMOD_1_ENDPOINTS)

    def run(self) -> None:
        self._pmod.open()

    def finished(self) -> None:
        self._pmod.close()

    def move_steps(self, steps: int) -> None:
        if steps == 0:
            return

        direction = PMODDirection.Reverse if steps > 0 else PMODDirection.Forward
        self._pmod.start(abs(steps), direction, block=False) # NOTE in general, don't block

    def on_new_object_offset(self, offset: float) -> None:
        # ignore signal if motor is still running
        if not self._pmod._is_motor_done():
            return

        super().on_new_object_offset(offset)
