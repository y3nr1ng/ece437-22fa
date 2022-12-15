import logging
import os
from typing import Tuple
from typing import Optional

import ok

logger = logging.getLogger(__name__)


class OKFrontPanel:
    def __init__(self, serial="", firmware_path=None):
        self._devices = ok.okCFrontPanelDevices()

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
        n_devices = self._devices.GetCount()
        if n_devices < 1:
            raise RuntimeError("unable to find OK device")
        logger.info(f'found {n_devices} devices on this system')
        serials = tuple(self._devices.GetSerial(index) for index in range(n_devices))
        return serials

    def open(self):
        if self._device is None:
            raise RuntimeError("please wrap the class with context statement")

        serials = self.enumerate()
        if self._serial:
            try:
                serials.index(self._serial)
            except ValueError:
                raise ValueError(f"no device with serial '{self._serial}'")
        else:
            self._serial = serials[0]
            if len(serials) > 1:
                logger.warning(
                    f"found multiple devices, use the first one, serial='{self._serial}'"
                )
        self._device = self._devices.Open(self._serial)

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
    def parse_error_code(code, message: Optional[str] = None):
        lut = {
            0: (None, "success"),
            -1: (RuntimeError, "non-descriptive failure"),
            -2: (TimeoutError, "transfer timed out"),
            -3: (RuntimeError, "configuration failure due to DONE not high"),
            -4: (RuntimeError, "transfer error"),
            -5: (RuntimeError, "communication error"),
            -6: (ValueError, "invalid bistream"),
            -7: (ValueError, "file could not be opened"),
            -8: (RuntimeError, "device is not open or is no longer available"),
            -9: (RuntimeError, "invalid FP endpoint"),
            -10: (ValueError, "invalid block size"),
            -15: (NotImplementedError, "requested action is not supported"),
            -19: (ValueError, "invalid reset profile"),
            -20: (ValueError, "invalid parameter")
        }
        klass, desc = lut.get(code, (RuntimeError, f"unknown error code ({code})"))
        if klass:
            if message is None:
                message = desc
            else:
                message = f"{desc}, {message}"
            raise klass(message)
