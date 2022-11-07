// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Mon Nov  7 17:12:05 2022
// Host        : ECEB-4022-07 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/ytliu2/ECE437/Lab9/Lab9.srcs/sources_1/ip/lvds_deserializer/lvds_deserializer_sim_netlist.v
// Design      : lvds_deserializer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* DEV_W = "5" *) (* SYS_W = "5" *) 
(* NotValidForBitStream *)
module lvds_deserializer
   (data_in_from_pins_p,
    data_in_from_pins_n,
    data_in_to_device,
    delay_clk,
    in_delay_reset,
    in_delay_data_ce,
    in_delay_data_inc,
    in_delay_tap_in,
    in_delay_tap_out,
    delay_locked,
    ref_clock,
    clk_in_p,
    clk_in_n,
    clk_out,
    io_reset);
  input [4:0]data_in_from_pins_p;
  input [4:0]data_in_from_pins_n;
  output [4:0]data_in_to_device;
  input delay_clk;
  input in_delay_reset;
  input [4:0]in_delay_data_ce;
  input [4:0]in_delay_data_inc;
  input [24:0]in_delay_tap_in;
  output [24:0]in_delay_tap_out;
  output delay_locked;
  input ref_clock;
  input clk_in_p;
  input clk_in_n;
  output clk_out;
  input io_reset;

  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVDS_25" *) wire clk_in_n;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVDS_25" *) wire clk_in_p;
  wire clk_out;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVDS_25" *) wire [4:0]data_in_from_pins_n;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVDS_25" *) wire [4:0]data_in_from_pins_p;
  wire [4:0]data_in_to_device;
  wire delay_clk;
  wire delay_locked;
  wire [4:0]in_delay_data_ce;
  wire [4:0]in_delay_data_inc;
  wire in_delay_reset;
  wire [24:0]in_delay_tap_in;
  wire [24:0]in_delay_tap_out;
  wire io_reset;
  wire ref_clock;

  (* DEV_W = "5" *) 
  (* SYS_W = "5" *) 
  lvds_deserializer_lvds_deserializer_selectio_wiz inst
       (.clk_in_n(clk_in_n),
        .clk_in_p(clk_in_p),
        .clk_out(clk_out),
        .data_in_from_pins_n(data_in_from_pins_n),
        .data_in_from_pins_p(data_in_from_pins_p),
        .data_in_to_device(data_in_to_device),
        .delay_clk(delay_clk),
        .delay_locked(delay_locked),
        .in_delay_data_ce(in_delay_data_ce),
        .in_delay_data_inc(in_delay_data_inc),
        .in_delay_reset(in_delay_reset),
        .in_delay_tap_in(in_delay_tap_in),
        .in_delay_tap_out(in_delay_tap_out),
        .io_reset(io_reset),
        .ref_clock(ref_clock));
endmodule

