`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 05:25:30 PM
// Design Name: 
// Module Name: dram64x8
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


module dram64x8(
    input           i_clk,
    
    input           i_we,
    input   [7:0]   i_data,
    
    input   [5:0]   i_addr_a,
    output  [7:0]   o_data_a,
    
    input   [5:0]   i_addr_b,
    output  [7:0]   o_data_b
);

    reg [7:0]   mem [63:0];
    
    always @(posedge i_clk) begin
        if (i_we) begin
            mem[i_addr_a] <= i_data;
        end
    end
    
    assign o_data_a = mem[i_addr_a];
    assign o_data_b = mem[i_addr_b];
    
endmodule
