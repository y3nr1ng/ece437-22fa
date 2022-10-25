import logging
from enum import IntEnum
from typing import Tuple

from ece437.i2c import BaseI2CController

__all__ = ["LSM303Accelerometer", 'LSM303Magnetometer']

logger = logging.getLogger(__name__)

class LM303AccelerometerDataRate(IntEnum):
    """Accelerometer data output rate."""

    RATE_1 = 0x01
    """1 Hz"""
    
    RATE_10 = 0x02
    """10 Hz"""

    RATE_25 = 0x03
    """25 Hz"""

    RATE_50 = 0x04
    """50 Hz"""

    RATE_100 = 0x05 
    """100 Hz"""

    RATE_200 = 0x06 
    """200 Hz"""

    RATE_400 = 0x07
    """400 Hz"""

    RATE_1344 = 0x09 
    """1.344 kHz"""

class LM303AccelerometerFullScale(IntEnum):
    SCALE_2g = 0b00
    """+- 2 g"""

    SCALE_4g = 0b01
    """+- 4 g"""
    
    SCALE_8g = 0b10
    """+- 8 g"""
    
    SCALE_16g = 0b11
    """+- 16 g"""
    
class LSM303Accelerometer:
    """
    Wrapper class that represents the accelerometer in an LSM303 eCompass module.
    
    Args:
        i2c (BaseI2CController): a fully initialized I2C controller instance
    """

    ADDRESS = 0b0011001

    CTRL_REG1_A = 0x20
    CTRL_REG2_A = 0x21
    CTRL_REG3_A = 0x22
    CTRL_REG4_A = 0x23
    CTRL_REG5_A = 0x24
    STATUS_REG_A = 0x25
    OUT_X_L_A = 0x28
    OUT_X_H_A = 0x29
    OUT_Y_L_A = 0x2A
    OUT_Y_H_A = 0x2B
    OUT_Z_L_A = 0x2C
    OUT_Z_H_A = 0x2D

    def __init__(self, i2c: BaseI2CController, selftest: bool=False) -> None:
        self._i2c = i2c

        if selftest:
            # this might not always work if the slave is reconnected on-the-fly
            byte, = self._i2c.read_from(self.ADDRESS, self.CTRL_REG1_A, 1)
            if byte != 0x07:    
                logger.warning(f'CTRL_REG1_A={byte:02x}, not default value')

        self._scale = None

    def configure(
        self, 
        rate: LM303AccelerometerDataRate=LM303AccelerometerDataRate.RATE_400, 
        axis: Tuple[bool, bool, bool]=(True, True, True), 
        low_power: bool=False, 
        scale: LM303AccelerometerFullScale=LM303AccelerometerFullScale.SCALE_2g
    ) -> None:
        self._configure_reg1(rate, axis, low_power)
        self._configure_reg4(scale)

    def _configure_reg1(
        self, 
        rate: LM303AccelerometerDataRate,
        axis: Tuple[bool, bool, bool], 
        low_power: bool
    ) -> None:
        # build bit array for enables
        zyx_enable = 0
        for i, tf in enumerate(axis):
            zyx_enable |= tf << i
        
        value = (int(rate) << 4) | (low_power << 3) | zyx_enable
        logger.debug(f'set CTRL_REG1_A={value:>08b}')

        self._i2c.write_to(self.ADDRESS, self.CTRL_REG1_A, [value])

    def _configure_reg4(
        self, 
        full_scale: LM303AccelerometerFullScale
    ) -> None:
        # block data update
        #   1: output registers not updated until MSB and LSB have been read
        bdu = 1

        # endian
        #   0: data lsb @ lower
        ble = 0

        # high resolution output
        #   0: high-resolution disabled
        hr = 0

        # SPI interface
        #   0: 4-wire
        sim = 0
        
        value = (bdu << 7) | (ble << 6) | (int(full_scale) << 4) | (hr << 3) | sim
        logger.debug(f'set CTRL_REG4_A={value:>08b}')

        self._i2c.write_to(self.ADDRESS, self.CTRL_REG4_A, [value])

        self._scale = full_scale

    def read(self) -> Tuple[float, float, float]:
        """Request data from the accelerometer."""
        # NOTE |0x80 to do continuous read
        bytes = self._i2c.read_from(self.ADDRESS, self.OUT_X_L_A | 0x80, 6)
        value = []
        for lo, hi in zip(bytes[::2], bytes[1::2]):
            raw = int.from_bytes((hi, lo), byteorder='big', signed=True)
            # NOTE from Adafruit, it seems that accelerometer only has 12-bit resolution
            raw >>= 4
            converted = raw * self.scale_to_sensitivity(self._scale)
            value.append(converted)
        return value

    @staticmethod
    def scale_to_sensitivity(fs: LM303AccelerometerFullScale) -> float:
        """Fulll-scale selection to sensitivity in mg."""
        return {
            LM303AccelerometerFullScale.SCALE_2g: 0.001,
            LM303AccelerometerFullScale.SCALE_4g: 0.002,
            LM303AccelerometerFullScale.SCALE_8g: 0.004,
            LM303AccelerometerFullScale.SCALE_16g: 0.012
        }[fs]

