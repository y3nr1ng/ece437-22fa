`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:35:30 PM
// Design Name: 
// Module Name: lab5_top
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


module lab5_top(
    // clock
    input           sys_clkn,
    input           sys_clkp,  
    
    // ok interface
    input   [4:0]   okUH,
    output  [2:0]   okHU,
    inout   [31:0]  okUHU,
    inout           okAA,
    
    // adt7420 and i2c
    output          ADT7420_A0, 
    output          ADT7420_A1,
    inout           I2C_SCL_0,
    inout           I2C_SDA_0,
    
    // led debug
    output [7:0]    led
);

    /*** clock source ***/
    wire fsm_clk;
    wire ila_clk;
    
    clock_generator clock (
        .sys_clkn (sys_clkn),
        .sys_clkp (sys_clkp),
        
        .fsm_clk (fsm_clk),    
        .ila_clk (ila_clk) 
    );
    /*** clock source ***/

    /*** the temperature sensor ***/
    wire        trigger_wire;
    wire        ready_wire;
    wire [15:0] data_wire;
    wire        error_wire;
    
    assign led[7] = error_wire;
    
    adt7420 sensor (
        // clock
        .clk (fsm_clk),
        
        // chip address
        .a0 (ADT7420_A0),
        .a1 (ADT7420_A1), 
        
        // i2c interface
        .scl (I2C_SCL_0),
        .sda (I2C_SDA_0),
        
        // control interface
        .start (trigger_wire),
        .ready (ready_wire),
        .temperature (data_wire),
        
        .error (error_wire)
    );
    /*** the temperature sensor ***/
    
    /*** ok interface ***/
    wire [112:0]    okHE;
    wire [64:0]     okEH;
    
    okHost hostIF (
        .okUH (okUH),
        .okHU (okHU),
        .okUHU (okUHU),
        .okClk (okClk),
        .okAA (okAA),
        .okHE (okHE),
        .okEH (okEH)
    );
    /*** ok interface ***/
    
    /*** ok input endpoints ***/
    // input, 0x00, read sensor
    okWireIn endpoint_00 (   
        .okHE (okHE), 
        .ep_addr (8'h00), 
        .ep_dataout (trigger_wire)
    ); 
    /*** ok input endpoints ***/
    
    /*** ok output endpoints ***/
    localparam  endpoint_count = 2;
    wire [endpoint_count*65-1:0] okEHx;  
    okWireOR # (.N(endpoint_count)) wireOR (okEH, okEHx);
    
    // output, 0x20, is ready
    okWireOut endpoint_20 (
        .okHE (okHE), 
        .okEH (okEHx[ 0*65 +: 65 ]),
        .ep_addr (8'h20), 
        .ep_datain (ready_wire)
    );
    
    // output, 0x21, read temperature
    okWireOut endpoint_21 (
        .okHE (okHE), 
        .okEH (okEHx[ 1*65 +: 65 ]),
        .ep_addr (8'h21), 
        .ep_datain (data_wire)
    );
    /*** ok output endpoints ***/
    
    /*** the debug probe ***/
    ila_0 ila_sample2 (
        .clk (ila_clk),
        .probe0 ({}),
        .probe1 ({fsm_clk, trigger_wire})
    );
    /*** the debug probe ***/
    
endmodule
