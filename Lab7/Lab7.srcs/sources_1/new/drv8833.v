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
    parameter PWM_CLK_DIVIDER = 16'd0 
)(
    input       i_clk_100khz, 
    
    // control
    input       i_rst,
    input       i_start,
    
    input           i_dir,
    input [23:0]    i_pulses,
    
    output reg      o_busy,
    
    // wirings
    output          o_pmod_dir,
    output reg      o_pmod_en
);
    
    /*** tick generator ***/
    reg [15:0] pwm_counter = 0;
    
    /*** main fsm ***/
    integer state;
    parameter S_IDLE = 0,
              S_START = 1,
              S_RUN = 2, 
              S_STOP = 3;
    
    reg dir = 0; 
    assign o_pmod_dir = dir;
    
    reg start = 0;
    
    reg [23:0]  pulses = 0;
    reg [23:0]  pulse_counter = 0;
    
    always @(posedge i_clk_100khz) begin
        if (i_rst) begin 
            state <= S_IDLE;
            
            o_busy <= 0;
            
            o_pmod_en <= 0;
        end 
        else begin
            case (state)
                S_IDLE: begin
                    if (i_start) begin
                        state <= S_START;
                    end
                end
                
                S_START: begin
                    state <= S_RUN;
                    
                    dir <= i_dir;
                    pulses <= i_pulses;
                    
                    o_pmod_en <= 0;
                    
                    o_busy <= 1;
                    
                    pulse_counter <= 0;
                    pwm_counter <= 0;
                end
                
                S_RUN: begin
                    if (pulse_counter < pulses) begin             
                        if (pwm_counter == PWM_CLK_DIVIDER) begin
                            pwm_counter <= 0;
                            
                            pulse_counter <= pulse_counter + 1'b1;
                            o_pmod_en <= !o_pmod_en;
                        end
                        else begin
                            pwm_counter <= pwm_counter + 1'b1;
                        end
                    end 
                    else begin 
                        state <= S_STOP;
                    end
                end
                
                S_STOP: begin
                    state <= S_IDLE;
                    
                    o_pmod_en <= 0;
                    
                    o_busy <= 0;
                end
            endcase
        end
    end
    /*** main fsm ***/
    
endmodule
