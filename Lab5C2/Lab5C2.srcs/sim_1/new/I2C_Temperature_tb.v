`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2022 01:47:34 AM
// Design Name: 
// Module Name: I2C_Temperature_tb
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


module I2C_Temperature_tb();
    
    // wire up the module
    reg         button;
    wire [7:0]  led;
    
    // generate a clock signal
    reg     sys_clkn = 1;
    wire    sys_clkp;
    
    assign sys_clkp = ~sys_clkn;
    always begin 
        #5 sys_clkn = ~sys_clkn;
    end
    
   wire  ILA_Clk, ACK_bit, FSM_Clk, TrigerEvent; 
    wire SCL, SDA; 
    wire [7:0] State;
    wire [31:0] PC_control;
    reg button_control_reg = 0;
    
I2C_Transmit I2C_Test1 (        
        .led(led),
        .sys_clkn(sys_clkn),
        .sys_clkp(sys_clkp),
        .ADT7420_A0(),
        .ADT7420_A1(),
        .I2C_SCL_0(I2C_SCL_0),
        .I2C_SDA_0(I2C_SDA_0),             
        .FSM_Clk_reg(FSM_Clk),        
        .ILA_Clk_reg(ILA_Clk),
        .ACK_bit(ACK_bit),
        .SCL(SCL),
        .SDA(SDA),
        .State(State),
        .button_control(button_control_reg),
        .PC_control(PC_control),
        .okUH(),
        .okHU(),
        .okUHU(),
        .okAA()
        );
    
    initial begin
    #0 button_control_reg <= 0;
    
    #1_000_000 button_control_reg<=1;
    #1_000_000 button_control_reg<=0;
    end
    
endmodule
