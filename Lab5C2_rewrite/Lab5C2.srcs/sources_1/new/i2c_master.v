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
    parameter CLK_STRETCH_SUPPORT = 1,
    parameter CLK_DIVIDER = 16'd32
) (
    input               i_clk,
    
    // controls
    input               i_rst,     
    input               i_start,   
    output reg          o_done,
    
    // data
    input               i_mem_clk,
    input               i_mem_start,
    input               i_mem_write,
    input               i_mem_read,
    input  [7:0]        i_mem_data,
    output [7:0]        o_mem_data,
    
    // wirings
    inout               io_scl,
    inout               io_sda
);
    
    /*** frame tokenizer ***/
    reg             start;
    reg             stop;
    reg             write;
    reg             read;
    wire            done;
    reg             ack_r;
    reg     [7:0]   mosi_data;
    wire    [7:0]   miso_data;
    
    i2c_frame #(
        .CLK_STRETCH_SUPPORT (CLK_STRETCH_SUPPORT),
        .CLK_DIVIDER (CLK_DIVIDER)
    ) tokenizer (
        .i_clk (i_clk),
        
        // controls
        .i_rst (i_rst),
        .i_start (start),
        .i_stop (stop),
        .i_write (write),
        .i_read (read),
        .o_done (done),
        
        // data
        .i_mosi_data (mosi_data),
        .o_miso_data (miso_data),
        .i_ack_r (ack_r),
        .o_ack_w (),
        
        // wirings
        .io_scl (io_scl),
        .io_sda (io_sda)
    );
    /*** frame tokenizer ***/
    
    /*** memory ***/
    reg [5:0] mem_addr;
    
    always @(posedge i_mem_clk) begin
        if (i_mem_start) begin
            mem_addr <= 0;
        end
        else begin
            if (i_mem_write || i_mem_read) begin 
                mem_addr <= mem_addr + 1;
            end
        end
    end
    
    // command memory
    reg     [5:0]   cmem_addr;
    wire    [7:0]   cmem_data;
    dram64x8 cmem (
        .i_clk (i_mem_clk),
        
        .i_we (i_mem_write),
        .i_data (i_mem_data),
        
        .i_addr_a (mem_addr),
        .o_data_a (),
        
        .i_addr_b (cmem_addr),
        .o_data_b (cmem_data)
    );
    
    // result memory
    reg     [5:0]   rmem_addr;
    reg             rmem_write;
    dram64x8 rmem (
        .i_clk (i_mem_clk),
        
        .i_we (rmem_write),
        .i_data (miso_data),
        
        .i_addr_a (rmem_addr),
        .o_data_a (),
        
        .i_addr_b (mem_addr),
        .o_data_b (o_mem_data)
    );
    /*** memory ***/
    
    /*** fsm for the communication ***/
    integer state;
    parameter S_IDLE = 0,
              S_GET_PREAMBLE_LENGTH = 10,   // get transaction info
              S_GET_PREAMBLE_STARTS = 11,
              S_GET_PREAMBLE_STOPS = 12, 
              S_GET_PAYLOAD_LENGTH = 13,
              S_PREAMBLE_START = 20,        // preamble
              S_PREAMBLE_STARTWAIT = 21,
              S_PREAMBLE_TX = 22, 
              S_PREAMBLE_TXWAIT = 23,
              S_PREAMBLE_STARTSTOPWAIT = 24,
              S_PREAMBLE_NEXT = 25,
              S_PAYLOAD = 30,               // payload
              S_PAYLOAD_WAIT = 31,
              S_PAYLOAD_STOP = 32,
              S_PAYLOAD_STOPWAIT = 33;
             
    
    reg write_frame;
    
    reg [2:0]   preamble_length;
    reg [2:0]   preamble_count;
    reg [7:0]   preamble_starts;
    wire        preamble_start;
    reg [7:0]   preamble_stops;
    wire        preamble_stop;
    reg [6:0]   payload_length;
    reg [6:0]   payload_count;
    
    mux8to1 mux_starts (
        .i_data (preamble_starts),
        .sel (preamble_count),
        .o_data (preamble_start) 
    );
    
    mux8to1 mux_stops (
        .i_data (preamble_stops),
        .sel (preamble_count),
        .o_data (preamble_stop)
    );
    
    always @(posedge i_clk) begin
        if (i_rst) begin
            state <= S_IDLE;
            
            o_done <= 0;
            
            cmem_addr <= 0;
            rmem_addr <= 0;
            rmem_write <= 0;
            
            start <= 0;
            stop <= 0;
            write <= 0; 
            read <= 0;
            
            write_frame <= 0;
            ack_r <= 0;
            mosi_data <= 0;
            
            preamble_length <= 0;
            preamble_count <= 0;
            preamble_starts <= 0;
            preamble_stops <= 0;
            payload_length <= 0;
            payload_count <= 0;
        end 
        else begin
            start <= 0;
            stop <= 0;
            write <= 0; 
            read <= 0;
            o_done <= 0;
            rmem_write <= 0;
            
            case (state) 
                S_IDLE: begin
                    cmem_addr <= 6'h00;
                    rmem_addr <= 6'h3f;
                    if (i_start) begin
                        state <= S_GET_PREAMBLE_LENGTH;
                    end
                end
                
                /*** initialize ***/
                S_GET_PREAMBLE_LENGTH: begin
                    preamble_length <= cmem_data[2:0];
                    write_frame <= ~cmem_data[7];
                    cmem_addr <= cmem_addr + 1;
                    state <= S_GET_PREAMBLE_STARTS; 
                end
                
                S_GET_PREAMBLE_STARTS: begin
                    preamble_starts <= cmem_data[7:0];
                    cmem_addr <= cmem_addr + 1;
                    state <= S_GET_PREAMBLE_STOPS;
                end
                
                S_GET_PREAMBLE_STOPS: begin
                    preamble_stops <= cmem_data[7:0];
                    cmem_addr <= cmem_addr + 1;
                    state <= S_GET_PAYLOAD_LENGTH;
                end
                
                S_GET_PAYLOAD_LENGTH: begin 
                    payload_length <= cmem_data[6:0];
                    payload_count <= 0;
                    cmem_addr <= cmem_addr + 1;
                    state <= S_PREAMBLE_START;
                end
                /*** initialize ***/ 
                
                /*** preamble ***/
                S_PREAMBLE_START: begin
                    preamble_count <= 0; 
                    start <= 1;
                    state <= S_PREAMBLE_STARTWAIT;
                end
                
                S_PREAMBLE_STARTWAIT: begin
                    if (done) begin
                        state <= S_PREAMBLE_TX;
                    end
                end
                
                S_PREAMBLE_TX: begin
                    write <= 1;
                    mosi_data <= cmem_data[7:0];
                    cmem_addr <= cmem_addr + 1;
                    state <= S_PREAMBLE_TXWAIT;
                end
                
                S_PREAMBLE_TXWAIT: begin
                    if (done) begin
                        preamble_count <= preamble_count + 1;
                        state <= S_PREAMBLE_NEXT;
                        if (preamble_start) begin
                            start <= 1;
                            state <= S_PREAMBLE_STARTSTOPWAIT;
                        end 
                        else if (preamble_stop) begin
                            stop <= 1;
                            state <= S_PREAMBLE_STARTSTOPWAIT; 
                        end
                    end
                end
                
                S_PREAMBLE_STARTSTOPWAIT: begin
                    if (done) begin
                        state <= S_PREAMBLE_NEXT;
                    end
                end
                
                S_PREAMBLE_NEXT: begin
                    if (preamble_count == preamble_length) begin
                        state <= S_PAYLOAD; 
                    end 
                    else begin
                        state <= S_PREAMBLE_TX;
                    end 
                end
                /*** preamble ***/
                
                /*** payload ***/
                S_PAYLOAD: begin
                    payload_count <= payload_count + 1;
                    state <= S_PAYLOAD_WAIT;
                    if (write_frame) begin
                        write <= 1;
                        mosi_data <= cmem_data[7:0];
                        cmem_addr <= cmem_addr + 1;
                    end 
                    else begin
                        read <= 1;
                        
                        // send nack 
                        if (payload_count == payload_length - 1) begin
                            ack_r <= 1;
                        end 
                        else begin
                            ack_r <= 0;
                        end
                    end
                end
                
                S_PAYLOAD_WAIT: begin
                    if (done) begin 
                        if (write_frame) begin  
                            rmem_write <= 1;
                            rmem_addr <= rmem_addr + 1;
                        end 
                        
                        if (payload_count == payload_length) begin
                            state <= S_PAYLOAD_STOP;
                        end
                        else begin
                            state <= S_PAYLOAD;
                        end
                    end
                end
                
                S_PAYLOAD_STOP: begin
                    stop <= 1;
                    state <= S_PAYLOAD_STOPWAIT; 
                end
                
                S_PAYLOAD_STOPWAIT: begin
                    if (done) begin 
                        o_done <= 1;
                        state <= S_IDLE;
                    end
                end
                /*** payload ***/
                
            endcase
        end
    end
    /*** fsm for the communication ***/
    
endmodule
