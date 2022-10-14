from ece437.i2c import I2CControllerEndpoints

I2C_0_ENDPOINTS = I2CControllerEndpoints(
    RESET = 0x00,
    DATA_IN = 0x01,
    DATA_OUT = 0x20,
    TRIGGER_IN = 0x40,
    TRIGGER_OUT = 0x60,

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

    START_MASK = 4,
    MEM_RESET_MASK = 5,
    MEM_WRITE_MASK = 6,
    MEM_READ_MASK = 7,

    DONE_MASK = 1
)