
// file: lvds_deserializer.v
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

(* CORE_GENERATION_INFO = "lvds_deserializer,selectio_wiz_v5_1_13,{component_name=lvds_deserializer,bus_dir=INPUTS,bus_sig_type=DIFF,bus_io_std=LVDS_25,use_serialization=false,use_phase_detector=false,serialization_factor=4,enable_bitslip=false,enable_train=false,system_data_width=5,bus_in_delay=NONE,bus_out_delay=NONE,clk_sig_type=SINGLE,clk_io_std=LVCMOS18,clk_buf=BUFIO2,active_edge=RISING,clk_delay=NONE,selio_bus_in_delay=VAR_LOADABLE,selio_bus_out_delay=NONE,selio_clk_buf=BUFIO,selio_active_edge=SDR,selio_ddr_alignment=SAME_EDGE_PIPELINED,selio_oddr_alignment=SAME_EDGE,ddr_alignment=C0,selio_interface_type=NETWORKING,interface_type=NETWORKING,selio_bus_in_tap=0,selio_bus_out_tap=0,selio_clk_io_std=LVDS_25,selio_clk_sig_type=DIFF}" *)

module lvds_deserializer
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


  lvds_deserializer_selectio_wiz 
  #(
   .SYS_W(SYS_W),
   .DEV_W(DEV_W)
  )
  inst
 (
   .data_in_from_pins_p(data_in_from_pins_p),
   .data_in_from_pins_n(data_in_from_pins_n),
   .data_in_to_device(data_in_to_device),
   .delay_clk(delay_clk),
   .in_delay_reset(in_delay_reset),                    
   .in_delay_data_ce(in_delay_data_ce),      
   .in_delay_data_inc(in_delay_data_inc),     
   .in_delay_tap_in(in_delay_tap_in),          
   .in_delay_tap_out(in_delay_tap_out),         
   .delay_locked(delay_locked),                      
   .ref_clock(ref_clock),                         
   .clk_in_p(clk_in_p),                          
   .clk_in_n(clk_in_n),
   .clk_out(clk_out),
   .io_reset(io_reset)
); 

endmodule

