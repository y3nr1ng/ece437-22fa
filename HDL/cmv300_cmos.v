`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2022 02:12:49 PM
// Design Name: 
// Module Name: cmv300_cmos
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


module cmv300_cmos #(
    parameter CLK_DIVIDER = 2
) (
    input               i_clk,
    input               i_rst,

    // cmv300 control
    output reg          o_clk_in, // 40 MHz
    output reg          o_sys_res,
    output reg          o_frame_req,

    // cmv300 data
    input               i_clk_out,
    input       [9:0]   i_data,
    input               i_lval,
    input               i_dval,

    // fifo data
    input               i_fifo_read_en,
    input               i_fifo_read_clk,
    output      [31:0]  o_data,
    output              o_fifo_prog_full,
    
    // debug
    output      [3:0]   debug_led
);

    /*** ila ***/
    ila_0 ila_0_inst (
        .clk (i_clk),
        .probe0 ({ write_reset, i_dval, read_reset, i_fifo_read_en, fifo_full, fifo_empty, o_fifo_prog_full }),
        .probe1 ({ i_data, o_data })
    );
    /*** ila ***/
    
    /*** tick/clock generator ***/
    reg [15:0]  counter = 0;
    
    initial begin
        o_clk_in <= 0;
    end

    always @(posedge i_clk) begin     
        if (i_rst) begin
            counter <= 0;
        end 
        else begin
            if (counter == CLK_DIVIDER/2) begin 
                counter <= 0;
                o_clk_in <= ~o_clk_in;
            end
            else begin
                counter <= counter + 1'b1;
            end
        end
    end
    /*** tick/clock generator ***/
    
    /*** fifo ***/
    reg write_reset = 0;
    reg read_reset = 0;

    wire fifo_full;
    wire fifo_empty;
    
    // cmv300 read on negative edge
    wire wr_clk;
    assign wr_clk = ~i_clk_out;
    
    reg dval_en = 0;
    assign dval = i_dval & dval_en;
    
    fifo_8i32o fifo_cmv_inst (
        // fifo write
        .wr_clk (wr_clk),
        .wr_rst (write_reset),
        .wr_en (dval),
        .din (i_data[9:2]),

        // fifo read
        .rd_clk (i_fifo_read_clk),
        .rd_rst (read_reset),
        .rd_en (i_fifo_read_en),
        .dout (o_data),

        // signal
        .full (fifo_full),
        .empty (fifo_empty),
        .prog_full (o_fifo_prog_full)
    );

    assign debug_led[0] = fifo_full;
    assign debug_led[1] = fifo_empty;
    assign debug_led[2] = i_dval;
    /*** fifo ***/
    
    /*** state machine ***/
    integer state;
    localparam S_INIT = 0,
               S_RESET = 10,
               S_RESET_FINISHED = 11,
               S_DELAY = 20,
               S_FRAME_REQ_HIGH = 30,
               S_FRAME_REQ_LOW = 31;

    // delay counter
    reg [15:0] counter_delay = 16'd0;
    
    always @(posedge i_clk) begin
        if (i_rst) begin
            state <= S_RESET;
        end
        case (state) 
            S_INIT: begin
                if (i_rst) begin
                    state <= S_RESET;
                end
            end

            S_RESET: begin
                counter_delay <= 0;
                write_reset <= 1;
                read_reset <= 1;
                o_sys_res <= 0;
                dval_en <= 0;
                if (i_rst == 0) begin
                    state <= S_RESET_FINISHED;
                end
            end

            S_RESET_FINISHED: begin
                write_reset <= 0;
                read_reset <= 0;
                o_sys_res <= 1;
                state <= S_DELAY;
            end
            
            S_DELAY: begin
                if (counter_delay == 16'b0000_1111_1111_1111) begin
                    state <= S_FRAME_REQ_HIGH; 
                end
                else begin
                    counter_delay <= counter_delay + 1'b1;
                end
            end

            S_FRAME_REQ_HIGH: begin
                o_frame_req <= 1;
                dval_en <= 1;
                state <= S_FRAME_REQ_LOW;
            end

            S_FRAME_REQ_LOW: begin
                o_frame_req <= 0;
                state <= S_INIT;
            end
        endcase
    end
    /*** state machine ***/

endmodule
