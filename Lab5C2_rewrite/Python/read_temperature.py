import time
import sys    # system related library
ok_loc = 'C:\\Program Files\\Opal Kelly\\FrontPanelUSB\\API\\Python\\3.6\\x64'
sys.path.append(ok_loc)   # add the path of the OK library
import ok     # OpalKelly library
import logging

logger = logging.getLogger()

# format
formatter = logging.Formatter('[%(asctime)s] [%(levelname)s] %(message)s')

# add stream handler
handler = logging.StreamHandler(sys.stdout)                             
handler.setFormatter(formatter)
logger.addHandler(handler)

# enable all logging level
logger.setLevel(logging.DEBUG)

#%% 
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
        
        if self._firmware_path:
            logger.info(f"upload firmware '{self._firmware_path}'")
            self._device.ConfigureFPGA(self._firmware_path)
        
        device_info = ok.okTDeviceInfo()
        status = self._device.GetDeviceInfo(device_info)
        self.parse_error_code(status)
        self._device_info = device_info
        
    def close(self):
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


class I2CController(OKFrontPanel):
    MAX_BUFFER_LENGTH: int = 64
    
    # endpoints
    WIRE_IN_RESET = 0x00
    WIRE_IN_DATA = 0x01
    WIRE_OUT_DATA = 0x20
    TRIGGER_IN = 0x40
    TRIGGER_OUT = 0x60
    
    # bit position
    TRIGGER_IN_GO = 0
    TRIGGER_IN_MEM_RESET = 1
    TRIGGER_IN_MEM_WRITE = 2
    TRIGGER_IN_MEM_READ = 3
    
    TRIGGER_OUT_DONE = 0
    
    MAX_RETRIES = 10
    MAX_TIMEOUT = 500 # ms
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        
        self._preamble = []
    
    def open(self):
        super().open()
        self.reset()
        
    def close(self):
        super().close()
        
    def reset(self):
        logger.debug('reset i2c controller')
        self._device.SetWireInValue(self.WIRE_IN_RESET, 0x01, 0x01)
        self._device.UpdateWireIns()
        self._device.SetWireInValue(self.WIRE_IN_RESET, 0x00, 0x01)
        self._device.UpdateWireIns()
    
    def configure(self, n_starts, n_stops, preamble):
        buffer = [
            len(preamble),  # preamble length
            n_starts,       # preamble bytes after the start bit
            n_stops,        # preamble bytes after the stop bit
            -1              # payload length, provide later
        ]
        buffer += list(preamble)
        
        self._preamble = buffer # we need preamble buffer as list to allow mod
        
    def transmit(self, data):
        if not data:
            return
        
        length = len(data)
        if length - len(self._preamble) >= self.MAX_BUFFER_LENGTH:
            raise ValueError('data exceeds buffer size')
        
        # reset memory pointer and transfer the buffer
        self._preamble[3] = length
        tx_buf = self._preamble + list(data)
        self._device.ActivateTriggerIn(self.TRIGGER_IN, self.TRIGGER_IN_MEM_RESET)
        logger.debug('.. [TI] mem reset')
        for byte in tx_buf:
            self._device.SetWireInValue(self.WIRE_IN_DATA, byte, 0x00ff)
            self._device.UpdateWireIns()
            self._device.ActivateTriggerIn(self.TRIGGER_IN, self.TRIGGER_IN_MEM_WRITE)
            logger.debug('.. [TI] mem write')
            
        # start the transaction
        self._device.ActivateTriggerIn(self.TRIGGER_IN, self.TRIGGER_IN_GO)
        logger.debug('.. [TI] go')
        
        # wait for the transaction to finish
        t_sleep = float(self.MAX_TIMEOUT) / self.MAX_RETRIES
        for _ in range(self.MAX_RETRIES):
            self._device.UpdateTriggerOuts()
            if self._device.IsTriggered(self.TRIGGER_OUT, 1<<self.TRIGGER_OUT_DONE):
                logger.debug('.. [TO] done')
                break
            time.sleep(t_sleep / 1000)
        else:
            raise TimeoutError('unable to complete transmit')
    
    def receive(self, length: int):
        if length == 0:
            return tuple()
        elif length < 0:
            length = self.MAX_BUFFER_LENGTH - len(self._preamble) - 1
        elif length - len(self._preamble) >= self.MAX_BUFFER_LENGTH:
            raise ValueError('request exceeds buffer size')
            
        # reset memory pointer and transfer the buffer
        self._preamble[0] |= 0x80
        self._preamble[3] = length
        self._device.ActivateTriggerIn(self.TRIGGER_IN, self.TRIGGER_IN_MEM_RESET)
        logger.debug('.. [TI] mem reset')
        for byte in self._preamble:
            self._device.SetWireInValue(self.WIRE_IN_DATA, byte, 0x00ff)
            self._device.UpdateWireIns()
            self._device.ActivateTriggerIn(self.TRIGGER_IN, self.TRIGGER_IN_MEM_WRITE)
            logger.debug(f'.. [TI] mem write, {byte:02x}')
            
        # start the transaction
        self._device.ActivateTriggerIn(self.TRIGGER_IN, self.TRIGGER_IN_GO)
        
        # wait for the transaction to finish
        data = []
        t_sleep = float(self.MAX_TIMEOUT) / self.MAX_RETRIES
        for _ in range(self.MAX_RETRIES):
            self._device.UpdateTriggerOuts()
            if self._device.IsTriggered(self.TRIGGER_OUT, 1<<self.TRIGGER_OUT_DONE):
                logger.debug('.. [TO] done')
                # reset memory pointer
                self._device.ActivateTriggerIn(self.TRIGGER_IN, self.TRIGGER_IN_MEM_RESET)
                logger.debug('.. [TI] mem reset')
                for _ in range(length):
                    self._device.UpdateWireOuts()
                    byte = self._device.GetWireOutValue(self.WIRE_OUT_DATA)
                    logger.debug(f'.. [WO] [{self.WIRE_OUT_DATA:02x}]={byte:02x}')
                    data.append(byte)
                    self._device.ActivateTriggerIn(self.TRIGGER_IN, self.TRIGGER_IN_MEM_READ)
                    logger.debug('.. [TI] mem read')
                break
            time.sleep(t_sleep / 1000)
        else:
            raise TimeoutError('unable to complete receive')
            
        return tuple(data)
    
    def write_to(self, dev_addr, reg_addr, reg_value):
        preamble = [
            dev_addr & 0xfe,    # device address (W)
            reg_addr,
        ]
        self.configure(0x00, 0x00, preamble)
        self.transmit(reg_value)
    
    def read_from(self, dev_addr, reg_addr, length):
        dev_addr <<= 1
        
        preamble = [
            dev_addr & 0xfe,    # device address (W)
            reg_addr,
            dev_addr | 0x01,    # device address (R)
        ]
        self.configure(0x02, 0x00, preamble)
        
        reg_value = self.receive(length)
        
        return reg_value
    
#%%
path = "U:\\ECE437\\Source\\Lab5C2_rewrite\\Lab5C2.runs\\impl_1\\lab5_top.bit"
#path = None
with I2CController(firmware_path=path) as dev:
    logger.info(f'serial={dev.serial_number}')
    
    dev_addr = 0x4B
    reg_addr = 0x0B
    n_value = 1
    print(f'{dev_addr << 1:08b}')
    data = dev.read_from(dev_addr, reg_addr, n_value)
    for i in range(n_value):
        print(f'[{reg_addr+i:02x}]={data[i]:02x}')

    logger.info('end')
    