class LM303MagnetometerDataRate(IntEnum):
    """Magnetometer data output rate."""

    RATE_0p7 = 0x00
    """0.75 Hz"""
    
    RATE_1p5 = 0x01 
    """1.5 Hz"""

    RATE_3p0 = 0x02 
    """3.0 Hz"""

    RATE_7p5 = 0x03 
    """7.5 Hz"""

    RATE_15 = 0x04
    """15 Hz"""

    RATE_30 = 0x05 
    """30 Hz"""

    RATE_75 = 0x06 
    """75 Hz"""

    RATE_220 = 0x07 
    """220 Hz"""

class LM303MagnetometerRange(IntEnum):
    """Input field range."""

    GAIN_1p3 = 0x01
    """+- 1.3 Gauss"""

    GAIN_1p9 = 0x02
    """+- 1.9 Gauss"""

    GAIN_2p5 = 0x03
    """+- 2.5 Gauss"""

    GAIN_4p0 = 0x04
    """+- 4.0 Gauss"""

    GAIN_4p7 = 0x05
    """+- 4.7 Gauss"""

    GAIN_5p6 = 0x06
    """+- 5.6 Gauss"""

    GAIN_8p1 = 0x07
    """+- 8.1 Gauss"""

class LSM303Magnetometer:
    """
    Wrapper class that represents the magnetometer in an LSM303 eCompass module.
    
    Args:
        i2c (BaseI2CController): a fully initialized I2C controller instance
    """

    ADDRESS = 0b0011110

    CRA_REG_M = 0x00
    CRB_REG_M = 0x01
    MR_REG_M = 0x02
    OUT_X_H_M = 0x03
    OUT_X_L_M = 0x04
    OUT_Z_H_M = 0x05
    OUT_Z_L_M = 0x06
    OUT_Y_H_M = 0x07
    OUT_Y_L_M = 0x08
    TIME_LIMIT_A = 0x3B 
    TIME_LATENCY_A = 0x3C
    TIME_WINDOW_A = 0x3D

    def __init__(self, i2c: BaseI2CController):
        self._i2c = i2c

        byte, = self._i2c.read_from(self.ADDRESS, self.CRA_REG_M, 1)
        print(f'CRA_REG_M={byte:>08b}')

        self._xy_gain = None
        self._z_gain = None

    def configure(
        self, 
        rate: LM303MagnetometerDataRate=LM303MagnetometerDataRate.RATE_220, 
        enable_temperature: bool=True,
        range: LM303MagnetometerRange=LM303MagnetometerRange.GAIN_1p9
    ) -> None:
        """
        Configure the magnetometer.
        
        Args:
            rate (LM303MagnetometerDataRate, optional): data output rate.
            enable_temperature (bool, optional): enable the temperature sensor.
            range (LM303MagnetometerRange, optional): sensor input field range.
        """
        self._configure_cra(rate, enable_temperature)
        self._configure_crb(range)
        self._configure_mr()
        
    def _configure_cra(
        self, 
        rate: LM303AccelerometerDataRate, 
        enable_temperature: bool
    ) -> None:
        value = (enable_temperature << 7) | (rate << 2)
        logger.debug(f'set CRA_REG_M={value:>08b}')

        self._i2c.write_to(self.ADDRESS, self.CRA_REG_M, [value])

    def _configure_crb(self, range: LM303MagnetometerRange) -> None:
        value = range << 5
        logger.debug(f'set CRB_REG_M={value:>08b}')

        self._i2c.write_to(self.ADDRESS, self.CRB_REG_M, [value])

        self._xy_gain, self._z_gain = self.range_to_gain(range)
        logger.debug(f'xy_gain={self._xy_gain}, z_gain={self._z_gain}')

    def _configure_mr(self) -> None:
        value = 0b00
        self._i2c.write_to(self.ADDRESS, self.MR_REG_M, [value])

    def read(self) -> Tuple[float, float, float]:
        """Request data from the magnetometer."""
        # NOTE |0x80 to do continuous read
        bytes = self._i2c.read_from(self.ADDRESS, self.OUT_X_H_M, 6)
        value = []
        for hi, lo in zip(bytes[::2], bytes[1::2]):
            raw = int.from_bytes((hi, lo), byteorder='big', signed=True)
            value.append(raw)
        
        # divide by gain
        value = [
            float(raw) / gain 
            for raw, gain in zip(value, (self._xy_gain, self._xy_gain, self._z_gain))
        ]
        return value

    @staticmethod
    def range_to_gain(range: LM303MagnetometerRange) -> Tuple[int, int]:
        return {
            LM303MagnetometerRange.GAIN_1p3: (1100, 980),
            LM303MagnetometerRange.GAIN_1p9: (855, 760),
            LM303MagnetometerRange.GAIN_2p5: (670, 600),
            LM303MagnetometerRange.GAIN_4p0: (450, 400),
            LM303MagnetometerRange.GAIN_4p7: (400, 355),
            LM303MagnetometerRange.GAIN_5p6: (330, 295),
            LM303MagnetometerRange.GAIN_8p1: (230, 205)
        }[range]
