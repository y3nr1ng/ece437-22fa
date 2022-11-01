`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 01:28:42 PM
// Design Name: 
// Module Name: drv8833
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


module drv8833 #(
    parameter PULSE_CLK_DIVIDER = 16'd250 
)(
    input               i_clk_100k, 
    
    // control
    input               i_rst,
    input               i_start,
    
    input               i_dir,
    input       [23:0]  i_pulses,
    
    output              o_busy,
    
    // wirings
    output              o_pmod_dir,
    output              o_pmod_en,
    
    output  [3:0]       debug_led
);
    
    /*** ila ***/
    ila_0 ila_0_inst (
        .clk (i_clk_100k),
        .probe0 ({ i_clk_100k, i_rst, i_start, i_dir, i_pulses, o_busy, o_pmod_dir, o_pmod_en }),
        .probe1 ({ pmod_en_counter, counter, state })
    );
    /*** ila ***/
    
    /*** en pulse generator ***/
    reg [15:0]  pmod_en_counter = 0;
    reg         pmod_en = 0;
    
    always @(posedge i_clk_100k) begin
        if (i_rst) begin
            pmod_en_counter <= 0;
        end
        else begin
            if (pmod_en_counter == PULSE_CLK_DIVIDER) begin
                pmod_en_counter <= 0;
                pmod_en <= ~pmod_en;
            end
            else begin
                pmod_en_counter <= pmod_en_counter + 1'b1;
            end
        end
    end
    
    reg pmod_oe = 0; // this is what we want to control 
    assign o_pmod_en = (pmod_oe & !i_rst) & pmod_en;
    
    wire pmod_en_tick;
    assign pmod_en_tick = (pmod_en_counter == PULSE_CLK_DIVIDER) & o_pmod_en;
    
    assign debug_led[0] = pmod_en;
    /*** en pulse generator ***/
    
    /*** en counter ***/
    reg         clear = 0;
    reg [23:0]  counter = 0;
    
    always @(posedge i_clk_100k) begin
        if (clear) begin
            counter <= 0;
        end
        else begin
            if (pmod_en_tick) begin
                counter <= counter + 1'b1;
            end
        end
    end
    /*** en counter ***/
    
    /*** dir control ***/
    reg dir = 0;
    assign o_pmod_dir = dir;
    
    assign debug_led[1] = dir;
    /*** dir control ***/
    
    /*** main fsm ***/
    integer state;
    parameter S_IDLE = 0,
              S_PREPARE = 1,
              S_RUN = 2;
    
    reg [23:0] target_counter = 0;
    
    always @(posedge i_clk_100k) begin
        if (i_rst) begin 
            state <= S_IDLE;
        end 
        else begin
            clear <= 0;
            
            case (state)
                S_IDLE: begin
                    if (i_start) begin
                        state <= S_PREPARE;
                    end
                end
                
                S_PREPARE: begin
                    state <= S_RUN;
                    
                    // set direction
                    dir <= i_dir;
                    
                    // set enable pulses to wait for
                    clear <= 1;
                    target_counter <= i_pulses;
                end
                
                S_RUN: begin
                    if (counter >= target_counter) begin
                        state <= S_IDLE;
                        
                        pmod_oe <= 0;
                    end
                    else begin
                        pmod_oe <= 1;
                    end
                end
            endcase
        end
    end
    
    assign o_busy = (state != S_IDLE);
    assign debug_led[2] = o_busy;
    /*** main fsm ***/
    
endmodule
