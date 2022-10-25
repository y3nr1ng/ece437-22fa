`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 06:27:56 PM
// Design Name: 
// Module Name: mux8to1
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


module mux8to1(
    input   [7:0]   i_data,
    input   [2:0]   sel,
    output reg      o_data
);

    always @(sel or i_data) begin
    	if      (sel == 3'b111) o_data = i_data[7];
	    else if (sel == 3'b110) o_data = i_data[6];
	    else if (sel == 3'b101) o_data = i_data[5];
	    else if (sel == 3'b100) o_data = i_data[4];
	    else if (sel == 3'b011) o_data = i_data[3];
	    else if (sel == 3'b010) o_data = i_data[2];
	    else if (sel == 3'b001) o_data = i_data[1];
	    else                    o_data = i_data[0];
    end
    
endmodule