(* DEV_W = "5" *) (* ORIG_REF_NAME = "lvds_deserializer_selectio_wiz" *) (* SYS_W = "5" *) 
module lvds_deserializer_lvds_deserializer_selectio_wiz
   (data_in_from_pins_p,
    data_in_from_pins_n,
    data_in_to_device,
    delay_clk,
    in_delay_reset,
    in_delay_data_ce,
    in_delay_data_inc,
    in_delay_tap_in,
    in_delay_tap_out,
    delay_locked,
    ref_clock,
    clk_in_p,
    clk_in_n,
    clk_out,
    io_reset);
  input [4:0]data_in_from_pins_p;
  input [4:0]data_in_from_pins_n;
  output [4:0]data_in_to_device;
  input delay_clk;
  input in_delay_reset;
  input [4:0]in_delay_data_ce;
  input [4:0]in_delay_data_inc;
  input [24:0]in_delay_tap_in;
  output [24:0]in_delay_tap_out;
  output delay_locked;
  input ref_clock;
  input clk_in_p;
  input clk_in_n;
  output clk_out;
  input io_reset;

  wire clk_in_int;
  wire clk_in_n;
  wire clk_in_p;
  wire clk_out;
  wire [4:0]data_in_from_pins_delay;
  wire [4:0]data_in_from_pins_int;
  wire [4:0]data_in_from_pins_n;
  wire [4:0]data_in_from_pins_p;
  wire [4:0]data_in_to_device;
  wire delay_clk;
  wire delay_locked;
  wire [4:0]in_delay_data_ce;
  wire [4:0]in_delay_data_inc;
  wire in_delay_reset;
  wire [24:0]in_delay_tap_in;
  wire [24:0]in_delay_tap_out;
  wire io_reset;
  wire ref_clock;
  wire ref_clock_bufg;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFR #(
    .BUFR_DIVIDE("BYPASS"),
    .SIM_DEVICE("7SERIES")) 
    clkout_buf_inst
       (.CE(1'b1),
        .CLR(1'b0),
        .I(clk_in_int),
        .O(clk_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "lvds_deserializer_group" *) 
  IDELAYCTRL #(
    .SIM_DEVICE("7SERIES")) 
    delayctrl
       (.RDY(delay_locked),
        .REFCLK(ref_clock_bufg),
        .RST(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS ibufds_clk_inst
       (.I(clk_in_p),
        .IB(clk_in_n),
        .O(clk_in_int));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \pins[0].fdre_in_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_delay[0]),
        .Q(data_in_to_device[0]),
        .R(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \pins[0].ibufds_inst 
       (.I(data_in_from_pins_p[0]),
        .IB(data_in_from_pins_n[0]),
        .O(data_in_from_pins_int[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "lvds_deserializer_group" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \pins[0].idelaye2_bus 
       (.C(delay_clk),
        .CE(in_delay_data_ce[0]),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(in_delay_tap_in[4:0]),
        .CNTVALUEOUT(in_delay_tap_out[4:0]),
        .DATAIN(1'b0),
        .DATAOUT(data_in_from_pins_delay[0]),
        .IDATAIN(data_in_from_pins_int[0]),
        .INC(in_delay_data_inc[0]),
        .LD(in_delay_reset),
        .LDPIPEEN(1'b0),
        .REGRST(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \pins[1].fdre_in_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_delay[1]),
        .Q(data_in_to_device[1]),
        .R(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \pins[1].ibufds_inst 
       (.I(data_in_from_pins_p[1]),
        .IB(data_in_from_pins_n[1]),
        .O(data_in_from_pins_int[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "lvds_deserializer_group" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \pins[1].idelaye2_bus 
       (.C(delay_clk),
        .CE(in_delay_data_ce[1]),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(in_delay_tap_in[9:5]),
        .CNTVALUEOUT(in_delay_tap_out[9:5]),
        .DATAIN(1'b0),
        .DATAOUT(data_in_from_pins_delay[1]),
        .IDATAIN(data_in_from_pins_int[1]),
        .INC(in_delay_data_inc[1]),
        .LD(in_delay_reset),
        .LDPIPEEN(1'b0),
        .REGRST(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \pins[2].fdre_in_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_delay[2]),
        .Q(data_in_to_device[2]),
        .R(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \pins[2].ibufds_inst 
       (.I(data_in_from_pins_p[2]),
        .IB(data_in_from_pins_n[2]),
        .O(data_in_from_pins_int[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "lvds_deserializer_group" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \pins[2].idelaye2_bus 
       (.C(delay_clk),
        .CE(in_delay_data_ce[2]),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(in_delay_tap_in[14:10]),
        .CNTVALUEOUT(in_delay_tap_out[14:10]),
        .DATAIN(1'b0),
        .DATAOUT(data_in_from_pins_delay[2]),
        .IDATAIN(data_in_from_pins_int[2]),
        .INC(in_delay_data_inc[2]),
        .LD(in_delay_reset),
        .LDPIPEEN(1'b0),
        .REGRST(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \pins[3].fdre_in_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_delay[3]),
        .Q(data_in_to_device[3]),
        .R(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \pins[3].ibufds_inst 
       (.I(data_in_from_pins_p[3]),
        .IB(data_in_from_pins_n[3]),
        .O(data_in_from_pins_int[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "lvds_deserializer_group" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \pins[3].idelaye2_bus 
       (.C(delay_clk),
        .CE(in_delay_data_ce[3]),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(in_delay_tap_in[19:15]),
        .CNTVALUEOUT(in_delay_tap_out[19:15]),
        .DATAIN(1'b0),
        .DATAOUT(data_in_from_pins_delay[3]),
        .IDATAIN(data_in_from_pins_int[3]),
        .INC(in_delay_data_inc[3]),
        .LD(in_delay_reset),
        .LDPIPEEN(1'b0),
        .REGRST(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IOB = "TRUE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \pins[4].fdre_in_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_delay[4]),
        .Q(data_in_to_device[4]),
        .R(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS \pins[4].ibufds_inst 
       (.I(data_in_from_pins_p[4]),
        .IB(data_in_from_pins_n[4]),
        .O(data_in_from_pins_int[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* IODELAY_GROUP = "lvds_deserializer_group" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \pins[4].idelaye2_bus 
       (.C(delay_clk),
        .CE(in_delay_data_ce[4]),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(in_delay_tap_in[24:20]),
        .CNTVALUEOUT(in_delay_tap_out[24:20]),
        .DATAIN(1'b0),
        .DATAOUT(data_in_from_pins_delay[4]),
        .IDATAIN(data_in_from_pins_int[4]),
        .INC(in_delay_data_inc[4]),
        .LD(in_delay_reset),
        .LDPIPEEN(1'b0),
        .REGRST(io_reset));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG ref_clk_bufg
       (.I(ref_clock),
        .O(ref_clock_bufg));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
