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
    output reg          o_ready,    // ready for frame
    input               i_start,    // request new frame
    output reg          o_done,     // acquired a frame

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
    /*
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
    */
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
    reg wrrd_rst = 0;
    
    wire wr_rst_busy, rd_rst_busy, wrrd_rst_busy;
    wire fifo_full, fifo_empty;
    
    assign wrrd_rst_busy = wr_rst_busy | rd_rst_busy;

    fifo_8i32o fifo_cmv_inst (
        // reset
        .rst (wrrd_rst),

        // fifo write
        .wr_clk (~i_clk_out), // NOTE read on negative edge
        .wr_rst_busy (wr_rst_busy),
        .wr_en (i_dval),
        .din (i_data[9:2]),

        // fifo read
        .rd_clk (i_fifo_read_clk),
        .rd_rst_busy (rd_rst_busy),
        .rd_en (i_fifo_read_en),
        .dout (o_data),

        // signal
        .full (fifo_full),
        .empty (fifo_empty),
        .prog_full (o_fifo_prog_full)
    );
    /*** fifo ***/
    
    /*** state machine ***/
    integer state = S_RESET_SYS_0;
    localparam S_RESET_SYS_0 = 10,  // reset sys
               S_RESET_SYS_1 = 11,
               S_RESET_SYS_2 = 12,
               S_RESET_FIFO_0 = 20, // reset fifo
               S_RESET_FIFO_1 = 21,
               S_RESET_FIFO_2 = 22, 
               S_IDLE_0 = 30,     // idle
               S_IDLE_1 = 31,      
               S_START_0 = 40,  // start
               S_START_1 = 41,
               S_WAIT_PIXELS_0 = 50, // wait
               S_WAIT_PIXELS_1 = 51;

    // signals
    reg start;
    
    // counters
    reg [15:0] delay_counter = 16'd0;
    reg [31:0] pixel_counter = 32'd0;

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
            state <= S_RESET_SYS_0;
            
            o_sys_res <= 0;
            o_frame_req <= 0;

            o_ready <= 0;
            start <= 0;
        end
        else begin
            case (state) 
                S_RESET_SYS_0: begin
                    o_sys_res <= 1;
                    o_frame_req <= 0;
                    state <= S_RESET_SYS_1;
                end

                S_RESET_SYS_1: begin
                    o_sys_res <= 0;
                    state <= S_RESET_SYS_2;
                end

                S_RESET_SYS_2: begin
                    o_sys_res <= 1;
                    state <= S_IDLE_0;
                end

                S_IDLE_0: begin
                    o_ready <= 1;
                    state <= S_IDLE_1;
                end

                S_IDLE_1: begin
                    if (start) begin
                        o_ready <= 0;
                        state <= S_RESET_FIFO_0;
                    end
                end

                S_RESET_FIFO_0: begin
                    wrrd_rst <= 0;
                    state <= S_RESET_FIFO_1;
                end

                S_RESET_FIFO_1: begin
                    wrrd_rst <= 1;
                    if (wrrd_rst_busy) begin
                        state <= S_RESET_FIFO_2;
                    end
                end

                S_RESET_FIFO_2: begin
                    wrrd_rst <= 0;
                    if (!wrrd_rst_busy) begin
                        state <= S_START_0;
                    end
                end

                S_START_0: begin
                    o_frame_req <= 1;
                    state <= S_START_1;
                end

                S_START_1: begin
                    o_frame_req <= 0;
                    pixel_counter <= 32'd0;
                    //state <= S_WAIT_PIXELS_0;
                    state <= S_IDLE_0;
                end

                // TODO write in additional blanks to fill in integer multiple blocks
                S_WAIT_PIXELS_0: begin
                    if (pixel_counter == 648 * 488) begin
                        o_done <= 1;
                        state <= S_IDLE_0;
                    end
                    else begin
                        pixel_counter <= pixel_counter + 1'b1;
                    end
                end
            endcase
            /*** state machine ***/
        end
    end
    
    assign debug_led[7] = ~o_ready;
    assign debug_led[6] = ~start;
    assign debug_led[5] = ~o_done;
    assign debug_led[4] = 1;
    assign debug_led[3] = 1;
    assign debug_led[2] = ~wrrd_rst;
    assign debug_led[1] = ~(wr_rst_busy | rd_rst_busy);
    assign debug_led[0] = ~o_fifo_prog_full;

endmodule
