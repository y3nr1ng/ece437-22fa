`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2022 05:38:16 PM
// Design Name: 
// Module Name: traffic_ok
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module traffic_ok(
    input   wire    [4:0]   okUH,
    output  wire    [2:0]   okHU,
    inout   wire    [31:0]  okUHU,
    inout   wire            okAA,
    
    input   wire    sys_clkn,
    input   wire    sys_clkp,
    
    output [7:0] led,
    input  [3:0] button
);

    /*** ok ***/
    wire okClk;            //These are FrontPanel wires needed to IO communication    
    wire [112:0]    okHE;  //These are FrontPanel wires needed to IO communication    
    wire [64:0]     okEH; 
    
    okHost hostIF (
        .okUH(okUH),
        .okHU(okHU),
        .okUHU(okUHU),
        .okClk(okClk),
        .okAA(okAA),
        .okHE(okHE),
        .okEH(okEH)
    );
    /*** ok ***/
    
    /*** ok endpoints ***/
    wire [31:0] button_endpoint;
    okWireIn wire11 (   
        .okHE(okHE), 
        .ep_addr(8'h01), 
        .ep_dataout(button_endpoint)
    );
    /*** ok endpoints ***/
    
    /*** main ***/
    
    // allow either software or hardware trigger
    wire button_wire, sw_button, hw_button;
    assign sw_button = button_endpoint[0];    // software
    assign hw_button = ~button[0];          // hardware
    assign button_wire = sw_button | hw_button;
    
    traffic #(
        .green_delay (1000),
        .yellow_delay (500),
        .pedestrian_delay (1000)
    ) traffic_control (
        .button (button_wire),
        .led (led),
        
        .sys_clkn (sys_clkn),
        .sys_clkp (sys_clkp)
    );
    /*** main ***/
    
endmodule
