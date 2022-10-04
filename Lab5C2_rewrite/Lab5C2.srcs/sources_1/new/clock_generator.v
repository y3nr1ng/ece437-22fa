`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:39:44 PM
// Design Name: 
// Module Name: clock_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Generate FSM and ILA clock from external differential clock source.
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_generator #(
    parameter FSM_CLK_DIV = 100,
    parameter ILA_CLK_DIV = 10
) (
    // input clock
    input sys_clkn,
    input sys_clkp,
    
    // output
    output reg fsm_clk,    
    output reg ila_clk 
);
    
    // generate high speed main clock from differential source
    wire clk;
    IBUFGDS osc_clk(
        .O (clk),
        .I (sys_clkp),
        .IB (sys_clkn)
    );   
    
    // derive ila clock from the main clock
    reg [23:0] clk_div_ila = 24'd0;
    always @(posedge clk) begin        
        if (clk_div_ila == ILA_CLK_DIV) begin
            ila_clk <= !ila_clk;                       
            clk_div_ila <= 0;
        end else begin                        
            clk_div_ila <= clk_div_ila + 1'b1;
        end
    end   
       
    // derive fsm clock from the ila clock
    reg [23:0] clk_div_fsm;
    always @(posedge ila_clk) begin        
        if (clk_div_fsm == FSM_CLK_DIV) begin
            fsm_clk <= !fsm_clk;                   
            clk_div_fsm <= 0;
        end else begin
            clk_div_fsm <= clk_div_fsm + 1'b1;             
        end
    end
    
endmodule
