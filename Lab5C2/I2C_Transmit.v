`timescale 1ns / 1ps

module I2C_Transmit(    
    output [7:0] led,
    input  sys_clkn,
    input  sys_clkp,
    output ADT7420_A0,
    output ADT7420_A1,
    output I2C_SCL_0,
    inout  I2C_SDA_0,        
    output reg FSM_Clk_reg,    
    output reg ILA_Clk_reg,
    output reg ACK_bit,
    output reg SCL,
    output reg SDA,
    output reg [7:0] State,
    input               button_control,
    output wire [31:0] PC_control,
    input  wire    [4:0] okUH,
    output wire    [2:0] okHU,
    inout  wire    [31:0] okUHU,   
    inout wire okAA     
    );
    
    //Instantiate the ClockGenerator module, where three signals are generate:
    //High speed CLK signal, Low speed FSM_Clk signal     
    wire [23:0] ClkDivThreshold = 100;   
    wire FSM_Clk, ILA_Clk; 
    ClockGenerator ClockGenerator1 (  .sys_clkn(sys_clkn),
                                      .sys_clkp(sys_clkp),                                      
                                      .ClkDivThreshold(ClkDivThreshold),
                                      .FSM_Clk(FSM_Clk),                                      
                                      .ILA_Clk(ILA_Clk) );
                                        
    reg [6:0] DeviceAddress = 7'b100_1000;  // device 0x48
    reg [7:0] TempReadAddress = 8'h00;
    reg error_bit = 1'b1;      
      
      
     reg [7:0] temp_msb = 0;
     reg [7:0] temp_lsb = 0;
     
    localparam STATE_INIT       = 8'd0;    
    assign led[7] = ACK_bit;
    assign led[6] = error_bit;
    assign ADT7420_A0 = 1'b0;
    assign ADT7420_A1 = 1'b0;
    assign I2C_SCL_0 = SCL;
    assign I2C_SDA_0 = SDA; 
    
    initial  begin
        SCL = 1'b1;
        SDA = 1'b1;
        ACK_bit = 1'b1;  
        State = 8'd0; 
    end
    
    always @(*) begin          
        FSM_Clk_reg = FSM_Clk;
        ILA_Clk_reg = ILA_Clk;   
    end   
                               
    always @(posedge FSM_Clk) begin                       
        case (State)
            STATE_INIT : begin
                 if (PC_control[0] == 1'b1 || button_control == 1'b1) State <= 8'd1;                    
                 else begin                 
                      SCL <= 1'b1;
                      SDA <= 1'b1;
                      State <= 8'd0;
                  end
            end            
            
            // This is the Start sequence            
            8'd1 : begin SCL <= 1'b1; SDA <= 1'b0; State <= State + 1'b1; end   
            
            8'd2 : begin SCL <= 1'b0; SDA <= 1'b0; State <= State + 1'b1; end   
            
            //
            // device address, write
            //
            
            // transmit bit 7   
            8'd3 : begin SCL <= 1'b0; SDA <= DeviceAddress[6]; State <= State + 1'b1; end   

            8'd4 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd5 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd6 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 6
            8'd7 : begin SCL <= 1'b0; SDA <= DeviceAddress[5]; State <= State + 1'b1; end   

            8'd8 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd9 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd10 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 5
            8'd11 : begin SCL <= 1'b0; SDA <= DeviceAddress[4]; State <= State + 1'b1; end   

            8'd12 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd13 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd14 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 4
            8'd15 : begin SCL <= 1'b0; SDA <= DeviceAddress[3]; State <= State + 1'b1; end   

            8'd16 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd17 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd18 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 3
            8'd19 : begin SCL <= 1'b0; SDA <= DeviceAddress[2]; State <= State + 1'b1; end   

            8'd20 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd21 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd22 : begin SCL <= 1'b0; State <= State + 1'b1; end  
            
            // transmit bit 2
            8'd23 : begin SCL <= 1'b0; SDA <= DeviceAddress[1]; State <= State + 1'b1; end   

            8'd24 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd25 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd26 : begin SCL <= 1'b0; State <= State + 1'b1; end  
 
            // transmit bit 1
            8'd27 : begin SCL <= 1'b0; SDA <= DeviceAddress[0]; State <= State + 1'b1; end   

            8'd28 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd29 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd30 : begin SCL <= 1'b0; State <= State + 1'b1; end
            
            // transmit bit 0
            8'd31 : begin SCL <= 1'b0; SDA <= 1'b0; State <= State + 1'b1; end   

            8'd32 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd33 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd34 : begin SCL <= 1'b0; State <= State + 1'b1; end  
                        
            // read the ACK bit from the sensor and display it on LED[7]
            8'd35 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd36 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd37 : begin SCL <= 1'b1; ACK_bit <= SDA; State <= State + 1'b1; end   

            8'd38 : begin SCL <= 1'b0; State <= State + 1'b1; end 
            
            //
            // register address
            //
            
            // transmit bit 7   
            8'd39 : begin SCL <= 1'b0; SDA <= TempReadAddress[7]; State <= State + 1'b1; end   

            8'd40 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd41 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd42 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 6
            8'd43 : begin SCL <= 1'b0; SDA <= TempReadAddress[6]; State <= State + 1'b1; end   

            8'd44 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd45 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd46 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 5
            8'd47 : begin SCL <= 1'b0; SDA <= TempReadAddress[5]; State <= State + 1'b1; end   

            8'd48 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd49 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd50 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 4
            8'd51 : begin SCL <= 1'b0; SDA <= TempReadAddress[4]; State <= State + 1'b1; end   

            8'd52 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd53 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd54 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 3
            8'd55 : begin SCL <= 1'b0; SDA <= TempReadAddress[3]; State <= State + 1'b1; end   

            8'd56 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd57 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd58 : begin SCL <= 1'b0; State <= State + 1'b1; end  
            
            // transmit bit 2
            8'd59 : begin SCL <= 1'b0; SDA <= TempReadAddress[2]; State <= State + 1'b1; end   

            8'd60 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd61 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd62 : begin SCL <= 1'b0; State <= State + 1'b1; end  
 
            // transmit bit 1
            8'd63 : begin SCL <= 1'b0; SDA <= TempReadAddress[1]; State <= State + 1'b1; end   

            8'd64 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd65 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd66 : begin SCL <= 1'b0; State <= State + 1'b1; end
            
            // transmit bit 0
            8'd67 : begin SCL <= 1'b0; SDA <= TempReadAddress[0]; State <= State + 1'b1; end   

            8'd68 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd69 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd70 : begin SCL <= 1'b0; State <= State + 1'b1; end  
                        
            // read the ACK bit from the sensor and display it on LED[7]
            8'd71 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd72 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd73 : begin SCL <= 1'b1; ACK_bit <= SDA; State <= State + 1'b1; end   

            8'd74 : begin SCL <= 1'b0; State <= State + 1'b1; end 
            
            //
            // Restart sequence    
            //
            
            // this is the restart sequence
            8'd75 : begin SCL <= 1'b0; SDA <= 1'b1; State <= State + 1'b1; end   

            8'd76 : begin SCL <= 1'b1; SDA <= 1'b1; State <= State + 1'b1; end 
              
            8'd77 : begin SCL <= 1'b1; SDA <= 1'b0; State <= State + 1'b1; end   
            
            8'd78 : begin SCL <= 1'b0; SDA <= 1'b0; State <= State + 1'b1; end   
            
            //
            // device address, read
            //
            
            // transmit bit 7   
            8'd79 : begin SCL <= 1'b0; SDA <= DeviceAddress[6]; State <= State + 1'b1; end   

            8'd80 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd81 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd82 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 6
            8'd83 : begin SCL <= 1'b0; SDA <= DeviceAddress[5]; State <= State + 1'b1; end   

            8'd84 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd85 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd86 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 5
            8'd87 : begin SCL <= 1'b0; SDA <= DeviceAddress[4]; State <= State + 1'b1; end   

            8'd88 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd89 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd90 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 4
            8'd91 : begin SCL <= 1'b0; SDA <= DeviceAddress[3]; State <= State + 1'b1; end   

            8'd92 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd93 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd94 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 3
            8'd95 : begin SCL <= 1'b0; SDA <= DeviceAddress[2]; State <= State + 1'b1; end   

            8'd96 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd97 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd98 : begin SCL <= 1'b0; State <= State + 1'b1; end  
            
            // transmit bit 2
            8'd99 : begin SCL <= 1'b0; SDA <= DeviceAddress[1]; State <= State + 1'b1; end   

            8'd100 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd101 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd102 : begin SCL <= 1'b0; State <= State + 1'b1; end  
 
            // transmit bit 1
            8'd103 : begin SCL <= 1'b0; SDA <= DeviceAddress[0]; State <= State + 1'b1; end   

            8'd104 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd105 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd106 : begin SCL <= 1'b0; State <= State + 1'b1; end
            
            // transmit bit 0
            8'd107 : begin SCL <= 1'b0; SDA <= 1'b1; State <= State + 1'b1; end   

            8'd108 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd109 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd110 : begin SCL <= 1'b0; State <= State + 1'b1; end  
                        
            // read the ACK bit from the sensor and display it on LED[7]
            8'd111 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd112 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd113 : begin SCL <= 1'b1; ACK_bit <= SDA; State <= State + 1'b1; end   

            8'd114 : begin SCL <= 1'b0; State <= State + 1'b1; end 
            
            //
            // read byte 1, 0x00
            //
            
            // transmit bit 7   
            8'd115 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd116 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd117 : begin SCL <= 1'b1; temp_msb[7] <= SDA; State <= State + 1'b1; end   

            8'd118 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 6
            8'd119 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd120 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd121 : begin SCL <= 1'b1; temp_msb[6] <= SDA; State <= State + 1'b1; end   

            8'd122 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 5
            8'd123 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd124 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd125 : begin SCL <= 1'b1; temp_msb[5] <= SDA; State <= State + 1'b1; end   

            8'd126 : begin SCL <= 1'b0; State <= State + 1'b1; end    

            // transmit bit 4
            8'd127 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd128 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd129 : begin SCL <= 1'b1; temp_msb[4] <= SDA; State <= State + 1'b1; end   

            8'd130 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 3
            8'd131 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd132 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd133 : begin SCL <= 1'b1; temp_msb[3] <= SDA; State <= State + 1'b1; end   

            8'd134 : begin SCL <= 1'b0; State <= State + 1'b1; end  
            
            // transmit bit 2
            8'd135 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd136 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd137 : begin SCL <= 1'b1; temp_msb[2] <= SDA; State <= State + 1'b1; end   

            8'd138 : begin SCL <= 1'b0; State <= State + 1'b1; end   
 
            // transmit bit 1
            8'd139 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd140 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd141 : begin SCL <= 1'b1; temp_msb[1] <= SDA; State <= State + 1'b1; end   

            8'd142 : begin SCL <= 1'b0; State <= State + 1'b1; end 
            
            // transmit bit 0
            8'd143 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd144 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd145 : begin SCL <= 1'b1; temp_msb[0] <= SDA; State <= State + 1'b1; end   

            8'd146 : begin SCL <= 1'b0; State <= State + 1'b1; end  
                        
            // send ACK
            8'd147 : begin SCL <= 1'b0; SDA <= 1'b0; State <= State + 1'b1; end   

            8'd148 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd149 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd150 : begin SCL <= 1'b0; State <= State + 1'b1; end
            
            //
            // read byte 2, 0x01
            //
            
            // transmit bit 7   
            8'd151 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd152 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd153 : begin SCL <= 1'b1; temp_lsb[7] <= SDA; State <= State + 1'b1; end   

            8'd154 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 6
            8'd155 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd156 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd157 : begin SCL <= 1'b1; temp_lsb[6] <= SDA; State <= State + 1'b1; end   

            8'd158 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 5
            8'd159 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd160 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd161 : begin SCL <= 1'b1; temp_lsb[5] <= SDA; State <= State + 1'b1; end   

            8'd162 : begin SCL <= 1'b0; State <= State + 1'b1; end    

            // transmit bit 4
            8'd163 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd164 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd165 : begin SCL <= 1'b1; temp_lsb[4] <= SDA; State <= State + 1'b1; end   

            8'd166 : begin SCL <= 1'b0; State <= State + 1'b1; end   

            // transmit bit 3
            8'd167 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd168 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd169 : begin SCL <= 1'b1; temp_lsb[3] <= SDA; State <= State + 1'b1; end   

            8'd170 : begin SCL <= 1'b0; State <= State + 1'b1; end  
            
            // transmit bit 2
            8'd171 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd172 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd173 : begin SCL <= 1'b1; temp_lsb[2] <= SDA; State <= State + 1'b1; end   

            8'd174 : begin SCL <= 1'b0; State <= State + 1'b1; end   
 
            // transmit bit 1
            8'd175 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd176 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd177 : begin SCL <= 1'b1; temp_lsb[1] <= SDA; State <= State + 1'b1; end   

            8'd178 : begin SCL <= 1'b0; State <= State + 1'b1; end 
            
            // transmit bit 0
            8'd179 : begin SCL <= 1'b0; SDA <= 1'bz; State <= State + 1'b1; end   

            8'd180 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd181 : begin SCL <= 1'b1; temp_lsb[0] <= SDA; State <= State + 1'b1; end   

            8'd182 : begin SCL <= 1'b0; State <= State + 1'b1; end  
                        
            // send NACK
            8'd183 : begin SCL <= 1'b0; SDA <= 1'b1; State <= State + 1'b1; end   

            8'd184 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd185 : begin SCL <= 1'b1; State <= State + 1'b1; end   

            8'd186 : begin SCL <= 1'b0; State <= State + 1'b1; end
            
            // 
            // stop sequence
            //
            
            // stop bit sequence and go back to STATE_INIT           
            8'd187 : begin SCL <= 1'b0; SDA <= 1'b0; State <= State + 1'b1; end   

            8'd188 : begin SCL <= 1'b1; SDA <= 1'b0; State <= State + 1'b1; end                                    
            
            8'd189 : begin SCL <= 1'b1; SDA <= 1'b1; State <= STATE_INIT; end         
            
            //If the FSM ends up in this state, there was an error in teh FSM code
            //LED[6] will be turned on (signal is active low) in that case.
            default : begin
                  error_bit <= 0;
            end                              
        endcase                           
    end      
    
    
    // OK Interface
    wire [112:0]    okHE;  //These are FrontPanel wires needed to IO communication    
    wire [64:0]     okEH;  //These are FrontPanel wires needed to IO communication 
    
    //This is the OK host that allows data to be sent or recived    
    okHost hostIF (
        .okUH(okUH),
        .okHU(okHU),
        .okUHU(okUHU),
        .okClk(okClk),
        .okAA(okAA),
        .okHE(okHE),
        .okEH(okEH)
    );
    
    //  PC_controll is a wire that contains data sent from the PC to FPGA.
    //  The data is communicated via memeory location 0x00
    okWireIn wire10 (   .okHE(okHE), 
                        .ep_addr(8'h00), 
                        .ep_dataout(PC_control));            
   
   localparam  endpoint_count = 2;
    wire [endpoint_count*65-1:0] okEHx;  
    okWireOR # (.N(endpoint_count)) wireOR (okEH, okEHx);
    
    okWireOut endpoint_20 (
        .okHE (okHE), 
        .okEH (okEHx[ 0*65 +: 65 ]),
        .ep_addr (8'h20), 
        .ep_datain (temp_msb)
    );
    
    okWireOut endpoint_21 (
        .okHE (okHE), 
        .okEH (okEHx[ 1*65 +: 65 ]),
        .ep_addr (8'h21), 
        .ep_datain (temp_lsb)
    );
endmodule
