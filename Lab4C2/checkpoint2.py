import visa
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import time
mpl.style.use('ggplot')

#%%
# This section of the code cycles through all USB connected devices to the computer.
# The code figures out the USB port number for each instrument.
# The port number for each instrument is stored in a variable named “instrument_id”
# If the instrument is turned off or if you are trying to connect to the 
# keyboard or mouse, you will get a message that you cannot connect on that port.
device_manager = visa.ResourceManager()
devices = device_manager.list_resources()
n_devices = len(devices)
print(f'found {n_devices} devices')

power_supply_id = None
oscilloscope_id = None
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
        elif (idn_str.startswith('KEYSIGHT TECHNOLOGIES,MSO-X 3024T')):
            oscilloscope_id = i
        elif (idn_str.startswith('AGILENT TECHNOLOGIES,34461A')):
            multimeter_id = i
        
        device_temp.close()
    except:
        pass

assert power_supply_id != None, "unable to connect power supply"
power_supply = device_manager.open_resource(devices[power_supply_id])
    
assert oscilloscope_id != None, "unable to connect oscilloscope"
oscilloscope = device_manager.open_resource(devices[oscilloscope_id])

assert multimeter_id != None, "unable to connect the DMM"
multimeter = device_manager.open_resource(devices[multimeter_id])

#%%

power_supply.write("*CLS")

# set the current limit to 60 mA on 25 V port
psu_volt_port = 'P25V'
power_supply.write(f"INST:SEL {psu_volt_port}")

current_limit = 0.06
power_supply.write(f"SOUR:CURR:LEV:IMM {current_limit}")

# enable DVM on the scope, in DC, auto-range, channel 1
oscilloscope.write('DVM:ENAB ON')
oscilloscope.write('DVM:MODE DCRM')
oscilloscope.write('DVM:ARAN ON')
oscilloscope.write('DVM:SOUR CHAN1')

# configure dmm to current mode
multimeter.write(f'CONF:CURR:DC AUTO')

#%%
# swept the voltage between 0-8 V, in steps of 0.1 V
output_voltage = np.arange(0, 8, 0.2)
measured_voltage = []
measured_current = []

power_supply.write("OUTP ON")

for volt in output_voltage:
    power_supply.write(f"VOLT:LEV:IMM {volt}")

    # pause 50ms to let things settle
    time.sleep(0.05)

    # read the output voltage on the 6V power supply
    for _ in range(5): # retry 5 times
        values = []
        for _ in range(10): # median and mean
            value = oscilloscope.query(f"DVM:CURR?")
            values.append(float(value))
            time.sleep(0.1)
        if np.isclose(np.mean(values), np.median(values), atol=1e-2):
            measured_voltage.append(np.median(values))
            break
        
        print(f'.. retry @ volt={volt}, {values}')
    else:
        raise RuntimeError('unable to get steady volt readout @ volt={volt}')
    
    # read the output current on the 6V power supply
    value = multimeter.query(f"MEAS:CURR:DC?")
    measured_current.append(float(value))

power_supply.write("OUTP OFF")

measured_voltage = np.array(measured_voltage)
measured_current = np.array(measured_current)

#%% Close all device handlers

power_supply.close()
multimeter.close()

#%% Plot measured data. First convert the data from strings to numbers (ie floats)
   
# plot results (applied voltage vs measured supplied current)
plt.figure()
plt.plot(output_voltage, measured_current)
plt.xlabel("Supplied Voltage (V)")
plt.ylabel("Measured Supplied Current (A)")
plt.draw()

# plot results (measured voltage vs measured supplied current)
plt.figure()
plt.plot(measured_voltage, measured_current)
plt.xlabel("Measured Voltage (V)")
plt.ylabel("Measured Supplied Current (A)")
plt.draw()

# show all plots
plt.show()
