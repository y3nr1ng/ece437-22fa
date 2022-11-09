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
    output              o_lvds_en,
    output              o_frame_req,

    // data
    input               i_out_clkn,
    input               i_out_clkp,
    input   [3:0]       i_datan,
    input   [3:0]       i_datap,
    input               i_ctrlp,
    input               i_ctrln,
    
    output  [7:0]       xem_led,
    output  [3:0]       sb_led
);

    /*** enable lvds ***/
    assign o_lvds_en = 1'b1;
    /*** enable lvds ***/
    
    /*** DEBUG ***/
    assign o_frame_req = 1'b1;
    
    wire        ctrl;
    wire [3:0]  data;
    wire        out_clk;
    
    genvar data_count;
    generate
        for (data_count = 0; data_count < 4; data_count = data_count + 1) begin: data_ibufds
            IBUFDS #(
                .DIFF_TERM ("FALSE"),
                .IOSTANDARD ("LVDS_25")
            ) data_ibufds_inst (
                .I (i_datap[data_count]),
                .IB (i_datan[data_count]),
                .O (data[data_count])
            );
        end
    endgenerate
    
    IBUFDS #(
        .DIFF_TERM ("FALSE"),
        .IOSTANDARD ("LVDS_25")
    ) clk_ibufds_inst (
        .I (i_out_clkp),
        .IB (i_out_clkn),
        .O (out_clk)
    );
    
    IBUFDS #(
        .DIFF_TERM ("FALSE"),
        .IOSTANDARD ("LVDS_25")
    ) ctrl_ibufds_inst (
        .I (i_ctrlp),
        .IB (i_ctrln),
        .O (ctrl)
    );
    /*** DEBUG ***/
    
    /*
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
        
        // clock
        .clk_in_n (i_out_clkn),
        .clk_in_p (i_out_clkp),
        .clk_out (out_clk),
        .io_reset (i_rst)
    );
    */
    
    wire [11:0] ctrls;

    deserializer #(
        .WIDTH (12)
    ) deserializer12_0 (
        .i_clk (out_clk),
        .i_rst (),

        .in (ctrl),
        .out (ctrls)
    );

    assign xem_led = ctrls[7:0];

    assign sb_led[0] = out_clk;
    assign sb_led[1] = ctrl;

endmodule