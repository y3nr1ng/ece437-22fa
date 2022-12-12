// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Dec 12 12:56:01 2022
// Host        : SCKY-ASUS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/sean9/ECE437/Final/Final.srcs/sources_1/ip/fifo_8i32o/fifo_8i32o_sim_netlist.v
// Design      : fifo_8i32o
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a75tfgg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_8i32o,fifo_generator_v13_2_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module fifo_8i32o
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    prog_full,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output prog_full;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [7:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [11:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [11:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "12" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "deadbeef" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "4kx9" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1022" *) 
  (* C_PROG_FULL_TYPE = "1" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "12" *) 
  (* C_WR_DEPTH = "4096" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "12" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_8i32o_fifo_generator_v13_2_7 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[11:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(prog_full),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[11:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_8i32o_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [11:0]src_in_bin;
  input dest_clk;
  output [11:0]dest_out_bin;

  wire [11:0]async_path;
  wire [10:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [11:0]\dest_graysync_ff[1] ;
  wire [11:0]dest_out_bin;
  wire [10:0]gray_enc;
  wire src_clk;
  wire [11:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[10]),
        .Q(\dest_graysync_ff[0] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[11]),
        .Q(\dest_graysync_ff[0] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [10]),
        .Q(\dest_graysync_ff[1] [10]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [11]),
        .Q(\dest_graysync_ff[1] [11]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[10]_i_1 
       (.I0(\dest_graysync_ff[1] [10]),
        .I1(\dest_graysync_ff[1] [11]),
        .O(binval[10]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(binval[6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(binval[6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(binval[6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(binval[6]),
        .O(binval[5]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [10]),
        .I3(\dest_graysync_ff[1] [11]),
        .I4(\dest_graysync_ff[1] [9]),
        .I5(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [10]),
        .I4(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [10]),
        .I2(\dest_graysync_ff[1] [11]),
        .I3(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[9]_i_1 
       (.I0(\dest_graysync_ff[1] [9]),
        .I1(\dest_graysync_ff[1] [11]),
        .I2(\dest_graysync_ff[1] [10]),
        .O(binval[9]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[10] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[10]),
        .Q(dest_out_bin[10]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[11] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [11]),
        .Q(dest_out_bin[11]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[10]_i_1 
       (.I0(src_in_bin[11]),
        .I1(src_in_bin[10]),
        .O(gray_enc[10]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[9]_i_1 
       (.I0(src_in_bin[10]),
        .I1(src_in_bin[9]),
        .O(gray_enc[9]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[10] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[10]),
        .Q(async_path[10]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[11] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[11]),
        .Q(async_path[11]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "10" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_8i32o_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [9:0]src_in_bin;
  input dest_clk;
  output [9:0]dest_out_bin;

  wire [9:0]async_path;
  wire [8:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[1] ;
  wire [9:0]dest_out_bin;
  wire [8:0]gray_enc;
  wire src_clk;
  wire [9:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[4]),
        .O(binval[3]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .I5(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_8i32o_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_8i32o_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_8i32o_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_8i32o_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 130496)
`pragma protect data_block
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
MdAetIpntR1mfu7wz7soet6Za9Stz1k=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
