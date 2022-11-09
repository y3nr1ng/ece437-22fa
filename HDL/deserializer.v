`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2022 03:50:23 PM
// Design Name: 
// Module Name: deserializer
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


module deserializer #(
    parameter WIDTH = 12
) (
    input   i_clk,
    input   i_rst,
    
    input                   in,
    output reg [WIDTH-1:0]  out
);

    initial begin
        out <= 0;
    end

    reg [4:0]       counter = 0;
    reg [WIDTH-1:0] buffer = 0;

    always @(posedge i_clk) begin
        if (i_rst) begin
            counter <= 0;
            out <= 0;
        end
        else begin
            if (counter < WIDTH) begin
                counter <= counter + 1'b1;
                buffer <= { buffer[WIDTH-2:0], in };           
            end
            else begin
                counter <= 5'd0;
                out <= buffer;
            end
        end
    end

endmodule
