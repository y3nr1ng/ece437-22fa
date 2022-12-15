import logging
import os
from typing import Tuple
from typing import Optional

import ok

logger = logging.getLogger(__name__)


class OKFrontPanel:
    def __init__(self, serial="", firmware_path=None):
        self._device = ok.okCFrontPanel()
        self._serial = serial
        self._firmware_path = firmware_path

        self._device_info = None

    def __enter__(self):
        self.open()
        return self

    def __exit__(self, *exc_args):
        self.close()

    @property
    def device_id(self) -> str:
        """Device ID string."""
        return self._device_info.deviceID

    @property
    def serial_number(self) -> str:
        """Device serial number."""
        return self._device_info.serialNumber

    def enumerate(self) -> Tuple[str]:
        """Return serial number of available devices."""
        devices = ok.okCFrontPanelDevices()
        n_devices = devices.GetCount()
        if n_devices < 1:
            raise RuntimeError("unable to find OK device")
        serials = tuple(devices.GetSerial(index) for index in range(n_devices))
        return serials

    def open(self):
        if self._device is None:
            raise RuntimeError("please wrap the class with context statement")
        
        self.enumerate()
        status = self._device.OpenBySerial(self._serial)
        self.parse_error_code(status)

        if self._firmware_path is not None:
            if not os.path.exists(self._firmware_path):
                logger.error(f"firmware file does not exist")
            else:
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
    def parse_error_code(code, message: Optional[str]=None):
        lut = {
            0: (None, "success"),
            -1: (RuntimeError, "non-descriptive failure"),
            -2: (TimeoutError, "transfer timed out"),
            # TODO need to add reset of the errors
        }
        klass, desc = lut.get(code, (RuntimeError, f"unknown error code ({code})"))
        if klass:
            if message is None:
                message = desc
            else:
                message = f'{desc}, {message}'
            raise klass(message)
