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
number_of_device = len(devices)

power_supply_id = -1;

# assumes only the DC power supply is connected
for i in range(0, number_of_device):
    try:
        device_temp = device_manager.open_resource(devices[i])
        print("Instrument connect on USB port number [" + str(i) + "] is " + device_temp.query("*IDN?"))
        idn_str = device_temp.query("*IDN?")
        
        # determine device type
        if (idn_str.startswith('HEWLETT-PACKARD,E3631A')):
            power_supply_id = i
            
        device_temp.close()
    except:
        pass

assert power_supply_id != None, "unable to connect with power supply"
power_supply = device_manager.open_resource(devices[power_supply_id])
    
#%%

power_supply.write("*CLS")

# set the current limit to 60 mA on 25 V port
port = 'P25V'
power_supply.write(f"INST:SEL {port}")

current_limit = 0.06
power_supply.write(f"SOUR:CURR:LEV:IMM {current_limit}")

#%%
# swept the voltage between 0-8 V, in steps of 0.1 V
output_voltage = np.arange(0, 8, 0.1)
measured_voltage = []
measured_current = []

power_supply.write("OUTP ON")

for volt in output_voltage:
    power_supply.write(f"VOLT:LEV:IMM {volt}")

    # pause 50ms to let things settle
    time.sleep(0.05)

    # read the output voltage on the 6V power supply
    value = power_supply.query(f"MEAS:VOLT:DC? {port}")
    measured_voltage.append(float(value))
    
    # read the output current on the 6V power supply
    value = power_supply.query(f"MEAS:CURR:DC? {port}")
    measured_current.append(float(value))

power_supply.write("OUTP OFF")

measured_voltage = np.array(measured_voltage)
measured_current = np.array(measured_current)

#%%
# close the power supply handler
power_supply.close()

#%% Plot measured data. First convert the data from strings to numbers (ie floats)
   
# plot results (applied voltage vs measured supplied current)
plt.figure()
plt.plot(output_voltage, measured_current)
plt.title("Applied Voltage vs. Measured Supplied Current")
plt.xlabel("Supplied Voltage (V)")
plt.ylabel("Measured Supplied Current (A)")
plt.draw()

# plot results (measured voltage vs measured supplied current)
plt.figure()
plt.plot(measured_voltage, measured_current)
plt.title("Measured Voltage vs. Measured Supplied Current")
plt.xlabel("Measured Voltage (V)")
plt.ylabel("Measured Supplied Current (A)")
plt.draw()

# show all plots
plt.show()
