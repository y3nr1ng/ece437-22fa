`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 03:51:08 PM
// Design Name: 
// Module Name: lab9_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Block-throttled pipe with CMV300 image transfer.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab9_top(
    // clock
    input           sys_clkn,
    input           sys_clkp,  
    
    // ok interface
    input   [4:0]   okUH,
    output  [2:0]   okHU,
    inout   [31:0]  okUHU,
    inout           okAA,
    
    // cmv300 spi interface
    output          CVM300_SPI_EN,
    output          CVM300_SPI_IN,  // mosi
    input           CVM300_SPI_OUT, // miso 
    output          CVM300_SPI_CLK,
    
    // led debug
    output [7:0]    led
);
    
    /*** referenc clock ***/
    wire sys_clk;
    wire ref_clk_25M;
    wire ref_clk_100k;

    ref_clk ref_clk_inst (
        .sys_clkn (sys_clkn),
        .sys_clkp (sys_clkp),

        .sys_clk (sys_clk),

        .clk_25M (ref_clk_25M),
        .clk_100k (ref_clk_100k)
    );
    /*** referenc clock ***/
    
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
    
    // input, 0x00
    //  0: spi reset
    okWireIn     wi_00 (.okHE (okHE),                                               .ep_addr (8'h00), .ep_dataout (wi_00_wire)); 
    // input, 0x01, spi input data
    okWireIn     wi_01 (.okHE (okHE),                                               .ep_addr (8'h01), .ep_dataout (i_mem_data_0)); 
    // output, 0x20, i2c_0 output data
    okWireOut    wo_20 (.okHE (okHE), .okEH (okEHx[ 0*65 +: 65 ]),                  .ep_addr (8'h20), .ep_datain (o_mem_data_0));
    // trigger in, 0x40
    //  0: spi start
    //  1: spi mem start
    //  2: spi mem write
    //  3: spi mem read
    okTriggerIn  ti_40 (.okHE (okHE), .ep_clk(sys_clk),                              .ep_addr (8'h40), .ep_trigger (ti_40_wire));
    // trigger out, 0x60
    //  0: spi done
    okTriggerOut to_60 (.okHE (okHE), .okEH (okEHx[ 1*65 +: 65 ]), .ep_clk(sys_clk), .ep_addr (8'h60), .ep_trigger (to_60_wire));
    /*** ok endpoints ***/
    
    /*** cmv300 spi ***/
    wire reset_async_0;
    wire reset_sys_clk_0;
    
    assign reset_async_0 = wi_00_wire[0];
    
    sync_reset sync_reset_inst_0 (
        .i_clk (sys_clk),
        .i_async_reset (reset_async_0),
        .o_sync_reset (reset_sys_clk_0)
    );
    
    wire [31:0] i_mem_data_0;
    wire [31:0] o_mem_data_0;
       
    spi_master #(
        .CLK_DIVIDER (512)
    ) spi_master_inst (
        .i_clk (sys_clk),
        
        // controls
        .i_rst (reset_sys_clk_0),
        .i_start (ti_40_wire[0]),
        .o_done (to_60_wire[0]),
        
        // data
        .i_mem_clk (sys_clk),
        .i_mem_start (ti_40_wire[1]),
        .i_mem_write (ti_40_wire[2]),
        .i_mem_read (ti_40_wire[3]),
        .i_mem_data (i_mem_data_0[7:0]),
        .o_mem_data (o_mem_data_0[7:0]),
         
        // wirings
        .o_spi_en (CVM300_SPI_EN),
        .o_spi_mosi (CVM300_SPI_IN),
        .i_spi_miso (CVM300_SPI_OUT),
        .o_spi_clk (CVM300_SPI_CLK)
    );
    /*** cmv300 spi ***/
    
endmodule
