`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:35:30 PM
// Design Name: 
// Module Name: ref_clk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Reference clock generators.
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ref_clk (
    // on board differential clock source, 200 MHz
    input       sys_clkn,
    input       sys_clkp,
    
    input       reset,

    // references
    output      clk_10M,
    output      clk_80M,
    output      clk_120M
);

    ref_clk_pll ref_clk_pll_inst (
        // clock-in
        .clk_in1_p (sys_clkp),
        .clk_in1_n (sys_clkn),
        
        // status
        .reset (reset),
        .locked (), // whether pll is stable
        
        // clock-out
        .clk_10M (clk_10M),
        .clk_80M (clk_80M),
        .clk_120M (clk_120M)
    );
    
endmodule