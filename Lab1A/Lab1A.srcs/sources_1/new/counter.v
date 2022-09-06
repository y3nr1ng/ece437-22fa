`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2022 04:47:31 PM
// Design Name: Lab 1-A
// Module Name: counter
// Project Name: Lab 1
// Target Devices: 
// Tool Versions: 
// Description: 
//  Count from 0 to 100 in steps of 10 and display the results on the LEDs. Stop 
//  counting once the counter reaches 100. 
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
        if (button[0] == 1'b0) begin
            counter <= 0;
        end    
        
        // The actual prompt request
        else if (counter < 100) begin 
            counter <= counter + 10;
        end
    end    
    
endmodule
