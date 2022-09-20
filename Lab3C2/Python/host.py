#%%
# import various libraries necessery to run your Python code
import time   # time related library
import sys    # system related library
ok_loc = 'C:\\Program Files\\Opal Kelly\\FrontPanelUSB\\API\\Python\\3.6\\x64'
sys.path.append(ok_loc)   # add the path of the OK library
import ok     # OpalKelly library

#%% 
# Define FrontPanel device variable, open USB communication and
# load the bit file in the FPGA
dev = ok.okCFrontPanel()  # define a device for FrontPanel communication
SerialStatus=dev.OpenBySerial("1911000P3V")      # open USB communicaiton with the OK board
ConfigStatus=dev.ConfigureFPGA("U:\\ECE437\\Source\\Lab2E2\\Lab2E2.runs\\impl_1\\lab2e2.bit"); # Configure the FPGA with this bit file

# Check if FrontPanel is initialized correctly and if the bit file is loaded.
# Otherwise terminate the program
print("----------------------------------------------------")
if SerialStatus == 0:
    print ("FrontPanel host interface was successfully initialized.")
else:    
    print ("FrontPanel host interface not detected. The error code number is:" + str(int(SerialStatus)))
    print("Exiting the program.")
    sys.exit ()

if ConfigStatus == 0:
    print ("Your bit file is successfully loaded in the FPGA.")
else:
    print ("Your bit file did not load. The error code number is:" + str(int(ConfigStatus)))
    print ("Exiting the progam.")
    sys.exit ()
print("----------------------------------------------------")
print("----------------------------------------------------")

#%% 

# 0x00, control register
# 0x01, clock divisor, default to 20,000,000
# 0x20, counter status
# 0x40, trigger reset

# reset to 5 Hz
dev.SetWireInValue(0x01, 20000000) 
dev.UpdateWireIns() 

# 0, all off
# 1, all on
# 2, count up by 2
# 3, count down by 2
dev.SetWireInValue(0x00, 0) 
dev.UpdateWireIns()  # Update the WireIns

#%% 

dev.SetWireInValue(0x00, 1) 
dev.UpdateWireIns()  # Update the WireIns

#%% 

dev.SetWireInValue(0x00, 2) 
dev.UpdateWireIns()  # Update the WireIns

#%% 

dev.SetWireInValue(0x00, 3) 
dev.UpdateWireIns()  # Update the WireIns

#%% 

# slow down the clock
dev.SetWireInValue(0x01, 100000000) 
dev.UpdateWireIns() 

#%%

# reset to 5 Hz
dev.SetWireInValue(0x01, 10000000) 
dev.UpdateWireIns() 

#%%

# make sure the counter is counting up
dev.SetWireInValue(0x00, 2) 
dev.UpdateWireIns() 

loop = True
while loop:
    time.sleep(0.5)
    try:
        dev.UpdateWireOuts()
        counter = dev.GetWireOutValue(0x20)  # Transfer the recived data in result_sum variable
        
        state = ''
        if counter > 100:
            dev.SetWireInValue(0x00, 4) 
            dev.UpdateWireIns() 
            state = '.. reset!'
        elif counter == 0:
            dev.SetWireInValue(0x00, 2) 
            dev.UpdateWireIns() 
            continue
            
        print('{0:>2} [{0:>08b}]{1:s}'.format(counter, state))
    except KeyboardInterrupt:
        print("... Ctrl+C")
        loop = False

dev.Close

#%%
del dev