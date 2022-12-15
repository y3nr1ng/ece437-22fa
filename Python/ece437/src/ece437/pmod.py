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
        self._fp = fp
        self._device = None

        self._endpoints = endpoints

        self._last_ctrl_value = 0

    def __enter__(self):
        self.open()
        return self

    def __exit__(self, *exc_args):
        self.close()

    def open(self):
        self._device = self._fp._device
        self.reset()

    def close(self) -> None:
        self._device = None

    def reset(self):
        logger.debug('reset pmod')
        self._device.SetWireInValue(self._endpoints.RESET, 1 << self._endpoints.RESET_MASK)
        self._device.UpdateWireIns()
        self._device.SetWireInValue(self._endpoints.RESET, 0x00)
        self._device.UpdateWireIns()

    def start(self, n_pulses: int, dir: PMODDirection, block: bool=False) -> None:
        #if not self._is_motor_done():
        #    return

        value = (n_pulses & 0x00FFFFFF) | dir
        if value != self._last_ctrl_value:
            logger.debug(f'update pwm control, reg_val={value:>032b}')
            self._device.SetWireInValue(self._endpoints.CONTROL, value)
            self._device.UpdateWireIns()
            self._last_ctrl_value = value

        self._start_pwm()

        if block:
            logger.info(f'blocking, is_motor_done?')
            while True:
                if self._is_motor_done():
                    logger.info(f'blocking, DONE')
                    break

    def _start_pwm(self) -> None:
        self._device.ActivateTriggerIn(self._endpoints.TRIGGER_IN, self._endpoints.START_MASK)
        logger.info('motor start')

    def _is_motor_done(self) -> bool:
        self._device.UpdateTriggerOuts()
        return self._device.IsTriggered(self._endpoints.TRIGGER_OUT, 1 << self._endpoints.DONE_MASK)
