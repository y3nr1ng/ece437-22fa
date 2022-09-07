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
ConfigStatus=dev.ConfigureFPGA("U:\\ECE437\\Source\\Lab2E1\\Lab2E1.runs\\impl_1\\lab2e1.bit"); # Configure the FPGA with this bit file

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
# We will read data from the FPGA in two different variables
# Since we are using a slow clock on the FPGA to compute the results
# we need to wait for the resutl to be computed
time.sleep(0.5)                 

loop = True
while loop:
    try:
        time.sleep(0.5)
        
        dev.UpdateWireOuts()
        counter = dev.GetWireOutValue(0x20)  # Transfer the recived data in result_sum variable
        print('{0:>2} [{0:>08b}]'.format(counter))
    except KeyboardInterrupt:
        print("... Ctrl+C")
        loop = False

dev.Close

#%%
del dev