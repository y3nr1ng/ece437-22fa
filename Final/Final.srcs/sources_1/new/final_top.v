`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 03:51:08 PM
// Design Name: 
// Module Name: final_top
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


module final_top(
    // clock
    input           sys_clkn,
    input           sys_clkp,  
    
    // ok interface
    input   [4:0]   okUH,
    output  [2:0]   okHU,
    inout   [31:0]  okUHU,
    inout           okAA,
    
    // cmv300 clocking
    output          CMV300_CLK_IN,
    input           CMV300_CLK_OUT,

    // cmv300 configuration
    output          CMV300_SYS_RES_N,
    output          CMV300_FRAME_REQ,
    
    // cmv300 spi interface
    output          CMV300_SPI_EN,
    output          CMV300_SPI_IN,  // mosi
    input           CMV300_SPI_OUT, // miso 
    output          CMV300_SPI_CLK,
    
    // cmv300 data interface
    input   [9:0]   CMV300_D,
    input           CMV300_Line_valid,
    input           CMV300_Data_valid,

    // led debug
    output [3:0]    s_LED,
    output [7:0]    led
);
    
    /*** referenc clock ***/
    wire sys_clk;
    wire ref_clk_80M;
    wire ila_clk;
    
    ref_clk ref_clk_inst (
        .sys_clkn (sys_clkn),
        .sys_clkp (sys_clkp),

        .sys_clk (sys_clk),

        .clk_80M (ref_clk_80M),
        .clk_120M (ila_clk)
    );
    /*** referenc clock ***/
    
    /*** ok interface ***/   
    wire [112:0]    okHE;
    wire [64:0]     okEH;
    wire            okClk;

    okHost host (
        .okUH (okUH),
        .okHU (okHU),
        .okUHU (okUHU),
        .okClk (okClk),
        .okAA (okAA),
        .okHE (okHE),
        .okEH (okEH)
    );
    /*** ok interface ***/
    
    /*** ok endpoints ***/
    wire [31:0] wi_00_wire;
    wire [31:0] ti_40_wire;
    wire [31:0] ti_41_wire;
    wire [31:0] to_60_wire;
    wire [31:0] to_61_wire;
    
    wire [31:0] po_a0_wire_datain;
    assign po_a0_wire_datain = { cmv300_fifo_data[7:0], cmv300_fifo_data[15:8], cmv300_fifo_data[23:16], cmv300_fifo_data[31:24] };

    localparam  endpoint_count = 4;
    wire [endpoint_count*65-1:0] okEHx;  
    okWireOR # (.N(endpoint_count)) wireOR (okEH, okEHx);
    
    // input, 0x00
    //  0: spi reset
    //  1: cmv300 reset
    okWireIn     wi_00 (.okHE (okHE),                                                       .ep_addr (8'h00), .ep_dataout (wi_00_wire)); 
    // input, 0x01, spi input data
    okWireIn     wi_01 (.okHE (okHE),                                                       .ep_addr (8'h01), .ep_dataout (i_mem_data_0)); 
    // output, 0x20, i2c_0 output data
    okWireOut    wo_20 (.okHE (okHE), .okEH (okEHx[ 0*65 +: 65 ]),                          .ep_addr (8'h20), .ep_datain (o_mem_data_0));
    // trigger in, 0x40
    //  0: spi start
    //  1: spi mem start
    //  2: spi mem write
    //  3: spi mem read
    okTriggerIn  ti_40 (.okHE (okHE),                               .ep_clk(ref_clk_80M),   .ep_addr (8'h40), .ep_trigger (ti_40_wire));
    // trigger in, 0x41
    //  0: cmv start
    okTriggerIn  ti_41 (.okHE (okHE),                               .ep_clk(ref_clk_80M),   .ep_addr (8'h41), .ep_trigger (ti_41_wire));
    // trigger out, 0x60
    //  0: spi done
    okTriggerOut to_60 (.okHE (okHE), .okEH (okEHx[ 1*65 +: 65 ]),  .ep_clk(ref_clk_80M),   .ep_addr (8'h60), .ep_trigger (to_60_wire));
    // trigger out, 0x61
    //  0: cmv done
    okTriggerOut to_61 (.okHE (okHE), .okEH (okEHx[ 2*65 +: 65 ]),  .ep_clk(ref_clk_80M),   .ep_addr (8'h61), .ep_trigger (to_61_wire));
    // pipe
    okBTPipeOut po_a0  (.okHE (okHE), .okEH (okEHx[ 3*65 +: 65 ]),                          .ep_addr (8'ha0), .ep_datain (po_a0_wire_datain), 
                                                                                                              .ep_read(cmv300_fifo_read_en), 
                                                                                                              .ep_blockstrobe(),  
                                                                                                              .ep_ready(cmv300_fifo_prog_full)
    );  
    /*** ok endpoints ***/
    
    /*** cmv300 spi ***/
    wire reset_async_0;
    wire reset_ref_clk_0;
    
    assign reset_async_0 = wi_00_wire[0];
    
    sync_reset sync_reset_inst_0 (
        .i_clk (ref_clk_80M),
        .i_async_reset (reset_async_0),
        .o_sync_reset (reset_ref_clk_0)
    );
    
    wire [31:0] i_mem_data_0;
    wire [31:0] o_mem_data_0;
       
    spi_master #(
        .CLK_DIVIDER (2)
    ) spi_master_inst (
        .i_clk (ref_clk_80M),
        
        // controls
        .i_rst (reset_ref_clk_0),
        .i_start (ti_40_wire[0]),
        .o_done (to_60_wire[0]),
        
        // data
        .i_mem_clk (ref_clk_80M),
        .i_mem_start (ti_40_wire[1]),
        .i_mem_write (ti_40_wire[2]),
        .i_mem_read (ti_40_wire[3]),
        .i_mem_data (i_mem_data_0[7:0]),
        .o_mem_data (o_mem_data_0[7:0]),
         
        // wirings
        .o_spi_en (CMV300_SPI_EN),
        .o_spi_mosi (CMV300_SPI_IN),
        .i_spi_miso (CMV300_SPI_OUT),
        .o_spi_clk (CMV300_SPI_CLK)
    );
    /*** cmv300 spi ***/
    
    /*** cmv300 data ***/
    wire [31:0] cmv300_fifo_data;
    wire        cmv300_fifo_prog_full;
    wire        cmv300_fifo_read_en;
    
    wire reset_async_1;
    wire reset_ref_clk_1;
    
    assign reset_async_1 = wi_00_wire[1];
    
    sync_reset sync_reset_inst_1 (
        .i_clk (ref_clk_80M),
        .i_async_reset (reset_async_1),
        .o_sync_reset (reset_ref_clk_1)
    );
    
    cmv300_cmos #(
        .CLK_DIVIDER (2)
    ) cmv300_cmos_inst (
        .i_clk (ref_clk_80M),

        .i_rst (reset_ref_clk_1),
        .i_start (ti_41_wire[0]),
        .o_done (to_61_wire[0]),
        
        .o_clk_in (CMV300_CLK_IN),
        .o_sys_res (CMV300_SYS_RES_N),
        .o_frame_req (CMV300_FRAME_REQ),
    
        // data
        .i_clk_out (CMV300_CLK_OUT),
        .i_data (CMV300_D),
        .i_lval (CMV300_Line_valid),
        .i_dval (CMV300_Data_valid),

        .i_fifo_read_en (cmv300_fifo_read_en),
        .i_fifo_read_clk (okClk),
        .o_data (cmv300_fifo_data),
        .o_fifo_prog_full (cmv300_fifo_prog_full),
        
        .ila_clk (ila_clk),
        .debug_led (led)
    );
    /*** cmv300 data ***/
    
endmodule
