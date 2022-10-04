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

#%% 
# Define FrontPanel device variable, open USB communication and
# load the bit file in the FPGA
dev = ok.okCFrontPanel();  # define a device for FrontPanel communication
SerialStatus=dev.OpenBySerial("");      # open USB communicaiton with the OK board
ConfigStatus=dev.ConfigureFPGA("U:\\ECE437\\Source\\Lab5C2\\Lab5C2.runs\\impl_1\\lab5_top.bit"); # Configure the FPGA with this bit file

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

#%% Press control-C in the console window to stop the loop
try:
    while True:    
        # start pulling data
        dev.SetWireInValue(0x00, 1)
        dev.UpdateWireIns()
        dev.SetWireInValue(0x00, 0)
        dev.UpdateWireIns()
        
        # wait till the sensor is ready for new data
        while True:
            dev.UpdateWireOuts()  
            is_ready = dev.GetWireOutValue(0x20)
            print(f"[DEBUG] is_ready={is_ready}")
            if is_ready:
                break
            time.sleep(0.1)
            
        # retrieve the data
        dev.UpdateWireOuts()  
        data = dev.GetWireOutValue(0x21)
        print(f"[DEBUG] data={data:>016b}")
        temperature = float((data >> 3) / 16)
        print(f"{temperature:.05f} C")
        
        time.sleep(0.25)
except KeyboardInterrupt:
    print("... Ctrl+C")
    
#%%
del dev