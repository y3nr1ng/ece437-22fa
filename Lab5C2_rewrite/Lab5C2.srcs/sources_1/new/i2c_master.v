`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2022 04:51:16 PM
// Design Name: 
// Module Name: i2c_tx
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


module i2c_master #(
    parameter ADDR_WIDTH = 7,
    parameter REG_WIDTH = 8, 
    parameter DATA_WIDTH = 8
)(
    // clock
    input               i_clk,
    input wire [15:0]   i_divider, // clock divider
    
    // controls
    input               i_rst,      // reset
    input               i_enable,   // kick start the transfer
    input               i_rw,       // 0: write, 1: read
    output reg          o_busy,     // 1: busy
    input       [ADDR_WIDTH-1:0]    i_device_addr,  // device address
    input       [REG_WIDTH-1:0]     i_reg_addr,     // register address
    input       [DATA_WIDTH-1:0]    i_mosi_data,    // data to send
    output reg  [DATA_WIDTH-1:0]    o_miso_data,    // data to read
    output reg          o_error,    // 1: error             
    
    // physical wirings
    inout               io_scl,
    inout               io_sda
);
    
    /*** tick generator ***/
    reg [15:0]  counter = 0;
    wire        fsm_tick;
    
    always @(posedge i_clk) begin
        if (i_rst) begin 
            counter <= 0;
        end 
        else begin
            if (counter == i_divider) begin
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
            end
        end    
    end
    
    assign fsm_tick = (counter == i_divider);
    /*** tick generator ***/
    
    /*** input output buffers ***/
    reg enable = 0;
    reg rw = 0;
    
    reg [ADDR_WIDTH-1:0]    device_addr = 0;
    reg [REG_WIDTH-1:0]     reg_addr = 0;
    reg [DATA_WIDTH-1:0]    mosi_data = 0;
    reg [DATA_WIDTH-1:0]    byte_data = 0;
    reg ack_recv = 0;
    
    reg scl_out = 1;
    reg sda_out = 1;
    /*** input output buffers ***/

    /*** main fsm ***/
    localparam I2C_IDLE                 = 4'd0;
    localparam I2C_START                = 4'd1;
    localparam I2C_WRITE_DEVICE_ADDR_W  = 4'd2;
    localparam I2C_WRITE_REG_ADDR       = 4'd3;
    localparam I2C_WRITE_REG_DATA       = 4'd4;
    localparam I2C_WRITE_BITS           = 4'd5;
    localparam I2C_CHECK_ACK            = 4'd6;
    localparam I2C_READ_REG_DATA        = 4'd7;
    localparam I2C_RESTART              = 4'd8;
    localparam I2C_WRITE_DEVICE_ADDR_R  = 4'd9;
    localparam I2C_READ_BITS            = 4'd10;
    localparam I2C_SEND_ACK             = 4'd11;
    localparam I2C_SEND_NACK            = 4'd12;
    localparam I2C_STOP                 = 4'd13;
    
    localparam I2C_STEP_PREPARE     = 2'd0;
    localparam I2C_STEP_RISING      = 2'd1;
    localparam I2C_STEP_STRETCHING  = 2'd2;
    localparam I2C_STEP_FALLING     = 2'd3;
    
    reg [3:0] state = I2C_IDLE;     
    reg [3:0] ack_state = I2C_IDLE; // state after an ack    
    reg [1:0] step_counter = 0;     // fraction steps in each state
    reg [3:0] bit_counter = 0;      // assume maximum tranferrable 16 bits
    
    always @(posedge i_clk) begin 
        if (i_rst) begin
            enable <= 0;
            rw <= 0;
            device_addr <= 0;
            reg_addr <= 0;
            mosi_data <= 0;
            o_busy <= 0;
            
            ack_recv <= 0;
            
            o_error <= 0;
            
            step_counter <= 0;
            state <= I2C_IDLE;
            
            scl_out <= 1;
            sda_out <= 1;
        end
        else if (fsm_tick) begin
            case (state)
                I2C_IDLE: begin
                    // pull input and set output
                    enable <= i_enable;
                    rw <= i_rw;
                    device_addr <= i_device_addr;
                    reg_addr <= i_reg_addr;
                    mosi_data <= i_mosi_data;
                    o_busy <= 0;
                    
                    ack_recv <= 0;
                    
                    o_error <= 0;
                    
                    step_counter <= 0;
                    if (enable) begin
                        state <= I2C_START;
                    end
                    
                    // idle physical state
                    scl_out <= 1;
                    sda_out <= 1;
                end 
                
                I2C_START: begin
                    //  1) clear sda
                    //  2) clear scl
                    case (step_counter) 
                        I2C_STEP_PREPARE: begin
                            step_counter <= 1;
                            
                            o_busy <= 1;
                            enable <= 0;
                        end
                        
                        I2C_STEP_RISING: begin
                            step_counter <= 2;
                            
                            sda_out <= 0;
                        end
                        
                        I2C_STEP_STRETCHING: begin
                            step_counter <= 3;                         
                        end
                        
                        I2C_STEP_FALLING: begin 
                            step_counter <= 0; 
                            
                            scl_out <= 0;
                            state <= I2C_WRITE_DEVICE_ADDR_W;
                        end
                    endcase
                end
                
                I2C_WRITE_DEVICE_ADDR_W: begin
                    bit_counter <= ADDR_WIDTH;
                    byte_data <= { device_addr, 1'b0 }; // write
                    
                    state <= I2C_WRITE_BITS; 
                    ack_state <= I2C_WRITE_REG_ADDR;
                end
                
                I2C_WRITE_REG_ADDR: begin
                    bit_counter <= REG_WIDTH;
                    byte_data <= reg_addr;
                    
                    state <= I2C_WRITE_BITS; 
                    if (rw == 0) begin
                        ack_state <= I2C_WRITE_REG_DATA;
                    end
                    else begin 
                        ack_state <= I2C_READ_REG_DATA;
                    end
                end
                
                I2C_WRITE_REG_DATA: begin 
                    bit_counter <= DATA_WIDTH;
                    byte_data <= mosi_data;
                    
                    state <= I2C_WRITE_BITS;
                    ack_state <= I2C_STOP;
                end
                
                I2C_WRITE_BITS: begin
                    //  1) set/clear sda
                    //  2) set scl
                    //  3) clock stretching
                    //  4) clear scl
                    case (step_counter) 
                        I2C_STEP_PREPARE: begin
                            step_counter <= 1;
                            
                            sda_out <= byte_data[bit_counter-1];
                            bit_counter <= bit_counter - 1;
                        end
                        
                        I2C_STEP_RISING: begin
                            step_counter <= 2;
                            
                            scl_out <= 1;
                        end
                        
                        I2C_STEP_STRETCHING: begin
                            if (io_scl == 1) begin
                                step_counter <= 3;
                            end                         
                        end
                        
                        I2C_STEP_FALLING: begin 
                            step_counter <= 0; 
                            
                            scl_out <= 0;
                            if (bit_counter == 0) begin
                                state <= I2C_CHECK_ACK;
                            end
                        end
                    endcase
                end
                
                I2C_CHECK_ACK: begin 
                    case (step_counter) 
                        I2C_STEP_PREPARE: begin
                            step_counter <= 1;
                        end
                        
                        I2C_STEP_RISING: begin
                            step_counter <= 2;
                            
                            scl_out <= 1;
                        end
                        
                        I2C_STEP_STRETCHING: begin
                            if (io_scl == 1) begin
                                step_counter <= 3;
                                
                                // read ack
                                ack_recv <= ~io_sda;
                            end                         
                        end
                        
                        I2C_STEP_FALLING: begin 
                            step_counter <= 0; 
                            
                            scl_out <= 0;
                            
                            if (ack_recv) begin
                                state <= ack_state;
                            end 
                            else begin
                                state <= I2C_IDLE; // damaged frame
                            end
                        end
                    endcase
                end
                
                I2C_READ_REG_DATA: begin
                    bit_counter <= DATA_WIDTH;
                    
                    state <= I2C_RESTART;
                end
                
                I2C_RESTART: begin 
                    //  1) sda hi-z
                    //  2) set scl
                    //  3) clock stretching
                    //  4) clear scl
                    case (step_counter) 
                        I2C_STEP_PREPARE: begin
                            step_counter <= 1;
                        end
                        
                        I2C_STEP_RISING: begin
                            step_counter <= 2;
                            
                            scl_out <= 1;
                        end
                        
                        I2C_STEP_STRETCHING: begin
                            if (io_scl == 1) begin
                                step_counter <= 3;
                            end                         
                        end
                        
                        I2C_STEP_FALLING: begin 
                            step_counter <= 0; 
                            
                            scl_out <= 0;
                            
                            state <= I2C_WRITE_DEVICE_ADDR_R;
                        end
                    endcase
                end
                
                I2C_WRITE_DEVICE_ADDR_R: begin
                    bit_counter <= ADDR_WIDTH;
                    byte_data <= { device_addr, 1'b1 }; // read
                    
                    state <= I2C_WRITE_BITS; 
                    ack_state <= I2C_READ_BITS;
                end
                
                I2C_READ_BITS: begin
                    //  1) sda hi-z
                    //  2) set scl
                    //  3) clock stretching
                    //  4) clear scl
                    case (step_counter) 
                        I2C_STEP_PREPARE: begin
                            step_counter <= 1;
                        end
                        
                        I2C_STEP_RISING: begin
                            step_counter <= 2;
                            
                            scl_out <= 1;
                        end
                        
                        I2C_STEP_STRETCHING: begin
                            if (io_scl == 1) begin
                                step_counter <= 3;
                                
                                o_miso_data[bit_counter-1] <= io_sda;
                                bit_counter <= bit_counter - 1;
                            end                         
                        end
                        
                        I2C_STEP_FALLING: begin 
                            step_counter <= 0; 
                            
                            scl_out <= 0;
                            if (bit_counter == 0) begin
                                state <= I2C_SEND_NACK;
                            end
                        end
                    endcase
                end
                
                I2C_SEND_ACK: begin 
                    // TODO use in multi-byte read
                    o_error <= 1;
                    state <= I2C_IDLE;
                end
                
                I2C_SEND_NACK: begin 
                    case (step_counter) 
                        I2C_STEP_PREPARE: begin
                            step_counter <= 1;
                            
                            sda_out <= 1;
                        end
                        
                        I2C_STEP_RISING: begin
                            step_counter <= 2;
                            
                            scl_out <= 1;
                        end
                        
                        I2C_STEP_STRETCHING: begin
                            if (io_scl == 1) begin
                                step_counter <= 3;
                                
                                // reset ack reg
                                ack_recv <= 0;
                            end                         
                        end
                        
                        I2C_STEP_FALLING: begin 
                            step_counter <= 0; 
                            
                            scl_out <= 0;
                            
                            state <= I2C_STOP;
                        end
                    endcase
                end 
                
                I2C_STOP: begin 
                    //  1) clear sda
                    //  2) set scl
                    //  3) set sda
                    case (step_counter) 
                        I2C_STEP_PREPARE: begin
                            step_counter <= 1;
                            
                            sda_out <= 0;
                        end
                        
                        I2C_STEP_RISING: begin
                            step_counter <= 2;
                            
                            scl_out <= 1;
                        end
                        
                        I2C_STEP_STRETCHING: begin
                            if (io_scl == 1) begin
                                step_counter <= 3;
                            end                         
                        end
                        
                        I2C_STEP_FALLING: begin 
                            step_counter <= 0; 
                            
                            sda_out <= 1;
                            
                            state <= I2C_IDLE;
                        end
                    endcase
                end
                
                default: begin
                    o_error <= 1;
                    state <= I2C_IDLE;
                end
            endcase
        end
    end
    /*** main fsm ***/
    
    /*** hi-z control ***/
    wire scl_oe;
    assign scl_oe = (step_counter != I2C_STEP_STRETCHING); // step 2 is for clock stretching
    assign io_scl = (scl_oe) ? scl_out : 1'bz;
    
    wire sda_oe;
    assign sda_oe = (state != I2C_IDLE) & (state != I2C_CHECK_ACK) & (state != I2C_READ_BITS);
    assign io_sda = (sda_oe) ? sda_out : 1'bz;
    /*** hi-z control ***/
    
endmodule
