from ece437.i2c import I2CControllerEndpoints
from ece437.spi import SPIControllerEndpoints
from ece437.sensor import CMV300Endpoints

I2C_0_ENDPOINTS = I2CControllerEndpoints(
    RESET = 0x00,
    DATA_IN = 0x01,
    DATA_OUT = 0x20,
    TRIGGER_IN = 0x40,
    TRIGGER_OUT = 0x60,

    RESET_MASK = 0,

    START_MASK = 0,
    MEM_RESET_MASK = 1,
    MEM_WRITE_MASK = 2,
    MEM_READ_MASK = 3,

    DONE_MASK = 0
)

I2C_1_ENDPOINTS = I2CControllerEndpoints(
    RESET = 0x00,
    DATA_IN = 0x02,
    DATA_OUT = 0x21,
    TRIGGER_IN = 0x40,
    TRIGGER_OUT = 0x60,

    RESET_MASK = 1,
    
    START_MASK = 4,
    MEM_RESET_MASK = 5,
    MEM_WRITE_MASK = 6,
    MEM_READ_MASK = 7,

    DONE_MASK = 1
)

CMV300_SPI_ENDPOINTS = SPIControllerEndpoints(
    RESET = 0x00,
    DATA_IN = 0x01,
    DATA_OUT = 0x20,
    TRIGGER_IN = 0x40,
    TRIGGER_OUT = 0x60,

    RESET_MASK = 0,

    START_MASK = 0,
    MEM_RESET_MASK = 1,
    MEM_WRITE_MASK = 2,
    MEM_READ_MASK = 3,

    DONE_MASK = 0
)

CMV300_DATA_ENDPOINTS = CMV300Endpoints(
    RESET = 0x00,
    TRIGGER_IN = 0x41,
    TRIGGER_OUT = 0x61,
    PIPE = 0xA0,

    RESET_MASK = 1,

    START_MASK = 0,

    READY_MASK = 0,
    DONE_MASK = 1
)