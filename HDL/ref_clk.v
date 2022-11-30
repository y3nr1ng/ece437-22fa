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
    // on board differential clock source
    input       sys_clkn,
    input       sys_clkp,
    
    input       reset,
    
    // system output, 200 MHz
    output      sys_clk,

    // references
    output      clk_80M,
    output      clk_120M
);

    IBUFGDS osc_clk(
        .O (sys_clk),
        .I (sys_clkp),
        .IB (sys_clkn)
    );  
    
    ref_clk_pll ref_clk_pll_inst (
        .reset (reset),
        .locked (), // whether pll is stable
        .sys_clk (sys_clk), 
        .clk_80M (clk_80M),
        .clk_120M (clk_120M)
    );
    
endmodule