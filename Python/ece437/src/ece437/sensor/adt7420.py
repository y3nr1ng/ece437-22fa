from ece437.i2c import BaseI2CController
import logging

__all__ = ["ADT7420"]

logger = logging.getLogger(__name__)


class ADT7420:
    """
    Wrapper class that represents an ADT7420 temperature sensor.
    
    Args:
        i2c (BaseI2CController): a fully initialized I2C controller instance
        a0 (int, optional):
        a1 (int, optional):
    """

    TEMPERATURE_VALUE = 0x00
    STATUS = 0x02
    CONFIGURATION = 0x03
    ID = 0x0B

    def __init__(self, i2c: BaseI2CController, a0: int = 1, a1: int = 1):
        self._i2c = i2c
        self._dev_addr = 0x48 | (a1 << 1) | (a0)

        self._resolution = 13  # default power up resolution

    @property
    def resolution(self):
        """Current temperature resolution in bits."""
        return self._resolution

    def set_resolution(self):
        raise NotImplementedError

    def get_temperature(self) -> float:
        """
        Get the temperature.
        
        Returns:
            (float): converted current temperature readout.
        """
        adc = self._i2c.read_from(self._dev_addr, self.TEMPERATURE_VALUE, 2)
        return self.bytes_to_temperature(adc, bits=self._resolution)

    @staticmethod
    def bytes_to_temperature(data, bits: int = 13):
        """Helper function to convert the temperature."""
        msb, lsb = data
        data = (msb << 8 | lsb) >> (16 - bits)
        return float(data) / 16
