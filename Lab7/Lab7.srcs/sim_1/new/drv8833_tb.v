`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 05:18:04 PM
// Design Name: 
// Module Name: drv8833_tb
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


module drv8833_tb();

// generate clock source
reg clk;

initial begin
    clk = 0;

    forever begin
        #1 clk = 1'b1;
        #1 clk = 1'b0;
    end
end

// control signals for drv8833
reg         reset;
reg         start;
wire        busy;

reg         dir;
reg [23:0]  pulses;

wire pmod_en, pmod_dir;

// dut
drv8833 #(
    .PULSE_CLK_DIVIDER (16'd10)
) drv8833_inst (
    .i_clk_100k (clk), 
    
    // control
    .i_rst (reset),
    .i_start (start),
    
    .i_dir (dir),
    .i_pulses (pulses), // 24-bit
    
    .o_busy (busy),
    
    // wirings
    .o_pmod_dir (pmod_dir),
    .o_pmod_en (pmod_en),
    
    .debug_led () // 4-bit
);

// reset the controller
initial begin
    reset = 1;
    start = 0;

    @(posedge clk);
    @(posedge clk);
    @(posedge clk) reset = 0;
end

// one-shot start signal
reg         go;
reg [1:0]   god;
always @(posedge clk) begin
    god <= { god[0], go };
    start <= god[0] ^ god[1];
end

// the actual test process
initial begin
    go = 0;
    god = 0;

    dir = 0;
    pulses = 24'd100;

    #1000;
    
    gotildone;

    #1000;

    go = 0;
    god = 0;

    dir = 1;
    pulses = 24'd100;

    #1000;

    gotildone;

    #1000;

    go = 0;
    god = 0;

    dir = 0;
    pulses = 24'd100;

    #1000;

    gotildone;

    #1000;
end

task gotildone; 
begin
    go = ~go;
    while (busy) begin
        @(posedge clk);
    end
end
endtask

endmodule
