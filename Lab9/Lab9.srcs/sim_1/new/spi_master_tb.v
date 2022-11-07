`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2022 03:34:57 PM
// Design Name: 
// Module Name: spi_master_tb
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
