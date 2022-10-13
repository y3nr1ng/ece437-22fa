`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 03:48:04 PM
// Design Name: 
// Module Name: i2c_frame
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Handle communication with the I2c interface at frame level.
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module i2c_frame #(
    parameter CLK_STRETCH_SUPPORT = 1,
    parameter CLK_DIVIDER = 16'd32
) (
    input               i_clk,
    
    // controls
    input               i_rst, 
    input               i_start, 
    input               i_stop,
    input               i_write,
    input               i_read,
    output reg          o_done,
    
    // data
    input       [7:0]   i_mosi_data,
    output      [7:0]   o_miso_data,
    input               i_ack_r,
    output reg          o_ack_w,
    
    // wirings
    inout               io_scl,
    inout               io_sda
);
    /*** ila ***/
    ila_0 i2c_frame_ila (
        .clk (i_clk),
        .probe0 (state),
        .probe1 ({ i_mosi_data, o_miso_data }),
        .probe2 ({ i_clk, i_start, i_stop, i_write, i_read, o_done, i_ack_r, o_ack_w })
    );
    /*** ila ***/
    
    /*** signal direction ***/
    reg scl_oe;
    reg sda_oe; 
    
    reg sda_out;
    
    // oe, 0: write, 1: read
    assign io_scl = (scl_oe) ? 1'bz : 1'b0;
    assign io_sda = (sda_oe) ? 1'bz : sda_out;
    /*** signal direction ***/
    
    /*** tick generator ***/
    reg [15:0]  counter = 0;
    wire fsm_clk;
    
    reg scl_oe_d;
    reg stretch_clk;
    
    always @(posedge i_clk) begin
        // slave clock stretching
        if (CLK_STRETCH_SUPPORT == 1) begin
            // monitor for edges
            scl_oe_d <= scl_oe;
            
            // - scl oe falling edge, scl low
            // - slave stretching, scl low
            stretch_clk <= (scl_oe & ~scl_oe_d & ~io_scl) |
                           (stretch_clk & ~io_scl);
        end
        
        if (i_rst) begin
            counter <= 0;
            stretch_clk <= 0;
        end 
        else begin
            if (counter == CLK_DIVIDER) begin 
                counter <= 0;
            end
            else begin
                if (stretch_clk == 1'b0) begin
                    counter <= counter + 1;
                end
                else begin
                    counter <= 0;
                end
            end
        end
    end
    
    assign fsm_tick = (counter == CLK_DIVIDER);
    /*** tick generator ***/
    
    /*** fsm for the frame ***/
    // states
    integer state;
    parameter S_IDLE = 0,       // idle
              S_START_0 = 10,   // start
              S_START_1 = 11,
              S_START_2 = 12,
              S_START_3 = 13,
              S_START_4 = 14,
              S_STOP_0 = 20,    // stop
              S_STOP_1 = 21,
              S_STOP_2 = 22,
              S_STOP_3 = 23,
              S_WRITE_0 = 30,   //write
              S_WRITE_1 = 31,
              S_WRITE_2 = 32,
              S_WRITE_3 = 33,
              S_READ_0 = 40,    //read
              S_READ_1 = 41, 
              S_READ_2 = 42, 
              S_READ_3 = 43; 
              
    // signals
    reg start;
    reg stop;
    reg write;
    reg read;
    
    // transfer state
    reg [3:0]   shift_count;
    reg [7:0]   shift_reg;
    
    // ack state
    reg ack_r;
    
    always @(posedge i_clk) begin
        /*** frame operation signals ***/
        // reset the done signal
        o_done <= 0;
        if (o_done) begin
            start <= 0;
            stop <= 0;
            write <= 0;
            read <= 0;
        end
        
        if (i_start) begin
            start <= 1;
        end
        
        if (i_stop) begin
            stop <= 1;
        end
        
        if (i_write) begin
            write <= 1;
            shift_count <= 8;
            shift_reg <= i_mosi_data;
        end
        
        if (i_read) begin
            read <= 1;
            shift_count <= 8;
            shift_reg <= 8'h00;
            ack_r <= i_ack_r;
        end
        /*** frame operation signals ***/
        
        /*** state machine ***/
        if (i_rst) begin 
            state <= S_IDLE;
            
            scl_oe <= 1;
            sda_oe <= 1;
            sda_out <= 1;
            
            shift_count <= 0;
            shift_reg <= 0;
            
            start <= 0;
            stop <= 0;
            write <= 0;
            read <= 0;
            ack_r <= 0;
        end 
        else if (fsm_tick) begin 
            case (state) 
                S_IDLE: begin
                    if (start) begin
                        sda_out <= 0;
                        state <= S_START_0;
                    end
                    else if (stop) begin
                        sda_out <= 0;
                        state <= S_STOP_0;
                    end
                    else if (write) begin
                        state <= S_WRITE_0;
                    end 
                    else if (read) begin
                        state <= S_READ_0;
                    end
                end
                
                /*** start ***/
                S_START_0: begin
                    sda_oe <= 1;
                    state <= S_START_1;
                end
                
                S_START_1: begin
                    scl_oe <= 1;
                    sda_oe <= 1;
                    state <= S_START_2;
                end
                
                S_START_2: begin
                    scl_oe <= 1;
                    sda_oe <= 0;
                    state <= S_START_3;
                end
                
                S_START_3: begin
                    // additional hold time for fast clock
                    state <= S_START_4;
                end
                
                S_START_4: begin
                    scl_oe <= 0;
                    o_done <= 1;
                    state <= S_IDLE;
                end
                /*** start ***/
                
                /*** stop ***/
                S_STOP_0: begin
                    scl_oe <= 0;
                    sda_oe <= 0;
                    state <= S_STOP_1;
                end
                
                S_STOP_1: begin
                    scl_oe <= 1;
                    state <= S_STOP_2;
                end
                
                S_STOP_2: begin
                    // additional hold time for fast clock
                    state <= S_STOP_3;
                end
                
                S_STOP_3: begin
                    sda_oe <= 1;
                    o_done <= 1;
                    state <= S_IDLE;
                end
                /*** stop ***/
                
                /*** write ***/
                S_WRITE_0: begin
                    scl_oe <= 0;
                    sda_out <= shift_reg[7];
                    shift_reg <= { shift_reg[6:0], 1'b0 };
                    sda_oe <= (shift_count == 0);
                    state <= S_WRITE_1;
                end
                
                S_WRITE_1: begin 
                    scl_oe <= 1;
                    // read ack from slave
                    if (shift_count == 0) begin
                        o_ack_w <= io_sda;
                    end
                    state <= S_WRITE_2; 
                end 
                
                S_WRITE_2: begin
                    state <= S_WRITE_3;
                end 
                
                S_WRITE_3: begin
                    scl_oe <= 0;
                    sda_oe <= 0;
                    if (shift_count > 0) begin
                        shift_count <= shift_count - 1;
                        state <= S_WRITE_0;
                    end
                    else begin 
                        o_done <= 1;
                        state <= S_IDLE;
                    end
                end
                /*** write ***/
                
                /*** read ***/
                S_READ_0: begin
                    scl_oe <= 0;
                    if (shift_count == 0) begin
                        // write ack to slave
                        sda_oe <= 0;
                        sda_out <= i_ack_r;
                    end
                    else begin
                        sda_oe <= 1;
                    end
                    state <= S_READ_1;
                end
                
                S_READ_1: begin
                    scl_oe <= 1;
                    state <= S_READ_2;
                end
                
                S_READ_2: begin
                    if (shift_count > 0) begin
                        shift_reg <= { shift_reg[6:0], io_sda };
                    end
                    state <= S_READ_3;
                end
                
                S_READ_3: begin
                    scl_oe <= 0;
                    if (shift_count > 0) begin
                        shift_count <= shift_count - 1;
                        state <= S_READ_0;
                    end 
                    else begin
                        o_done <= 1;
                        state <= S_IDLE;
                    end
                end
                /*** read ***/
                
            endcase
        end
        /*** state machine ***/
    end
    /*** fsm for the frame ***/
    
endmodule
