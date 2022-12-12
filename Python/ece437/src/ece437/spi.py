import logging
import time
from abc import ABC, abstractmethod
from collections import namedtuple
from typing import Iterable, List, Union

from ece437.ok import OKFrontPanel

logger = logging.getLogger(__name__)

class BaseSPIController(ABC):
    def __init__(self, fp: OKFrontPanel) -> None:
        self._fp = fp
        self._device = None

    def __enter__(self):
        self._device = self._fp._device

        self.reset()
        return self

    def __exit__(self, *exc_args):
        self._device = None
    
    @abstractmethod
    def reset(self):
        """TBD"""

    @abstractmethod
    def transmit(self, data: Iterable[int]) -> None:
        """TBD"""

    @abstractmethod
    def receive(self, length: int) -> Iterable[int]:
        """TBD"""

SPIControllerEndpoints = namedtuple(
    'I2CControllerEndpoints', 
    [
        'RESET', 
        'DATA_IN', 
        'DATA_OUT',
        'TRIGGER_IN',
        'TRIGGER_OUT',

        'RESET_MASK',

        'START_MASK',
        'MEM_RESET_MASK',
        'MEM_WRITE_MASK',
        'MEM_READ_MASK',
        
        'DONE_MASK'
    ]
)

class SPIController(BaseSPIController):
    """
    TBD

    Args:
        fp (OKFrontPanel):
        endpoints (I2CControllerEndpoints):
        max_retires (int, optional): maximum retries before raising exception
        max_timeout (int, optional): maximum timeout of a transaction in milliseconds
    """

    # command memory store index
    PREAMBLE_LENGTH_INDEX: int = 0
    PAYLOAD_LENGTH_INDEX: int = 1

    # implementation
    MAX_BUFFER_LENGTH: int = 64

    def __init__(self, 
        fp: OKFrontPanel, 
        endpoints: SPIControllerEndpoints,
        max_retries: int = 10,
        max_timeout: int = 500
    ) -> None:
        super().__init__(fp)
        
        self._endpoints = endpoints

        self._max_retires = max_retries
        self._timeout = float(max_timeout) / max_retries
        self._timeout /= 1000 # time.sleep uses second as unit

        # preamble buffer
        self._preamble = []
        # final transaction buffer
        self._buffer = []

    def reset(self) -> None:
        """Reset the controller state machine and buffers."""
        logger.info('reset SPI controller')
        self._device.SetWireInValue(self._endpoints.RESET, 1 << self._endpoints.RESET_MASK)
        self._device.UpdateWireIns()
        self._device.SetWireInValue(self._endpoints.RESET, 0x00)
        self._device.UpdateWireIns()

    def write_to(self, reg_addr: int, reg_value: Union[int, Iterable[int]]) -> None:
        """
        Write to slave register.
        
        Args:
            reg_addr (int):
            reg_value (int or Iterable[int]): 
        """
        self._configure_preamble(reg_addr, True)

        if isinstance(reg_value, int):
            reg_value = list(reg_value)
        self.transmit(reg_value)

    def read_from(self, reg_addr: int, length: int) -> Iterable[int]:
        """
        Read from slave register
        
        Args:
            reg_addr (int):
            length (int, optional): number of bytes to read from the device
        """
        self._configure_preamble(reg_addr, False)
        return self.receive(length)

    def _configure_preamble(self, reg_addr: int, write: bool) -> None:
        addr = (reg_addr & 0x7f)
        preamble_length = 1

        if write:
            addr |= 0x80
        else:
            preamble_length |= 0x80

        self._preamble = [
            preamble_length,    # preamble length
            None,               # payload length
            addr                # preamble, register address
        ]

    def transmit(self, data: Iterable[int]) -> None:
        if not data:
            return
        
        length = len(data)
        if length - len(self._preamble) >= self.MAX_BUFFER_LENGTH:
            raise ValueError('data exceeds buffer size')
        
        # reset memory pointer and transfer the buffer
        self._preamble[self.PAYLOAD_LENGTH_INDEX] = length
        buffer = self._preamble + list(data)
        self._reset_memory_pointer()
        self._write_memory(buffer)
        
        # start the transaction
        self._start_transaction()

        # wait for the transaction to finish
        for _ in range(self._max_retires):
            if self._is_transaction_complete():
                logger.debug('.. tx done')
                break
            time.sleep(self._timeout)
        else:
            raise TimeoutError('unable to complete transmit')

    def receive(self, length: int):
        if length == 0:
            return tuple()
        elif length < 0:
            length = self._max_buffer_length - len(self._preamble) - 1
        elif length - len(self._preamble) >= self.MAX_BUFFER_LENGTH:
            raise ValueError('request exceeds buffer size')
            
        # reset memory pointer and transfer the buffer
        self._preamble[self.PAYLOAD_LENGTH_INDEX] = length
        self._reset_memory_pointer()
        self._write_memory(self._preamble)
            
        # start the transaction
        self._start_transaction()

        # wait for the transaction to finish
        for _ in range(self._max_retires):
            if self._is_transaction_complete():
                logger.debug('.. rx done')
                self._reset_memory_pointer()
                data = self._read_memory(length)
                return tuple(data)
            time.sleep(self._timeout)
        else:
            raise TimeoutError('unable to complete receive')

    def _start_transaction(self) -> None:
        self._device.ActivateTriggerIn(self._endpoints.TRIGGER_IN, self._endpoints.START_MASK)
        logger.debug('.. start transaction')

    def _is_transaction_complete(self) -> bool:
        self._device.UpdateTriggerOuts()
        return self._device.IsTriggered(self._endpoints.TRIGGER_OUT, 1 << self._endpoints.DONE_MASK)

    def _reset_memory_pointer(self) -> None:
        self._device.ActivateTriggerIn(self._endpoints.TRIGGER_IN, self._endpoints.MEM_RESET_MASK)
        logger.debug('.. mem ptr reset')

    def _write_memory(self, buffer: Iterable[int]) -> None:
        if buffer == self._buffer:
            # early quit
            return
        self._buffer = buffer

        for byte in buffer:
            self._device.SetWireInValue(self._endpoints.DATA_IN, byte, 0x00ff)
            self._device.UpdateWireIns()
            self._device.ActivateTriggerIn(self._endpoints.TRIGGER_IN, self._endpoints.MEM_WRITE_MASK)
            logger.debug(f'.. mem write (0x{byte:02x})')

    def _read_memory(self, length: int) -> List[int]:
        data = []
        for _ in range(length):
            self._device.UpdateWireOuts()
            byte = self._device.GetWireOutValue(self._endpoints.DATA_OUT)
            data.append(byte)
            self._device.ActivateTriggerIn(self._endpoints.TRIGGER_IN, self._endpoints.MEM_READ_MASK)
            logger.debug(f'.. mem read (0x{byte:02x})')
        return data
