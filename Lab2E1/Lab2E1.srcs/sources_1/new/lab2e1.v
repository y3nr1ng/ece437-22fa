`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 04:29:15 PM
// Design Name: 
// Module Name: lab2e1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Control LED with an 8-bit control variable. 
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab2e1(
    input   wire    [4:0] okUH,
    output  wire    [2:0] okHU,
    inout   wire    [31:0] okUHU,
    inout   wire    okAA,
    input   wire    sys_clkn,
    input   wire    sys_clkp,
    input   wire    reset,
    // Your signals go here
    input [3:0] button,
    output [7:0] led
);

    // Wires for FP
    wire okClk;
    wire [112:0]    okHE;
    wire [64:0]     okEH;
    
    // OK host
    okHost hostIF (
        .okUH(okUH),
        .okHU(okHU),
        .okUHU(okUHU),
        .okClk(okClk),
        .okAA(okAA),
        .okHE(okHE),
        .okEH(okEH)
    );
    
    // Setup the clock
    wire        clk;
    reg [31:0]  clkdiv;
    reg         slow_clk;
    reg [7:0]   counter;
    
    IBUFGDS osc_clk(
        .O(clk),
        .I(sys_clkp),
        .IB(sys_clkn)
    );
    
    initial begin
        clkdiv = 0;
        slow_clk = 0;
    end
    
    // Create slow clock from the high speed 200 MHz
    // - Invert the clock /2
    // - Count to 20_000_000, /20_000_000
    always @(posedge clk) begin
        clkdiv <= clkdiv + 1'b1;
        if (clkdiv == 20_000_000) begin
            slow_clk <= ~slow_clk;
            clkdiv <= 0;
        end
    end
    
    // Define FSM states
    localparam ALL_OFF = 0;
    localparam ALL_ON  = 1;
    localparam COUNT_UP = 2;
    localparam COUNT_DOWN = 3;
    reg [1:0] state;
    
    initial begin
        state <= ALL_OFF;
    end
        
    wire [7:0]  control_wire;
    
    // Write the control register
    okWireIn wire10 (   .okHE(okHE), 
                        .ep_addr(8'h00), 
                        .ep_dataout(control_wire) );
    
    // Update the control register
    always @(negedge slow_clk) begin  
        state <= control_wire;
    end
    
    // We have 1 outgoing endpoints
    // - 0x20, LED status

    localparam  endPt_count = 1;
    wire [endPt_count*65-1:0] okEHx;  
    okWireOR # (.N(endPt_count)) wireOR (okEH, okEHx);
    
    // Write the LED status
    okWireOut wire20 (  .okHE(okHE), 
                        .okEH(okEHx[ 0*65 +: 65 ]),
                        .ep_addr(8'h20), 
                        .ep_datain(counter));
    
    // Wire the LED to the counter
    assign led = ~counter; 
    
    // Change behavior by the control register
    always @(posedge slow_clk) begin    
        // Update output   
        if (state == ALL_OFF) begin
            counter <= 8'b0000_0000;
        end 
        else if (state == ALL_ON) begin
            counter <= 8'b1111_1111;
        end
        else if (state == COUNT_UP) begin
            counter <= counter + 2;
        end
        else if (state == COUNT_DOWN) begin
            counter <= counter - 2;
        end
    end  
    
endmodule
