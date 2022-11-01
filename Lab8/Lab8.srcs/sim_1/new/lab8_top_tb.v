//------------------------------------------------------------------------
// i2c_tf.v
//
// Test fixture used to interact with the Opal Kelly I2C controller. This
// is designed to interact with EEPROM simulation files provided by 
// Microchip. This test fixture is intended to demonstrate usage of the I2C
// controller and is not for use in design verification.
//
//------------------------------------------------------------------------
// Copyright (c) 2005-2017 Opal Kelly Incorporated
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//------------------------------------------------------------------------

`timescale 1 ns / 10 ps
`default_nettype none
module spi_master_tb();

	reg  clk;
	reg  reset;
	reg  start;
	wire done;
	
	wire       memclk;
	reg        memstart;
	reg        memwrite;
	reg        memread;
	reg  [7:0] memdin;
	wire [7:0] memdout;
	
	wire spi_en, spi_in, spi_out, spi_clk;

    spi_master # (
		.CLK_DIVIDER (2)
	) dut (
		.i_clk(clk), 
		
		.i_rst(reset), 
		.i_start(start), 
		.o_done(done), 
		
		.i_mem_clk(memclk), 
		.i_mem_start(memstart),
		.i_mem_write(memwrite), 
		.i_mem_read(memread), 
		.i_mem_data(memdin), 
		.o_mem_data(memdout),
		
		.o_spi_en (spi_en),
        .o_spi_mosi (spi_in),
        .i_spi_miso (spi_out),
        .o_spi_clk (spi_clk)
	);
    
    pulldown (spi_out);

    `define T_I2cCtrlClk      39.062   // 78.125ns = 12.8MHz => 100KHz SCLK

    //Generate Clocks
    initial begin
        clk = 0;
        forever begin
            #(`T_I2cCtrlClk) clk = 1'b1;
            #(`T_I2cCtrlClk) clk = 1'b0;
        end
    end
    assign memclk = clk;

    // Reset the controller
    initial begin
        reset = 1;
        start = 0;

        @(posedge clk);
        @(posedge clk);
        @(posedge clk) reset = 0;
    end


    // Sync Test Fixture "go" signal into 
    // one shot "start" signal in clk domain
    reg go;
    reg [1:0] god;
    always @(posedge clk) begin
        god <= {god[0], go};
        start <= god[0] ^ god[1];
    end


    initial begin
        memstart = 1;
        memwrite = 0;
        memread = 0;
        memdin = 0;

        go = 0;
        god = 0;
        
        #100000;
        
        @(posedge memclk);
        @(posedge memclk);
        @(posedge memclk) memstart = 0;

        test_8bit_peripheral();
    end



    task test_8bit_peripheral;
    reg [7:0] data;
    begin
        $display("===== 8-bit Peripheral Test =====");
        
    // 1. Write test
        //--------------
        /*
    i2cmem_reset();
    i2cmem_write(8'h02);  // Preamble Length / Write
    i2cmem_write(8'h00);  // Starts
    i2cmem_write(8'h00);  // Stops
    i2cmem_write(8'h08);  // Payload Length
    i2cmem_write(8'ha0);  // Preamble[0] = Device Address
    i2cmem_write(8'h10);  // Preamble[1] = Byte Address
    i2cmem_write(8'h51);  // Data[0]
    i2cmem_write(8'hA2);  // Data[1]
    i2cmem_write(8'hF3);  // Data[2]
    i2cmem_write(8'h04);  // Data[3]
    i2cmem_write(8'h01);  // Data[4]
    i2cmem_write(8'h02);  // Data[5]
    i2cmem_write(8'h04);  // Data[6]
    i2cmem_write(8'h08);  // Data[7]
    i2c_gotildone();
        */
        // 2. Read test
        //-------------
    i2cmem_reset();
    i2cmem_write(8'h81);  // Preamble Length / Read
    i2cmem_write(8'h00);  // Starts
    i2cmem_write(8'h00);  // Stops
    i2cmem_write(8'h01);  // Payload Length
    i2cmem_write(8'h2a);  // Preamble[0] = Register Address (READ)
    i2c_gotildone();
        
    i2cmem_reset();
    i2cmem_read(data);
    $display("Read: %h", data);
    end
    endtask


    task i2cmem_reset;
    begin
        @(posedge memclk); memstart = 1;
        @(posedge memclk); memstart = 0;
    end
    endtask



    task i2cmem_write;
    input [7:0] data;
    begin
        @(posedge memclk); memwrite = 1; memdin = data;
        @(posedge memclk); memwrite = 0;
    end
    endtask



    task i2cmem_read;
    output [7:0] data;
    begin
        @(posedge memclk); memread = 1; data = memdout;
        @(posedge memclk); memread = 0;
    end
    endtask



    task i2c_gotildone;
    begin
        go = ~go;
        while (done == 0) begin
            @(posedge memclk);
        end
    end
    endtask



endmodule

`default_nettype wire