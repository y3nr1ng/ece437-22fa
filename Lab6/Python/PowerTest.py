# This code reads data from the temperature sensor and outputs the results on the screen.
# The bit file programs OpalKellyâ€™s XEM7310 board with a finite state machine that implements 
# I2C protocol. With this protocol, temperature data is received from the temperature sensor
# to the FPGA. Then the FPGA transfers the data from the two registers containing 
# the temperature data to the PC using OKWireOut.

# import various libraries necessery to run your Python code
import time
import sys    # system related library
ok_loc = 'C:\\Program Files\\Opal Kelly\\FrontPanelUSB\\API\\Python\\3.6\\x64'
sys.path.append(ok_loc)   # add the path of the OK library
import ok     # OpalKelly library
import visa
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import time
mpl.style.use('ggplot')

#%% 
# Define FrontPanel device variable, open USB communication and
# load the bit file in the FPGA
dev = ok.okCFrontPanel();  # define a device for FrontPanel communication
SerialStatus=dev.OpenBySerial("");      # open USB communicaiton with the OK board
ConfigStatus=dev.ConfigureFPGA("U:\\ECE437\\Source\\Lab6\\Python\\I2C_Temperature.bit"); # Configure the FPGA with this bit file

# Check if FrontPanel is initialized correctly and if the bit file is loaded.
# Otherwise terminate the program
print("----------------------------------------------------")
if SerialStatus == 0:
    print ("FrontPanel host interface was successfully initialized.");
else:    
    print ("FrontPanel host interface not detected. The error code num ber is:" + str(int(SerialStatus)));
    print("Exiting the program.");
    sys.exit ();

if ConfigStatus == 0:
    print ("Your bit file is successfully loaded in the FPGA.");
else:
    print ("Your bit file did not load. The error code number is:" + str(int(ConfigStatus)));
    print ("Exiting the progam.");
    sys.exit ();
print("----------------------------------------------------")
print("----------------------------------------------------")

#%%
device_manager = visa.ResourceManager()
devices = device_manager.list_resources()
n_devices = len(devices)
print(f'found {n_devices} devices')

power_supply_id = None
multimeter_id = None

# assumes only the DC power supply is connected
for i in range(0, n_devices):
    try:
        device_temp = device_manager.open_resource(devices[i])
        idn_str = device_temp.query("*IDN?")
        idn_str = idn_str.upper().rstrip()
        
        print(f'[{i}] {idn_str}')
        
        # determine device type
        if (idn_str.startswith('HEWLETT-PACKARD,E3631A')):
            power_supply_id = i
        elif (idn_str.startswith('AGILENT TECHNOLOGIES,34461A')):
            multimeter_id = i
        
        device_temp.close()
    except:
        pass

assert power_supply_id != None, "unable to connect power supply"
power_supply = device_manager.open_resource(devices[power_supply_id])
    
assert multimeter_id != None, "unable to connect the DMM"
multimeter = device_manager.open_resource(devices[multimeter_id])

#%%
power_supply.write("*CLS")

# set the current limit to 500 mA on 25 V port
psu_volt_port = 'P25V'
power_supply.write(f"INST:SEL {psu_volt_port}")

current_limit = 0.5
power_supply.write(f"SOUR:CURR:LEV:IMM {current_limit}")

# configure dmm to current mode
multimeter.write(f'CONF:CURR:DC AUTO')

#%% Press control-C in the console window to stop the loop

voltages = np.linspace(0, 4.8, num=10, dtype=float)

n_repeats = 20

# reset to 0V
power_supply.write("OUTP ON")

data = []
for volt in voltages:
    print(f'v={volt}')
    
    # set voltage
    power_supply.write(f"VOLT:LEV:IMM {volt}")
    time.sleep(0.05)
    
    # take measurements
    measured_voltage = []
    measured_current = []
    measured_temperature = []
    for i_repeat in range(n_repeats):
        print('.', end='')
        # voltage
        value = power_supply.query(f"MEAS:VOLT:DC? {psu_volt_port}")
        measured_voltage.append(float(value))
        
        # current
        value = multimeter.query(f"MEAS:CURR:DC?")
        measured_current.append(float(value))
        
        # temperature
        dev.SetWireInValue(0x00, 1)
        dev.UpdateWireIns()
        
        dev.UpdateWireOuts()
        temperature_msb = dev.GetWireOutValue(0x20)
        temperature_lsb = dev.GetWireOutValue(0x21)
        temperature = float(((temperature_msb<<8) + temperature_lsb))/8*0.0625;
        measured_temperature.append(float(temperature))
        
        dev.SetWireInValue(0x00, 0)
        dev.UpdateWireIns()
        
    measured_voltage = np.array(measured_voltage)
    measured_current = np.array(measured_current)
    measured_temperature = np.array(measured_temperature)
    
    v_mean, v_std = measured_voltage.mean(), measured_voltage.std()
    i_mean, i_std = measured_current.mean(), measured_current.std()
    t_mean, t_std = measured_temperature.mean(), measured_temperature.std()
    
    p = v_mean * i_mean
    if p > 0.5:
        print('.. OVER POWER LIMIT, abort')
        break
    
    print()
    
    print(f'v={v_mean:.4f}/{v_std:.4f}, i={i_mean:.4f}/{i_std:.4f}, t={t_mean:.4f}/{t_std:.4f}')
    
    print()
    
    data.append(
            (v_mean, v_std, i_mean, i_std, t_mean, t_std)
    )
data = np.array(data)

power_supply.write("OUTP OFF")

#%%
plt.figure()
plt.plot(voltages, data[:, 0])
plt.errorbar(voltages, data[:, 0], yerr=data[:, 1])
plt.title("Supplied Voltage vs. Measured Voltage")
plt.xlabel("Supplied Voltage (V)")
plt.ylabel("Measured Voltage (V)")
plt.draw()

plt.figure()
plt.plot(voltages, data[:, 2])
plt.errorbar(voltages, data[:, 2], yerr=data[:, 3])
plt.title("Voltage vs. Current")
plt.xlabel("Supplied Voltage (V)")
plt.ylabel("Measured Current (A)")
plt.draw()

power = data[:, 0] * data[:, 2]
v_err = data[:, 1]
i_err = data[:, 3]
p_err = np.sqrt(v_err**2 + i_err**2)
plt.figure()
plt.plot(voltages, power)
plt.errorbar(voltages, power, yerr=p_err*100)
plt.title("Voltage vs. Power")
plt.xlabel("Supplied Voltage (V)")
plt.ylabel("Measured Power (W)")
plt.draw()

plt.figure()
plt.plot(voltages, data[:, 4])
plt.errorbar(voltages, data[:, 4], yerr=data[:, 5])
plt.title("Voltage vs. Temperature")
plt.xlabel("Supplied Voltage (V)")
plt.ylabel("Measured Temperature (degC)")
plt.draw()