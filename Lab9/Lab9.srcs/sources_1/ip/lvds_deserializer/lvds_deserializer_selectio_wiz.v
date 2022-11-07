
// file: lvds_deserializer_selectio_wiz.v
// (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//----------------------------------------------------------------------------

`timescale 1ps/1ps

module lvds_deserializer_selectio_wiz
   // width of the data for the system
 #(parameter SYS_W = 5,
   // width of the data for the device
   parameter DEV_W = 5)
 (
  // From the system into the device
  input  [SYS_W-1:0] data_in_from_pins_p,
  input  [SYS_W-1:0] data_in_from_pins_n,
  output [DEV_W-1:0] data_in_to_device,
  input              delay_clk,
  input              in_delay_reset,                       // Active high synchronous reset for input delay
  input  [SYS_W -1 :0]           in_delay_data_ce,                     // Enable signal for delay
  input  [SYS_W -1 :0]           in_delay_data_inc,                    // Delay increment (high), decrement (low) signal
  input  [5*SYS_W -1:0]       in_delay_tap_in,  // Dynamically loadable delay tap value for input delay
  output [5*SYS_W -1:0]       in_delay_tap_out, // Delay tap value for monitoring input delay
 
  output             delay_locked,   // Locked signal from IDELAYCTRL
  input              ref_clock,      // Reference clock for IDELAYCTRL. Has to come from BUFG.
  input              clk_in_p,      // Differential clock from IOB
  input              clk_in_n,
  output             clk_out,
  input              io_reset);
  wire clock_enable = 1'b1;
  // Signal declarations
  ////------------------------------
  // After the buffer
  wire   [SYS_W-1:0] data_in_from_pins_int;
  // Between the delay and serdes
  wire [SYS_W-1:0]  data_in_from_pins_delay;
  wire [SYS_W-1:0] in_delay_ce;
  wire [SYS_W-1:0] in_delay_inc_dec;
  wire [4:0]  in_delay_tap_in_int[0:SYS_W - 1];   // fills in starting with 0
  wire [4:0]  in_delay_tap_out_int[0:SYS_W - 1];   // fills in starting with 0
  wire ref_clock_bufg;
   assign in_delay_ce = { 
                     in_delay_data_ce[4],

                     in_delay_data_ce[3],

                     in_delay_data_ce[2],

                     in_delay_data_ce[1],
                     in_delay_data_ce[0]};
   assign in_delay_inc_dec = { 
                     in_delay_data_inc[4],

                     in_delay_data_inc[3],

                     in_delay_data_inc[2],

                     in_delay_data_inc[1],
                     in_delay_data_inc[0]};
   assign in_delay_tap_in_int[0] = in_delay_tap_in[5*(0 + 1) -1:5*(0)] ;
   assign in_delay_tap_in_int[1] = in_delay_tap_in[5*(1 + 1) -1:5*(1)] ;
   assign in_delay_tap_in_int[2] = in_delay_tap_in[5*(2 + 1) -1:5*(2)] ;
   assign in_delay_tap_in_int[3] = in_delay_tap_in[5*(3 + 1) -1:5*(3)] ;
   assign in_delay_tap_in_int[4] = in_delay_tap_in[5*(4 + 1) -1:5*(4)] ;
   assign in_delay_tap_out[5*(0 + 1) -1:5*(0)] = in_delay_tap_out_int[0];
   assign in_delay_tap_out[5*(1 + 1) -1:5*(1)] = in_delay_tap_out_int[1];
   assign in_delay_tap_out[5*(2 + 1) -1:5*(2)] = in_delay_tap_out_int[2];
   assign in_delay_tap_out[5*(3 + 1) -1:5*(3)] = in_delay_tap_out_int[3];
   assign in_delay_tap_out[5*(4 + 1) -1:5*(4)] = in_delay_tap_out_int[4];
  // Create the clock logic

  IBUFDS
    #(.IOSTANDARD ("LVDS_25"))
   ibufds_clk_inst
     (.I          (clk_in_p),
      .IB         (clk_in_n),
      .O          (clk_in_int));
  
   // BUFR generates the slow clock
   BUFR
    #(.SIM_DEVICE("7SERIES"),
    .BUFR_DIVIDE("BYPASS"))
    clkout_buf_inst
    (.O (clk_div),
     .CE(1'b1),
     .CLR(1'b0),
     .I (clk_in_int));

   assign clk_out = clk_div; // This is regional clock;
  // We have multiple bits- step over every bit, instantiating the required elements
  genvar pin_count;
  generate for (pin_count = 0; pin_count < SYS_W; pin_count = pin_count + 1) begin: pins
    // Instantiate the buffers
    ////------------------------------
    // Instantiate a buffer for every bit of the data bus
    IBUFDS
      #(.DIFF_TERM  ("FALSE"),             // Differential termination
        .IOSTANDARD ("LVDS_25"))
     ibufds_inst
       (.I          (data_in_from_pins_p  [pin_count]),
        .IB         (data_in_from_pins_n  [pin_count]),
        .O          (data_in_from_pins_int[pin_count]));

    // Instantiate the delay primitive
    ////-------------------------------

     (* IODELAY_GROUP = "lvds_deserializer_group" *)
     IDELAYE2
       # (
         .CINVCTRL_SEL           ("FALSE"),                            // TRUE, FALSE
         .DELAY_SRC              ("IDATAIN"),                          // IDATAIN, DATAIN
         .HIGH_PERFORMANCE_MODE  ("FALSE"),                            // TRUE, FALSE
         .IDELAY_TYPE            ("VAR_LOAD"),              // FIXED, VARIABLE, or VAR_LOADABLE
         .IDELAY_VALUE           (0),                  // 0 to 31
         .REFCLK_FREQUENCY       (200.0),
         .PIPE_SEL               ("FALSE"),
         .SIGNAL_PATTERN         ("DATA"))                             // CLOCK, DATA
       idelaye2_bus
           (
         .DATAOUT                (data_in_from_pins_delay[pin_count]),
         .DATAIN                 (1'b0),                               // Data from FPGA logic
         .C                      (delay_clk),
         .CE                     (in_delay_ce[pin_count]), //(in_delay_data_ce),
         .INC                    (in_delay_inc_dec[pin_count]), //in_delay_data_inc),
         .IDATAIN                (data_in_from_pins_int  [pin_count]), // Driven by IOB
         .LD                     (in_delay_reset),
         .REGRST                 (io_reset),
         .LDPIPEEN               (1'b0),
         .CNTVALUEIN             (in_delay_tap_in_int[pin_count]), //in_delay_tap_in),
         .CNTVALUEOUT            (in_delay_tap_out_int[pin_count]), //in_delay_tap_out),
         .CINVCTRL               (1'b0)
         );


    // Connect the delayed data to the fabric
    ////--------------------------------------

    // Pack the registers into the IOB

    wire data_in_to_device_int;
    (* IOB = "true" *)
    FDRE fdre_in_inst
      (.D              (data_in_from_pins_delay[pin_count]),
       .C              (clk_div),
       .CE             (clock_enable),
       .R              (io_reset),
       .Q              (data_in_to_device_int)
      );
    assign data_in_to_device[pin_count] = data_in_to_device_int;
  end
  endgenerate
  
//// NO ODELAY

// IDELAYCTRL is needed for calibration
(* IODELAY_GROUP = "lvds_deserializer_group" *)
  IDELAYCTRL
    delayctrl (
     .RDY    (delay_locked),
     .REFCLK (ref_clock_bufg),
     .RST    (io_reset));

  BUFG
    ref_clk_bufg (
     .I (ref_clock),
     .O (ref_clock_bufg));
endmodule
