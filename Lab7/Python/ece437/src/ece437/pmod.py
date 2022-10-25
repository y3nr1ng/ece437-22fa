import logging
from collections import namedtuple
from enum import IntEnum
import time

from ece437.ok import OKFrontPanel

logger = logging.getLogger(__name__)

__all__ = ['PMODType5Endpoints', 'PMOD']

PMODType5Endpoints = namedtuple(
    'PMODType5Endpoints', 
    [
        'RESET', 
        'CONTROL',
        'TRIGGER_IN',
        'TRIGGER_OUT',

        'RESET_MASK',

        'START_MASK',
        'DONE_MASK'
    ]
)

class PMODDirection(IntEnum):
    """Accelerometer data output rate."""

    Forward = 0x00000000
    """Forward"""

    Reverse = 0x80000000
    """Reverse"""

class PMOD:
    def __init__(
        self,
        fp: OKFrontPanel,
        endpoints: PMODType5Endpoints
    ):
        self._device = fp._device

        self._endpoints = endpoints

    def __enter__(self):
        self.reset()
        return self

    def __exit__(self, *exc_args):
        pass

    def reset(self):
        logger.debug('rest pmod')
        self._device.SetWireInValue(self._endpoints.RESET, 1 << self._endpoints.RESET_MASK)
        self._device.UpdateWireIns()
        self._device.SetWireInValue(self._endpoints.RESET, 0x00)
        self._device.UpdateWireIns()

    def start(self, n_pulses: int, dir: PMODDirection) -> None:
        value = (n_pulses & 0x00FFFFFF) | dir
        logger.info(f'control_reg={value:>032b}')
        self._device.SetWireInValue(self._endpoints.CONTROL, value)
        self._device.UpdateWireIns()

        self._start_pwm()

        for _ in range(5):
            if self._is_motor_done():
                logger.debug('.. [TO] done')
                return None
            time.sleep(1)
        else:
            raise TimeoutError('pmod timeout')

    def _start_pwm(self) -> None:
        self._device.ActivateTriggerIn(self._endpoints.TRIGGER_IN, self._endpoints.START_MASK)
        logger.debug('.. [TI] start')

    def _is_motor_done(self) -> bool:
        self._device.UpdateTriggerOuts()
        return self._device.IsTriggered(self._endpoints.TRIGGER_OUT, 1 << self._endpoints.DONE_MASK)
