`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2022 05:11:36 PM
// Design Name: Lab 1-B
// Module Name: counter
// Project Name: Lab 1
// Target Devices: 
// Tool Versions: 
// Description: 
//   Count from 0 to 100 in steps of 10. Once the counter reaches 100, it will count
//   back 0 in steps of 10. The counting up and down will be repeated indefinitely.
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter(
    input [3:0] button,
    output [7:0] led,
    input sys_clkn,
    input sys_clkp
    );
    
    reg [23:0] clkdiv;
    reg [7:0] counter;
    reg slow_clk;
    
    // Direction of the counter
    reg dir;
    
    // Define the main system clock from differential clock signals
    // `clk` is a high speed clock running at 200MHz
    wire clk;
    IBUFGDS osc_clk(
        .O(clk),
        .I(sys_clkp),
        .IB(sys_clkn)
    );
    
    initial begin
        clkdiv = 0;
        counter = 8'h00;
        dir = 1'b1; // 1: count up, 0: count down
    end
    
    assign led = ~counter;
            
    // Slow the clock from `clk` to about 1 Hz
    always @(posedge clk) begin
        clkdiv <= clkdiv + 1'b1;
        if (clkdiv == 10000000) begin
            slow_clk <= ~slow_clk;
            clkdiv <= 0;
        end
    end
    
    always @(posedge slow_clk) begin 
        // Reset the counter upon button press  
        if (dir) begin
            // Count up
            if (counter < 100) begin
                counter <= counter + 10;
            end
            else begin 
                dir <= ~dir;
            end
        end
        else begin 
            // Count down
            if (counter > 0) begin
                counter <= counter - 10;
            end
            else begin 
                dir <= ~dir;
            end
        end
    end    
    
endmodule
