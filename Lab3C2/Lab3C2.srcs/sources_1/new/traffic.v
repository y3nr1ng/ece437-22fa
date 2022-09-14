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

module traffic(
    input        button,
    output [7:0] led,
    input sys_clkn,
    input sys_clkp  
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
        // 200 MHz / 100_000 = 2 kHz
        // 2 kHz / 2 = 1 kHz
        if (clk_acc >= 100_000) begin
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
        
    /*** car ***/
    localparam CAR_STATE_WAIT_PEDESTRIAN = 3'd0;
    localparam CAR_STATE_G       = 3'd1;
    localparam CAR_STATE_G_WAIT  = 3'd2;
    localparam CAR_STATE_Y       = 3'd3;
    localparam CAR_STATE_Y_WAIT  = 3'd4;
    
    localparam DIRECTION_NS = 0;
    localparam DIRECTION_EW = 1;
    
    localparam G_DELAY = 100;  // 1s
    localparam Y_DELAY = 50;   // 0.5s
    localparam R_DELAY = 200;  // 1.5s
    
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
                car_wait_counter <= G_DELAY;
                
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
                car_wait_counter <= Y_DELAY;
                
                car_passing <= 1;
            end
                
            CAR_STATE_Y_WAIT: begin
                if (car_wait_counter > 0) begin
                    car_wait_counter <= car_wait_counter - 1;
                end
                else begin
                    if (pedestrian_waiting) begin
                        car_state <= CAR_STATE_WAIT_PEDESTRIAN;
                    end
                    else begin
                        car_state <= CAR_STATE_G;
                    end
                    
                    // toggle direction, NS/EW
                    car_direction <= ~car_direction;
                end
            end
            
            CAR_STATE_WAIT_PEDESTRIAN: begin
                // no car passing at this state
                car_passing <= 0;
                
                if (!pedestrian_waiting) begin
                    // pedestrian move away, resume transition
                    car_state <= CAR_STATE_G;
                end
            end
        endcase
    end
    /*** car ***/
    
    /*** pedestrian ***/
    localparam PEDESTRIAN_STATE_R           = 2'd0;
    localparam PEDESTRIAN_STATE_WAIT_CAR    = 2'd1;
    localparam PEDESTRIAN_STATE_G           = 2'd2;
    localparam PEDESTRIAN_STATE_G_WAIT      = 2'd3;
    
    reg [1:0]   pedestrian_state;
    reg         pedestrian_waiting;
    reg [15:0]  pedestrian_wait_counter;
    
    initial begin
        pedestrian_state <= PEDESTRIAN_STATE_R;
        pedestrian_waiting <= 0;
        pedestrian_wait_counter <= 0;
    end      
    
    localparam P_DELAY = 100; // 1s
    
    always @(posedge fsm_clk) begin
        case (pedestrian_state)
            PEDESTRIAN_STATE_R: begin 
                pedestrian_waiting <= button;
            end
            
            PEDESTRIAN_STATE_WAIT_CAR: begin 
                pedestrian_waiting <= 1;
                if (!car_passing) begin
                    pedestrian_state <= PEDESTRIAN_STATE_G;
                end
            end
            
            PEDESTRIAN_STATE_G: begin 
                pedestrian_wait_counter <= P_DELAY;
            end
            
            PEDESTRIAN_STATE_G_WAIT: begin 
                if (pedestrian_wait_counter > 0) begin
                    pedestrian_wait_counter <= pedestrian_wait_counter - 1;
                end
                else begin
                    pedestrian_state <= PEDESTRIAN_STATE_R;
                end
            end
        endcase
    end
    /*** pedestrian ***/
    
endmodule

