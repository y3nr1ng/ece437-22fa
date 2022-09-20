`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2022 04:26:28 PM
// Design Name: 
// Module Name: traffic
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

module traffic #(
    parameter green_delay = 1000,
    parameter yellow_delay = 500,
    parameter pedestrian_delay = 1000
)(
    input       button,
    output [7:0] led,
    input       sys_clkn,
    input       sys_clkp  
); 
                
    wire clk;
    IBUFGDS osc_clk(
        .O(clk),
        .I(sys_clkp),
        .IB(sys_clkn)
    ); 
    
    // slow down the clock to 1kHz
    reg [31:0]  clk_acc; 
    reg         fsm_clk;
    
    initial begin
        clk_acc <= 0;
        fsm_clk <= 0;
    end
    
    always @(posedge clk) begin
        clk_acc <= clk_acc + 1'b1;
        // 100 MHz / 50_000 = 2 kHz
        // 2 kHz / 2 = 1 kHz
        if (clk_acc >= 50_000) begin
            fsm_clk <= ~fsm_clk;
            clk_acc <= 0;
        end
    end
    
    /*** led output ***/
    // Assuming RYG / RG order
    wire [2:0]   ns_light;
    wire [2:0]   ew_light;
    wire [1:0]   pedestrian_light;
    
    // map led wire to output, inverted
    assign led = ~{ns_light, ew_light, pedestrian_light};
    /*** led output ***/
    
    /*** pedestrian ***/
    reg         pedestrian_waiting;
    reg         pedestrian_crossing;
    
    initial begin
        pedestrian_waiting <= 0;
        pedestrian_crossing <= 0;
    end      
    
    wire p_r_light, p_g_light;
    assign pedestrian_light = { p_r_light, p_g_light };
    assign p_r_light = ~p_g_light;
    assign p_g_light = pedestrian_crossing;
    
    always @(posedge button or posedge pedestrian_crossing) begin
        if (button) 
            pedestrian_waiting <= 1;
        else if (pedestrian_crossing) 
            pedestrian_waiting <= 0;
    end
    /*** pedestrian ***/
    
    /*** car ***/
    localparam CAR_STATE_WAIT_PEDESTRIAN = 3'd0;
    localparam CAR_STATE_G       = 3'd1;
    localparam CAR_STATE_G_WAIT  = 3'd2;
    localparam CAR_STATE_Y       = 3'd3;
    localparam CAR_STATE_Y_WAIT  = 3'd4;
    
    localparam DIRECTION_NS = 0;
    localparam DIRECTION_EW = 1;
    
    reg [2:0]   car_state;
    reg         car_passing;
    reg         car_direction;
    reg [15:0]  car_wait_counter;
    
    initial begin
        car_state <= CAR_STATE_G;
        car_passing <= 0;
        car_direction <= DIRECTION_NS;
        car_wait_counter <= 0;
    end
    
    // aggregate result of RYG
    wire r_light, y_light, g_light;
    assign r_light = !car_passing;
    assign y_light = car_passing & ((car_state == CAR_STATE_Y) | (car_state == CAR_STATE_Y_WAIT));
    assign g_light = car_passing & ((car_state == CAR_STATE_G) | (car_state == CAR_STATE_G_WAIT));
    
    // assign RYG to actual LED by direction
    assign ns_light = {
        r_light | (car_direction != DIRECTION_NS),
        y_light & (car_direction == DIRECTION_NS),
        g_light & (car_direction == DIRECTION_NS)
    };
    assign ew_light = {
        r_light | (car_direction != DIRECTION_EW),
        y_light & (car_direction == DIRECTION_EW),
        g_light & (car_direction == DIRECTION_EW)
    };
    
    always @(posedge fsm_clk) begin
        case (car_state)
            CAR_STATE_G: begin
                car_state <= CAR_STATE_G_WAIT;
                car_wait_counter <= green_delay;
                
                car_passing <= 1;
            end
                
            CAR_STATE_G_WAIT: begin
                if (car_wait_counter > 0) begin
                    car_wait_counter <= car_wait_counter - 1;
                end
                else begin
                    car_state <= CAR_STATE_Y;
                end
            end
                
            CAR_STATE_Y: begin
                car_state <= CAR_STATE_Y_WAIT;
                car_wait_counter <= yellow_delay;
                
                car_passing <= 1;
            end
                
            CAR_STATE_Y_WAIT: begin
                if (car_wait_counter > 0) begin
                    car_wait_counter <= car_wait_counter - 1;
                end
                else begin
                    if (pedestrian_waiting) begin
                        car_state <= CAR_STATE_WAIT_PEDESTRIAN;
                        car_wait_counter <= pedestrian_delay;
                        
                        // no car passing
                        car_passing <= 0;
                    end
                    else begin
                        car_state <= CAR_STATE_G;
                    end
                    
                    // toggle direction, NS/EW
                    car_direction <= ~car_direction;
                end
            end
            
            CAR_STATE_WAIT_PEDESTRIAN: begin
                pedestrian_crossing <= 1;
                
                if (car_wait_counter > 0) begin
                    car_wait_counter <= car_wait_counter - 1;
                end
                else begin
                    // resume transition
                    car_state <= CAR_STATE_G;
                    pedestrian_crossing <= 0;
                end
            end
        endcase
    end
    /*** car ***/
    
endmodule

