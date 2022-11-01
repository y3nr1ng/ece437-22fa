import logging
import time
from abc import ABC, abstractmethod
from collections import namedtuple
from typing import Iterable, List, Union

from ece437.ok import OKFrontPanel

logger = logging.getLogger(__name__)

class BaseSPIController(ABC):
    def __enter__(self):
        self.reset()
        return self

    def __exit__(self, *exc_args):
        pass
    
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
    def __init__(self, 
        fp: OKFrontPanel, 
        endpoints: SPIControllerEndpoints,
        max_retries: int = 10,
        max_timeout: int = 500,
        max_buffer_length: int = 64
    ) -> None:
        # we will use our private implementation for now
        self._device = fp._device

        self._endpoints = endpoints

        self._max_retires = max_retries
        self._timeout = float(max_timeout) / max_retries
        self._timeout /= 1000 # time.sleep uses second as unit

        # preamble buffer for each transaction
        self._preamble = []
        self._max_buffer_length = max_buffer_length

    def reset(self) -> None:
        """Reset the controller state machine and buffers."""
        logger.info('reset SPI controller')
        self._device.SetWireInValue(self._endpoints.RESET, 1 << self._endpoints.RESET_MASK)
        self._device.UpdateWireIns()
        self._device.SetWireInValue(self._endpoints.RESET, 0x00)
        self._device.UpdateWireIns()

    def configure(self, n_starts: int, n_stops: int, preamble: Iterable[int]) -> None:
        """
        Configure the preamble for the transaction.
        
        Args:
            n_starts (int): 
            n_stops (int):
            preamble (Iterable[int]): 
        """
        self._preamble = [
            len(preamble),  # preamble length
            n_starts,       # the frame that require starts
            n_stops,        # the frame that require stops
            None            # payload length
        ] + list(preamble)

    def write_to(self, reg_addr: int, reg_value: Union[int, Iterable[int]]) -> None:
        """
        TB
        
        Args:
            reg_addr (int):
            reg_value (int or Iterable[int]): 
        """
        preamble = [
            (reg_addr & 0x7f) | 0x80,    # register address (W)
        ]
        self.configure(0x00, 0x00, preamble)

        self.transmit(reg_value)

    def read_from(self, reg_addr: int, length: int) -> Iterable[int]:
        """TBD
        
        Args:
            reg_addr (int):
            length (int, optional): number of bytes to read from the device
        """
        preamble = [
            reg_addr & 0x7f,    # register address (R)
        ]
        self.configure(0x00, 0x00, preamble)
        
        return self.receive(length)

    def transmit(self, data: Iterable[int]) -> None:
        if not data:
            return
        
        length = len(data)
        if length - len(self._preamble) >= self._max_buffer_length:
            raise ValueError('data exceeds buffer size')
        
        # reset memory pointer and transfer the buffer
        self._preamble[3] = length
        tx_buf = self._preamble + list(data)
        self._reset_memory_pointer()
        self._write_memory(tx_buf)
        
        # start the transaction
        self._start_transaction()

        # wait for the transaction to finish
        for _ in range(self._max_retires):
            if self._is_transaction_complete():
                logger.debug('.. [TO] done')
                break
            time.sleep(self._timeout)
        else:
            raise TimeoutError('unable to complete transmit')

    def receive(self, length: int):
        if length == 0:
            return tuple()
        elif length < 0:
            length = self._max_buffer_length - len(self._preamble) - 1
        elif length - len(self._preamble) >= self._max_buffer_length:
            raise ValueError('request exceeds buffer size')
            
        # reset memory pointer and transfer the buffer
        self._preamble[0] |= 0x80
        self._preamble[3] = length
        self._reset_memory_pointer()
        self._write_memory(self._preamble)
            
        # start the transaction
        self._start_transaction()

        # wait for the transaction to finish
        for _ in range(self._max_retires):
            if self._is_transaction_complete():
                logger.debug('.. [TO] done')
                self._reset_memory_pointer()
                data = self._read_memory(length)
                return tuple(data)
            time.sleep(self._timeout)
        else:
            raise TimeoutError('unable to complete receive')

    def _start_transaction(self) -> None:
        self._device.ActivateTriggerIn(self._endpoints.TRIGGER_IN, self._endpoints.START_MASK)
        logger.debug('.. [TI] start')

    def _is_transaction_complete(self) -> bool:
        self._device.UpdateTriggerOuts()
        return self._device.IsTriggered(self._endpoints.TRIGGER_OUT, 1 << self._endpoints.DONE_MASK)

    def _reset_memory_pointer(self) -> None:
        self._device.ActivateTriggerIn(self._endpoints.TRIGGER_IN, self._endpoints.MEM_RESET_MASK)
        logger.debug('.. [TI] mem ptr reset')

    def _write_memory(self, buffer: Iterable[int]) -> None:
        for byte in buffer:
            logger.debug(f'.. [WI] {byte:02x}')
            self._device.SetWireInValue(self._endpoints.DATA_IN, byte, 0x00ff)
            self._device.UpdateWireIns()
            self._device.ActivateTriggerIn(self._endpoints.TRIGGER_IN, self._endpoints.MEM_WRITE_MASK)
            logger.debug('.. [TI] mem write')

    def _read_memory(self, length: int) -> List[int]:
        data = []
        for _ in range(length):
            self._device.UpdateWireOuts()
            byte = self._device.GetWireOutValue(self._endpoints.DATA_OUT)
            logger.debug(f'.. [WO] {byte:02x}')
            data.append(byte)
            self._device.ActivateTriggerIn(self._endpoints.TRIGGER_IN, self._endpoints.MEM_READ_MASK)
            logger.debug('.. [TI] mem read')
        return data
