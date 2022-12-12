import logging
from typing import Tuple, Any
from collections import namedtuple
from ece437.ok import OKFrontPanel
from ece437.spi import BaseSPIController
import time
import numpy as np

__all__ = ["CMV300"]

logger = logging.getLogger(__name__)

CMV300Endpoints = namedtuple(
    "CMV300Endpoints",
    [
        "RESET",
        "TRIGGER_IN",
        "TRIGGER_OUT",
        "PIPE",
        "RESET_MASK",
        "START_MASK",
        "DONE_MASK",
    ],
)


class CMV300:
    """
    Wrapper class that represents an CMV300 imaging sensor.
    
    Args:
        TBD
    """

    def __init__(
        self,
        fp: OKFrontPanel,
        spi: BaseSPIController,
        endpoints: CMV300Endpoints,
        max_retries: int = 10,
        max_timeout: int = 500,
    ) -> None:
        self._fp = fp
        self._device = None
        self._spi = spi
        self._endpoints = endpoints

        self._max_retires = max_retries
        self._timeout = float(max_timeout) / max_retries
        self._timeout /= 1000  # time.sleep uses second as unit

        self._shape = (488, 648)

    def __enter__(self):
        self._device = self._fp._device

        self.reset()
        return self
    
    def __exit__(self, *exc_args):
        self._device = None
        
    @property
    def shape(self) -> Tuple[int, int]:
        """Get acquired image shape."""
        return self._shape

    def reset(self) -> None:
        """Reset the controller."""
        logger.debug("reset CMV300 sequencer")
        self._device.SetWireInValue(
            self._endpoints.RESET, 1 << self._endpoints.RESET_MASK
        )
        self._device.UpdateWireIns()
        self._device.SetWireInValue(self._endpoints.RESET, 0x00)
        self._device.UpdateWireIns()

        self._configure_bus()

    def set_shape(self) -> None:
        pass

    def get_image(self) -> Any:
        # build buffer
        ny, nx = self._shape
        block_size = 1024
        buf = bytearray(block_size * 308)

        self._start_acquire()

        # wait for the acquisition to finish
        for _ in range(self._max_retires):
            if self._is_acquired():
                logger.debug(".. [TO] done")
                break
            time.sleep(self._timeout)
        else:
            raise TimeoutError(f"get_image timeout after {self._timeout * 1000:d} ms")

        # start pulling image from pipe
        n_bytes_read = self._device.ReadFromBlockPipeOut(0xa0, 1024, buf)
        logger.info(f'ret={n_bytes_read}')

        buf = buf[:nx * (ny-2)]
        im = np.frombuffer(buf, dtype=np.uint8)
        im = np.reshape(im, (ny-2, nx))

        return im

    def _configure_bus(self) -> None:
        """
        These are bare minimum configurations for CMOS to work.
        """
        configs = {
            57: 3,  # 1 output, CMOS
            68: 1,  # 10-bit mode
            69: 9,  # export CLK_OUT
        }
        for reg_addr, reg_val in configs.items():
            logger.debug(".. [{reg_addr:02x}]={reg_val}")
            self._spi.write_to(reg_addr, [reg_val])

    def _start_acquire(self) -> None:
        self._device.ActivateTriggerIn(
            self._endpoints.TRIGGER_IN, self._endpoints.START_MASK
        )
        logger.debug(".. start acquire frame")

    def _is_acquired(self) -> bool:
        self._device.UpdateTriggerOuts()
        return self._device.IsTriggered(
            self._endpoints.TRIGGER_OUT, 1 << self._endpoints.DONE_MASK
        )
