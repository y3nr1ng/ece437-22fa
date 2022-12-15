import logging
from typing import Tuple, Any, ByteString
from collections import namedtuple
from ece437.ok import OKFrontPanel
from ece437.spi import BaseSPIController
import time
import numpy as np
import datetime

__all__ = ["CMV300", "CMV300Endpoints"]

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
        "READY_MASK",
        "DONE_MASK",
    ],
)


class CMV300:
    """
    Wrapper class that represents an CMV300 imaging sensor.
    
    Args:
        TBD
    """

    BLOCK_SIZE: int = 1024  # [bytes] for USB3

    def __init__(
        self,
        fp: OKFrontPanel,
        spi: BaseSPIController,
        endpoints: CMV300Endpoints,
        max_retries: int = 5,
        max_timeout: int = 25,
    ) -> None:
        self._fp = fp
        self._device = None
        self._spi = spi
        self._endpoints = endpoints

        self._max_retires = max_retries
        self._timeout = float(max_timeout) / max_retries
        self._timeout /= 1000  # time.sleep uses second as unit

        self._shape = (488, 648)
        self._buffer = None

    def __enter__(self):
        self.open()
        return self

    def __exit__(self, *exc_args):
        self._device = None

    @property
    def shape(self) -> Tuple[int, int]:
        """Get acquired image shape."""
        return self._shape

    @property
    def dtype(self):
        return np.dtype(np.uint8)

    @property
    def n_pixels(self) -> int:
        """Number of pixels per frame."""
        ny, nx = self._shape
        return nx * ny

    @property
    def n_bytes(self) -> int:
        """Number of bytes per frame."""
        return self.n_pixels * self.dtype.itemsize

    def open(self) -> None:
        self._device = self._fp._device
        self.reset()

    def close(self) -> None:
        self._device = None

    def reset(self) -> None:
        """Reset the controller."""
        logger.info("reset CMV300 sequencer")
        self._device.SetWireInValue(
            self._endpoints.RESET, 1 << self._endpoints.RESET_MASK
        )
        self._device.UpdateWireIns()
        self._device.SetWireInValue(self._endpoints.RESET, 0x00)
        self._device.UpdateWireIns()

        # adjust polling interval
        self._device.SetBTPipePollingInterval(5) # NOTE polling period for TRIG
        self._device.SetTimeout(100) # 100 ms
        # configure bus over spi, need this to use CMOS output
        self._configure_bus()

    def set_shape(self, shape) -> None:
        """Set the shape. Auto center the scanlines."""
        ny, nx = shape
        if nx != 648:
            nx = 648
            logger.warning("x coerce to 648 pixels")
        if ny < 1:
            ny = 1
            logger.warning("y has to >= 1")
        elif ny > 488:
            ny = 488
            logger.warning("y has to <= 488")

        self._shape = (ny, nx)

        # number of lines
        self._spi.write_to(1, ny & 0x0F)
        self._spi.write_to(2, ny >> 8)

        # start line
        oy = (488 - ny) // 2
        self._spi.write_to(3, oy & 0x0F)
        self._spi.write_to(4, oy >> 8)

        logger.info(f"updated shape (nx, ny)={shape[::-1]}, offset={oy}")

        # reset buffer
        self._buffer = None

    def set_exposure(self, t_exp: float) -> None:
        """
        Set exposure time in milliseconds.
        
        Args:
            t_exp (float): exposure time in ms
        """
        t_exp = int(t_exp * 1e6)
        for i in range(3):
            self._spi.write_to(42+i, t_exp & 0x0F)
            t_exp >>= 8

    def get_exposure(self) -> float:
        """
        Get exposure time in milliseconds.
        
        Returns:
            (float): exposure time in ms
        """
        t_exp = 0
        for reg_addr in (44, 43, 42):
            reg_val, = self._spi.read_from(reg_addr, 1)
            t_exp <<= 8
            t_exp += reg_val
        return float(t_exp) / 1e6

    def get_byte_buffer(self) -> ByteString:
        if self._buffer is not None:
            return self._buffer

        n_bytes_padded = self.round_to_blocksize(self.n_bytes)
        logger.debug(f'resize buffer to {n_bytes_padded} bytes')
        self._buffer = bytearray(n_bytes_padded)
        return self._buffer

    def get_image_array(self):
        buffer = self.get_byte_buffer()
        self._start_acquire()

        #self._wait_sys_ready()

        # start pulling image from pipe
        n_bytes_read = self._device.ReadFromBlockPipeOut(
            self._endpoints.PIPE, self.BLOCK_SIZE, buffer
        )
        if n_bytes_read < 0:
            raise TimeoutError(f"get_image[ReadBTPipe] timeout, retval={n_bytes_read}")
        self._wait_acquired()

        return np.frombuffer(buffer, dtype=self.dtype, count=self.n_pixels).reshape(self.shape)
        
    @classmethod
    def round_to_blocksize(cls, bytes) -> int:
        return cls.BLOCK_SIZE * round(bytes / cls.BLOCK_SIZE)

    def _wait_sys_ready(self) -> None:
        for _ in range(self._max_retires):
            if self._is_ready():
                logger.info("wait_sys_ready TRUE")
                break
            time.sleep(self._timeout)
        else:
            total_timeout = self._timeout * self._max_retires * 1000
            raise TimeoutError(f"wait_sys_ready timeout after {int(total_timeout)} ms")

    def _is_ready(self) -> bool:
        self._device.UpdateTriggerOuts()
        return self._device.IsTriggered(
            self._endpoints.TRIGGER_OUT, 1 << self._endpoints.READY_MASK
        )

    def _configure_bus(self) -> None:
        """
        Base minimum SPI settings for the sensor to work.

        Notes:
            Other advanced configurations should set them at other stages.
        """
        configs = {
            57: 3,  # 1 output, CMOS
            68: 2,  # 8-bit mode
            69: 9,  # export CLK_OUT
        }
        for reg_addr, reg_val in configs.items():
            logger.debug(".. [{reg_addr:02x}]={reg_val}")
            self._spi.write_to(reg_addr, [reg_val])

    def _start_acquire(self) -> None:
        self._device.ActivateTriggerIn(
            self._endpoints.TRIGGER_IN, self._endpoints.START_MASK
        )
        logger.debug("start acquiring frame")

    def _wait_acquired(self) -> None:
        for i in range(self._max_retires):
            if self._is_acquired():
                logger.info("wait_acquired TRUE")
                break
            time.sleep(self._timeout)
        else:
            total_timeout = self._timeout * self._max_retires * 1000
            raise TimeoutError(f"wait_acquired timeout after {int(total_timeout)} ms")

    def _is_acquired(self) -> bool:
        self._device.UpdateTriggerOuts()
        return self._device.IsTriggered(
            self._endpoints.TRIGGER_OUT, 1 << self._endpoints.DONE_MASK
        )
