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
    
    // system output, 200 MHz
    output      sys_clk,

    // references
    output reg  clk_25M,
    output reg  clk_100k
);

    IBUFGDS osc_clk(
        .O (sys_clk),
        .I (sys_clkp),
        .IB (sys_clkn)
    );  

    initial begin
        clk_25M = 0;
        clk_100k = 0;
    end

    /*** 25 MHz ***/
    reg [3:0] ref_clk_25M_cnt = 4'd0;
    always @(posedge sys_clk) begin        
        if (ref_clk_25M_cnt == 4'd4) begin
            clk_25M <= !clk_25M;  // 200M / 4 / 2 = 25M                  
            ref_clk_25M_cnt <= 0;
        end else begin                        
            ref_clk_25M_cnt <= ref_clk_25M_cnt + 1'b1;
        end
    end 
    /*** 40 MHz ***/
    
    /*** 100 kHz ***/
    reg [15:0] ref_clk_100k_cnt = 16'd0;
    always @(posedge sys_clk) begin        
        if (ref_clk_100k_cnt == 16'd1_000) begin
            clk_100k <= !clk_100k;  // 200M / 1000 / 2 = 100k                   
            ref_clk_100k_cnt <= 0;
        end else begin                        
            ref_clk_100k_cnt <= ref_clk_100k_cnt + 1'b1;
        end
    end 
    /*** 100 kHz ***/
    
endmodule