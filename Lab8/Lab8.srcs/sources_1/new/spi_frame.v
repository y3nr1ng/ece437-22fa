`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 03:48:04 PM
// Design Name: 
// Module Name: spi_frame
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Handle communication with the SPI interface at frame level.
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spi_frame #(
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
    
    // wirings
    output reg          o_spi_en,
    output reg          o_spi_mosi,
    input               i_spi_miso,
    output reg          o_spi_clk
);
    
    /*** tick generator ***/
    reg [15:0]  counter = 0;
    wire fsm_clk;
    
    always @(posedge i_clk) begin     
        if (i_rst) begin
            counter <= 0;
        end 
        else begin
            if (counter == CLK_DIVIDER) begin 
                counter <= 0;
            end
            else begin
                counter <= counter + 1'b1;
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
              S_STOP_0 = 20,    // stop
              S_STOP_1 = 21,
              S_STOP_2 = 22,
              S_WRITE_0 = 30,   // write
              S_WRITE_1 = 31,
              S_WRITE_2 = 32,
              S_WRITE_3 = 33,
              S_READ_0 = 40,    // read
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
    assign o_miso_data = shift_reg;
    
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
            shift_count <= 4'd8;
            shift_reg <= i_mosi_data;
        end
        
        if (i_read) begin
            read <= 1;
            shift_count <= 4'd8;
            shift_reg <= 8'h00;
        end
        /*** frame operation signals ***/
        
        /*** state machine ***/
        if (i_rst) begin 
            state <= S_IDLE;
            
            o_spi_en <= 0;
            o_spi_mosi <= 0;
            o_spi_clk <= 0;
            
            shift_count <= 0;
            shift_reg <= 0;
            
            start <= 0;
            stop <= 0;
            write <= 0;
            read <= 0;
        end 
        else if (fsm_tick) begin 
            case (state) 
                S_IDLE: begin
                    if (start) begin
                        o_spi_mosi <= 0;
                        state <= S_START_0;
                    end
                    else if (stop) begin
                        o_spi_mosi <= 0;
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
                    o_spi_en <= 1;
                    o_spi_clk <= 0;
                    state <= S_START_1;
                end
                
                S_START_1: begin
                    // additional hold time, 1/2 clk
                    o_done <= 1;
                    state <= S_IDLE;
                end
                /*** start ***/
                
                /*** stop ***/
                S_STOP_0: begin
                    o_spi_clk <= 0;
                    state <= S_STOP_1;
                end
                
                S_STOP_1: begin
                    // additional hold time, 1 clk
                    o_spi_en <= 0;
                    state <= S_STOP_2;
                end
                
                S_STOP_2: begin
                    o_done <= 1;
                    state <= S_IDLE;
                end
                /*** stop ***/
                
                /*** write ***/
                S_WRITE_0: begin
                    o_spi_clk <= 0;
                    o_spi_mosi <= shift_reg[7];
                    shift_reg <= { shift_reg[6:0], 1'b0 };
                    shift_count <= shift_count - 1'b1;
                    state <= S_WRITE_1;
                end
                
                S_WRITE_1: begin 
                    o_spi_clk <= 1;
                    state <= S_WRITE_2; 
                end 
                
                S_WRITE_2: begin
                    state <= S_WRITE_3;
                end 
                
                S_WRITE_3: begin
                    o_spi_clk <= 0;
                    if (shift_count > 0) begin
                        //shift_count <= shift_count - 1'b1;
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
                    o_spi_clk <= 0;
                    state <= S_READ_1;
                end
                
                S_READ_1: begin
                    o_spi_clk <= 1;
                    state <= S_READ_2;
                end
                
                S_READ_2: begin
                    if (shift_count > 0) begin
                        shift_reg <= { shift_reg[6:0], i_spi_miso };
                        shift_count <= shift_count - 1'b1;
                    end
                    state <= S_READ_3;
                end
                
                S_READ_3: begin
                    o_spi_clk <= 0;
                    if (shift_count > 0) begin
                        //shift_count <= shift_count - 1'b1;
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
