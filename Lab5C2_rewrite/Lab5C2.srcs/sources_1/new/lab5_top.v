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
    
    /*** sensor address ***/
    assign ADT7420_A0 = 1;
    assign ADT7420_A1 = 1;
    /*** sensor address ***/
    
    /*** ok interface ***/
    wire clk_ti;
    
    wire [112:0]    okHE;
    wire [64:0]     okEH;
    
    okHost host (
        .okUH (okUH),
        .okHU (okHU),
        .okUHU (okUHU),
        .okClk (clk_ti),
        .okAA (okAA),
        .okHE (okHE),
        .okEH (okEH)
    );
    /*** ok interface ***/
    
    /*** ok endpoints ***/
    wire [31:0] wi_00_wire;
    wire [31:0] ti_40_wire;
    wire [31:0] to_60_wire;
    
    localparam  endpoint_count = 2;
    wire [endpoint_count*65-1:0] okEHx;  
    okWireOR # (.N(endpoint_count)) wireOR (okEH, okEHx);
    
    // input, 0x00, reset
    okWireIn     wi_00 (.okHE (okHE),                                               .ep_addr (8'h00), .ep_dataout (wi_00_wire)); 
    // input, 0x01, input data
    okWireIn     wi_01 (.okHE (okHE),                                               .ep_addr (8'h01), .ep_dataout (i_mem_data)); 
    // output, 0x20, output data
    okWireOut    wo_20 (.okHE (okHE), .okEH (okEHx[ 0*65 +: 65 ]),                  .ep_addr (8'h20), .ep_datain (o_mem_data));
    // trigger in, 0x40
    //  0: i2c start
    //  1: i2c mem start
    //  2: i2c mem write
    //  3: i2c mem read
    okTriggerIn  ti_40 (.okHE (okHE), .ep_clk(clk_ti),                              .ep_addr (8'h40), .ep_trigger (ti_40_wire));
    // trigger out, 0x60, i2c done
    //  0: i2c done
    okTriggerOut to_60 (.okHE (okHE), .okEH (okEHx[ 1*65 +: 65 ]), .ep_clk(clk_ti), .ep_addr (8'h60), .ep_trigger (to_60_wire));
    /*** ok endpoints ***/
    
    /*** i2c ***/
    wire reset_async;
    wire reset_clk_ti;
    
    assign reset_async = wi_00_wire[0];
    
    sync_reset sync_reset_inst (
        .i_clk (clk_ti),
        .i_async_reset (reset_async),
        .o_sync_reset (reset_clk_ti)
    );
    
    wire [31:0] i_mem_data;
    wire [31:0] o_mem_data;
       
    i2c_master #(
        .CLK_DIVIDER (256)
    ) i2c_master_inst (
        .i_clk (clk_ti),
        
        // controls
        .i_rst (reset_clk_ti),
        .i_start (ti_40_wire[0]),
        .o_done (to_60_wire[0]),
        
        // data
        .i_mem_clk (clk_ti),
        .i_mem_start (ti_40_wire[1]),
        .i_mem_write (ti_40_wire[2]),
        .i_mem_read (ti_40_wire[3]),
        .i_mem_data (i_mem_data[7:0]),
        .o_mem_data (o_mem_data[7:0]),
         
        // wirings
        .io_scl (I2C_SCL_0),
        .io_sda (I2C_SDA_0)
    );
    /*** i2c ***/
    
endmodule
