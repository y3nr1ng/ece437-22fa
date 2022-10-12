`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 06:54:12 PM
// Design Name: 
// Module Name: sync_reset
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Synchronize the asynchronous reset signal to a clock.
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sync_reset(
    input   i_clk,
    input   i_async_reset,
    output  o_sync_reset
);

    reg async_reset;
    reg async_reset_d;
    
    always @(posedge i_clk) begin
        async_reset <= i_async_reset;
        async_reset_d <= async_reset;
    end
    
    assign o_sync_reset = i_async_reset | async_reset | async_reset_d;
    
endmodule
