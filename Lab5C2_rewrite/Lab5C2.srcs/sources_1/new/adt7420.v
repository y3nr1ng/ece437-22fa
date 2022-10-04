`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:51:43 PM
// Design Name: 
// Module Name: adt7420
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  The FSM that interact with the temperature sensor.
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adt7420 #(
    parameter A0 = 0,
    parameter A1 = 0
) (
    // clock
    input   clk,
    
    // chip address
    output  a0, 
    output  a1,
    
    // i2c interface
    inout   scl, 
    inout   sda,
    
    // control interface
    input               start,
    output reg          ready,
    output reg [15:0]   temperature,
    
    output              error
);
    
    /*** device address ***/
    // physical wirings
    assign a0 = A0;
    assign a1 = A1;
    
    reg [4:0] ADT_ADDR_BASE = 5'b10010;
    wire [6:0] adt_addr;
    assign adt_addr = { ADT_ADDR_BASE, a1, a0 };
    
    initial begin
        ready <= 0;
    end
    /*** device address ***/
    
    /*** the i2c interface ***/
    reg [7:0] reg_addr = 0;
    reg [7:0] mosi_data = 0;
    wire [7:0] miso_data;
    
    reg enable = 0;
    reg rw = 0;
    wire busy = 0;
    i2c_master #(
        .DATA_WIDTH(8),
        .REG_WIDTH(8),
        .ADDR_WIDTH(7)
    ) i2c_master_inst (
            .i_clk(clk),
            .i_divider(16'd4), 
            
            .i_rst(1'b0), // TODO
            .i_enable(enable),
            .i_rw(rw),
            .o_busy(busy),
            .i_device_addr(adt_addr),
            .i_reg_addr(reg_addr),
            .i_mosi_data(mosi_data),
            .o_miso_data(miso_data),
            .o_error(),
            
            .io_sda(sda),
            .io_scl(scl)
    );
    /*** the i2c interface ***/
    
    /*** fsm ***/
    localparam ADT_IDLE         = 3'd0;
    localparam ADT_REQUEST_MSB  = 3'd1;
    localparam ADT_WAIT_MSB     = 3'd2;
    localparam ADT_REQUEST_LSB  = 3'd3;
    localparam ADT_WAIT_LSB     = 3'd4; 
    
    reg [2:0] state = ADT_IDLE;
    always @(posedge clk) begin 
        case (state)
            ADT_IDLE: begin 
                if (start) begin
                    state <= ADT_REQUEST_MSB; 
                    
                    ready <= 0;
                end
            end

            ADT_REQUEST_MSB: begin
                reg_addr <= 8'h00; // 0x00
                
                rw <= 1;
                enable <= 1;
                
                state <= ADT_WAIT_MSB; 
            end
            
            ADT_WAIT_MSB: begin
                enable <= 0;
                
                if (~busy) begin
                    state <= ADT_REQUEST_LSB;
                    temperature[15:8] <= miso_data;
                end 
            end
            
            ADT_REQUEST_LSB: begin 
                reg_addr <= 8'h01; // 0x01
                
                rw <= 1;
                enable <= 1;
                
                state <= ADT_WAIT_LSB; 
            end
            
            ADT_WAIT_LSB: begin
                enable <= 0;
                
                if (~busy) begin
                    state <= ADT_IDLE;
                    temperature[7:0] <= miso_data;
                    
                    ready <= 1;
                end 
            end
        endcase
    end
    /*** fsm ***/
    
endmodule
