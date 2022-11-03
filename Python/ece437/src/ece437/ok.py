import logging
import os

import ok

logger = logging.getLogger(__name__)

class OKFrontPanel:
    def __init__(self, serial='', firmware_path = None):
        self._device = None
        self._serial = serial
        self._firmware_path = firmware_path
        
        self._device_info = None
        
    def __enter__(self):
        self._device = ok.okCFrontPanel()
        self.open()
        
        return self
    
    def __exit__(self, *exc_args):
        self.close()
        
        del self._device
        self._device = None
    
    @property
    def device_id(self) -> str:
        """Device ID string."""
        return self._device_info.deviceID
    
    @property
    def serial_number(self) -> str:
        """Device serial number."""
        return self._device_info.serialNumber
    
    def open(self):
        if self._device is None:
            raise RuntimeError("please wrap the class with context statement")
        status = self._device.OpenBySerial(self._serial)
        self.parse_error_code(status)
        
        if self._firmware_path is not None:
            if not os.path.exists(self._firmware_path):
                raise ValueError(f'firmware file does not exist')
            logger.info(f"upload firmware '{self._firmware_path}'")
            self._device.ConfigureFPGA(self._firmware_path)
        
        device_info = ok.okTDeviceInfo()
        status = self._device.GetDeviceInfo(device_info)
        self.parse_error_code(status)
        self._device_info = device_info
        
    def close(self):
        self._device.Close()
        self._device_info = None
    
    @staticmethod
    def parse_error_code(code):
        lut = {
            0: (None, 'success'),
            -1: (RuntimeError, 'non-descriptive failure'),
            -2: (TimeoutError, 'transfer timed out'),
            # TODO need to add reset of the errors
        }
        klass, message = lut.get(code, (RuntimeError, f'unknown error code ({code})'))
        if klass:
            raise klass(message)
