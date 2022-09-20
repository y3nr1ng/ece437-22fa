`timescale 1ns / 100ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2022 05:31:13 PM
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Test run the traffic light control module with a single pedestrian event.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module testbench();

    
    // wire up the module
    reg         button;
    wire [7:0]  led;
    
    // generate a clock signal
    reg     sys_clkn = 1;
    wire    sys_clkp;
    
    assign sys_clkp = ~sys_clkn;
    always begin 
        #5 sys_clkn = ~sys_clkn;
    end
    
    // wire up the module
    traffic #(
        .green_delay (6),
        .yellow_delay (4),
        .pedestrian_delay (10)
    ) module_under_test (
        .button (button),
        .led (led),
        
        .sys_clkn (sys_clkn),
        .sys_clkp (sys_clkp)
    );
    
    initial begin
        #0 button <= 0; 
        
        // pedestrian waiting @ NS green     
        #60_000_000 button <= 1; // @ 60 ms
        #10 button <= 0; 
        
        // pedestrian waiting @ NS yellow
        #50_000_000 button <= 1; // @ 110 ms
        #10 button <= 0;
        
        // pedestrian waiting @ EW green     
        #20_000_000 button <= 1; // @ 60 ms
        #1_000 button <= 0; 
        
        // pedestrian waiting @ EW yellow
        #48_000_000 button <= 1; // @ 110 ms
        #1_000 button <= 0;
    end
    
endmodule
