`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:35:30 PM
// Design Name: 
// Module Name: lab7_top
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


module lab7_top(
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
    
    // pmod 1
    output          PMOD_A1,
    output          PMOD_A2,
    
    // led debug
    output [7:0]    led,    // xem
    output [3:0]    s_LED   // sensor board
);
    
    /*** adt7420 address ***/
    assign ADT7420_A0 = 1;
    assign ADT7420_A1 = 1;
    /*** adt7420 address ***/
    
    /*** reference clock ***/
    wire sys_clk; // 200 MHz
    IBUFGDS osc_clk(
        .O (sys_clk),
        .I (sys_clkp),
        .IB (sys_clkn)
    );  
    
    // 100 kHz reference
    reg ref_clk_100k;
    reg [23:0] ref_clk_100k_counter = 24'd0;
    always @(posedge sys_clk) begin        
        if (ref_clk_100k_counter == 24'd1_000) begin
            ref_clk_100k <= !ref_clk_100k;  // 200M / 1000 / 2 = 100k                   
            ref_clk_100k_counter <= 0;
        end else begin                        
            ref_clk_100k_counter <= ref_clk_100k_counter + 1'b1;
        end
    end 
    /*** reference clock ***/
    
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
    wire [31:0] wi_03_wire;
    wire [31:0] ti_40_wire;
    wire [31:0] ti_41_wire;
    wire [31:0] to_60_wire;
    
    localparam  endpoint_count = 3;
    wire [endpoint_count*65-1:0] okEHx;  
    okWireOR # (.N(endpoint_count)) wireOR (okEH, okEHx);
    
    // input, 0x00
    //  0: i2c_0 reset
    //  1: i2c_1 reset
    //  2: pmod reset
    okWireIn     wi_00 (.okHE (okHE),                                               .ep_addr (8'h00), .ep_dataout (wi_00_wire)); 
    // input, 0x01, i2c_0 input data
    okWireIn     wi_01 (.okHE (okHE),                                               .ep_addr (8'h01), .ep_dataout (i_mem_data_0)); 
    // input, 0x02, i2c_1 input data
    okWireIn     wi_02 (.okHE (okHE),                                               .ep_addr (8'h02), .ep_dataout (i_mem_data_1)); 
    // input, 0x03, pmod1
    //  [31]:    dir
    //  [23..0]: pulse
    okWireIn     wi_03 (.okHE (okHE),                                               .ep_addr (8'h03), .ep_dataout (wi_03_wire)); 
    // output, 0x20, i2c_0 output data
    okWireOut    wo_20 (.okHE (okHE), .okEH (okEHx[ 0*65 +: 65 ]),                  .ep_addr (8'h20), .ep_datain (o_mem_data_0));
    // output, 0x21, i2c_1 output data
    okWireOut    wo_21 (.okHE (okHE), .okEH (okEHx[ 1*65 +: 65 ]),                  .ep_addr (8'h21), .ep_datain (o_mem_data_1));
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
    // trigger in, 0x41
    //  0: pmod1 start
    okTriggerIn  ti_41 (.okHE (okHE), .ep_clk(clk_ti),                              .ep_addr (8'h41), .ep_trigger (ti_41_wire));
    // trigger out, 0x60
    //  0: i2c_0 done
    //  1: i2c_1 done
    //  2: pmod1 free
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
        .CLK_DIVIDER (512)
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
        .CLK_DIVIDER (512)
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
    
    /*** pmod 1 ***/
    wire reset_async_2;
    wire reset_sys_clk_2;
    
    assign reset_async_2 = wi_00_wire[2];
    
    sync_reset sync_reset_inst_2 (
        .i_clk (ref_clk_100k),
        .i_async_reset (reset_async_2),
        .o_sync_reset (reset_sys_clk_2)
    );
    
    wire        i_dir_wire;
    wire [23:0] i_pulses_wire;
   
    assign i_dir_wire = wi_03_wire[31];
    assign i_pulses_wire = wi_03_wire[23:0];
    
    wire o_pmod1_busy;
    assign to_60_wire[2] = !o_pmod1_busy;
    
    drv8833 pmod_1 (
        .i_clk_100k (ref_clk_100k), 
        
        // control
        .i_rst (reset_sys_clk_2),
        .i_start (ti_41_wire[0]),
        
        .i_dir (i_dir_wire),
        .i_pulses (i_pulses_wire),
        
        .o_busy (o_pmod1_busy),
        
        // wirings
        .o_pmod_dir (PMOD_A2),
        .o_pmod_en (PMOD_A1),
        .debug_led (s_LED)
    );
    /*** pmod 1 ***/
    
endmodule
