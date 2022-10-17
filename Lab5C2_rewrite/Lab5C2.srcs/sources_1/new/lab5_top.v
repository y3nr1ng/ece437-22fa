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
    
    // i2c interface
    inout           I2C_SCL_0,
    inout           I2C_SDA_0,
    inout           I2C_SCL_1,
    inout           I2C_SDA_1,
    
    // adt7420
    output          ADT7420_A0, 
    output          ADT7420_A1,
    
    // led debug
    output [7:0]    led
);
    
    /*** adt7420 address ***/
    assign ADT7420_A0 = 1;
    assign ADT7420_A1 = 1;
    /*** adt7420 address ***/
    
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
    
    localparam  endpoint_count = 3;
    wire [endpoint_count*65-1:0] okEHx;  
    okWireOR # (.N(endpoint_count)) wireOR (okEH, okEHx);
    
    // input, 0x00
    //  0: i2c_0 reset
    //  1: i2c_1 reset
    okWireIn     wi_00 (.okHE (okHE),                                               .ep_addr (8'h00), .ep_dataout (wi_00_wire)); 
    // input, 0x01, i2c_0 input data
    okWireIn     wi_01 (.okHE (okHE),                                               .ep_addr (8'h01), .ep_dataout (i_mem_data_0)); 
    // input, 0x02, i2c_1 input data
    okWireIn     wi_02 (.okHE (okHE),                                               .ep_addr (8'h01), .ep_dataout (i_mem_data_1)); 
    // output, 0x20, i2c_0 output data
    okWireOut    wo_20 (.okHE (okHE), .okEH (okEHx[ 0*65 +: 65 ]),                  .ep_addr (8'h20), .ep_datain (o_mem_data_0));
    // output, 0x21, i2c_1 output data
    okWireOut    wo_21 (.okHE (okHE), .okEH (okEHx[ 1*65 +: 65 ]),                  .ep_addr (8'h20), .ep_datain (o_mem_data_1));
    // trigger in, 0x40
    //  0: i2c_0 start
    //  1: i2c_0 mem start
    //  2: i2c_0 mem write
    //  3: i2c_0 mem read
    //  4: i2c_1 start
    //  5: i2c_1 mem start
    //  6: i2c_1 mem write
    //  7: i2c_1 mem read
    okTriggerIn  ti_40 (.okHE (okHE), .ep_clk(clk_ti),                              .ep_addr (8'h40), .ep_trigger (ti_40_wire));
    // trigger out, 0x60
    //  0: i2c_0 done
    //  1: i2c_1 done
    okTriggerOut to_60 (.okHE (okHE), .okEH (okEHx[ 2*65 +: 65 ]), .ep_clk(clk_ti), .ep_addr (8'h60), .ep_trigger (to_60_wire));
    /*** ok endpoints ***/
    
    /*** i2c_0 ***/
    wire reset_async_0;
    wire reset_clk_ti_0;
    
    assign reset_async_0 = wi_00_wire[0];
    
    sync_reset sync_reset_inst_0 (
        .i_clk (clk_ti),
        .i_async_reset (reset_async_0),
        .o_sync_reset (reset_clk_ti_0)
    );
    
    wire [31:0] i_mem_data_0;
    wire [31:0] o_mem_data_0;
       
    i2c_master #(
        .CLK_DIVIDER (256)
    ) i2c_master_inst_0 (
        .i_clk (clk_ti),
        
        // controls
        .i_rst (reset_clk_ti_0),
        .i_start (ti_40_wire[0]),
        .o_done (to_60_wire[0]),
        
        // data
        .i_mem_clk (clk_ti),
        .i_mem_start (ti_40_wire[1]),
        .i_mem_write (ti_40_wire[2]),
        .i_mem_read (ti_40_wire[3]),
        .i_mem_data (i_mem_data_0[7:0]),
        .o_mem_data (o_mem_data_0[7:0]),
         
        // wirings
        .io_scl (I2C_SCL_0),
        .io_sda (I2C_SDA_0)
    );
    /*** i2c_0 ***/
    
    /*** i2c_1 ***/
    wire reset_async_1;
    wire reset_clk_ti_1;
    
    assign reset_async_1 = wi_00_wire[1];
    
    sync_reset sync_reset_inst_1 (
        .i_clk (clk_ti),
        .i_async_reset (reset_async_1),
        .o_sync_reset (reset_clk_ti_1)
    );
    
    wire [31:0] i_mem_data_1;
    wire [31:0] o_mem_data_1;
       
    i2c_master #(
        .CLK_DIVIDER (256)
    ) i2c_master_inst_1 (
        .i_clk (clk_ti),
        
        // controls
        .i_rst (reset_clk_ti_1),
        .i_start (ti_40_wire[4]),
        .o_done (to_60_wire[1]),
        
        // data
        .i_mem_clk (clk_ti),
        .i_mem_start (ti_40_wire[5]),
        .i_mem_write (ti_40_wire[6]),
        .i_mem_read (ti_40_wire[7]),
        .i_mem_data (i_mem_data_1[7:0]),
        .o_mem_data (o_mem_data_1[7:0]),
         
        // wirings
        .io_scl (I2C_SCL_1),
        .io_sda (I2C_SDA_1)
    );
    /*** i2c_1 ***/
    
endmodule
