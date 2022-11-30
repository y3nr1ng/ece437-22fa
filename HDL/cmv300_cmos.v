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
    input               i_start, // request frame
    output reg          o_done,

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
    input               ila_clk,
    output      [7:0]   debug_led
);

    /*** ila ***/
    ila_0 ila_0_inst (
        .clk (ila_clk),
        .probe0 ({ 
            i_clk, 
            
            // cmv controls
            i_rst,
            i_start, 
            o_done,

            // fifo controls
            write_reset,    // wr_rst
            i_dval,         // wr_en
            read_reset,     // rd_rst
            i_fifo_read_en, // rd_en

            // fifo flags
            fifo_full, 
            fifo_empty, 
            o_fifo_prog_full
        }),
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
    reg write_reset;
    reg read_reset;
    
    wire fifo_full, fifo_empty;

    // cmv300 read on negative edge
    wire wr_clk;
    assign wr_clk = ~i_clk_out;
    
    assign wr_en = i_dval & i_lval;
    
    fifo_8i32o fifo_cmv_inst (
        // fifo write
        .wr_clk (wr_clk),
        .wr_rst (write_reset),
        .wr_en (wr_en),
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
    /*** fifo ***/
    
    /*** state machine ***/
    integer state = S_IDLE;
    localparam S_RESET_0 = 10,  // reset
               S_RESET_1 = 11,
               S_RESET_2 = 12,
               S_RESET_3 = 13, 
               S_IDLE = 20,     // idle
               S_START_0 = 30,  // start
               S_START_1 = 31;

    // signals
    reg start;

    // delay counter
    reg [15:0] delay_counter = 16'd0;
    
    always @(posedge i_clk) begin
        /*** frame operation signals ***/
        // reset the done signal
        o_done <= 0;
        if (o_done) begin
            start <= 0;
        end

        if (i_start) begin
            start <= 1;
        end
        /*** frame operation signals ***/
        
        /*** state machine ***/
        if (i_rst) begin
            state <= S_RESET_0;
            
            o_sys_res <= 0;
            o_frame_req <= 0;

            start <= 0;
        end
        case (state) 
            S_RESET_0: begin
                // reset fifo
                write_reset <= 1;
                read_reset <= 1;

                o_sys_res <= 1;
                o_frame_req <= 0;

                state <= S_RESET_1;
            end

            S_RESET_1: begin
                // pull down SYS_RES_N for 1 tick
                o_sys_res <= 0;
                state <= S_RESET_2;
            end

            S_RESET_2: begin
                o_sys_res <= 1;
                state <= S_RESET_3;
            end

            S_RESET_3: begin
                // delay 1 us @ 80 MHz
                if (delay_counter >= 16'd80) begin
                    state <= S_IDLE; 
                end
                else begin
                    delay_counter <= delay_counter + 1'b1;
                end
            end

            S_IDLE: begin
                if (start) begin
                    // release fifo reset
                    write_reset <= 0;
                    read_reset <= 0;

                    state <= S_START_0;
                end
            end

            S_START_0: begin
                o_frame_req <= 1;
                state <= S_START_1;
            end

            S_START_1: begin
                o_frame_req <= 0;
                o_done <= 1; // TODO need a way to know FVAL ends
                state <= S_IDLE;
            end
        endcase
        /*** state machine ***/
    end
    
    assign debug_led[7] = start;
    assign debug_led[6] = o_done;
    assign debug_led[5] = (state == S_RESET_0) | (state == S_RESET_1) | (state == S_RESET_2) | (state == S_RESET_3);
    assign debug_led[4] = (state == S_IDLE);
    assign debug_led[3] = (state == S_START_0) | (state == S_START_1);
    assign debug_led[2] = write_reset;
    assign debug_led[1] = read_reset;
    assign debug_led[0] = 0;

endmodule
