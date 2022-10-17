from ece437.i2c import BaseI2CController
import logging

__all__ = ["LSM303Accelerometer"]

logger = logging.getLogger(__name__)


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
    TIME_LIMIT_A = 0x3B 
    TIME_LATENCY_A = 0x3C
    TIME_WINDOW_A = 0x3D

    def __init__(self, i2c: BaseI2CController):
        self._i2c = i2c

        for _ in range(5):
            data = self._i2c.read_from(self.ADDRESS, self.CTRL_REG1_A, 1)
            print(f'before, CTRL_REG1_A={bin(data[0])}')
            self._i2c.write_to(self.ADDRESS, self.CTRL_REG1_A, [0x57])
            data = self._i2c.read_from(self.ADDRESS, self.CTRL_REG1_A, 1)
            print(f'after, CTRL_REG1_A={bin(data[0])}')
        
class LSM303Accelerometer:
    """
    Wrapper class that represents the accelerometer in an LSM303 eCompass module.
    
    Args:
        i2c (BaseI2CController): a fully initialized I2C controller instance
    """

    ADDRESS = 0b0011001

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

        for _ in range(5):
            data = self._i2c.read_from(self.ADDRESS, self.CTRL_REG1_A, 1)
            print(f'before, CTRL_REG1_A={bin(data[0])}')
            self._i2c.write_to(self.ADDRESS, self.CTRL_REG1_A, [0x57])
            data = self._i2c.read_from(self.ADDRESS, self.CTRL_REG1_A, 1)
            print(f'after, CTRL_REG1_A={bin(data[0])}')