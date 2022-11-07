`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 03:48:04 PM
// Design Name: 
// Module Name: cmv300_lvds
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Deserialize CMV300 LVDS output.
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cmv300_lvds (
    // cmv300 clocking
    output              o_clk_in,

    // configuration
    input               i_rst,
    input               i_lvds_en,
    input               i_frame_req,

    // data
    input               i_out_clkn,
    input               i_out_clkp,
    input   [3:0]       i_datan,
    input   [3:0]       i_datap,
    input               i_ctrlp,
    input               i_ctrln,
    
    output  [3:0]       debug_led
);

    /*** enable lvds ***/
    assign i_lvds_en = 1;
    /*** enable lvds ***/
    
    wire        ctrl;
    wire [3:0]  data;
    wire        out_clk;
    
    lvds_deserializer data_lvds (
        // data input
        .data_in_from_pins_n ({ i_ctrln, i_datan }),
        .data_in_from_pins_p ({ i_ctrlp, i_datap }),
        .data_in_to_device ({ ctrl, data }),
        
        // idelayctrl
        .delay_clk (),
        .in_delay_reset (),
        .in_delay_data_ce (),
        .in_delay_data_inc (),
        .in_delay_tap_in (),
        .in_delay_tap_out (),
        .delay_locked (),
        .ref_clock (),
        
        // clock
        .clk_in_n (i_out_clkn),
        .clk_in_p (i_out_clkp),
        .clk_out (out_clk),
        .io_reset (i_rst)
    );
    
    assign debug_led[0] = ctrl;

endmodule