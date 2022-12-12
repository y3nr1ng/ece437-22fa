// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Sun Dec 11 19:25:15 2022
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
   (wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    prog_full);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  input wr_rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  input rd_rst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output prog_full;

  wire [7:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire prog_full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst;
  wire wr_clk;
  wire wr_en;
  wire wr_rst;
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
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
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
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
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
  (* C_ENABLE_RST_SYNC = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
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
        .rd_rst(rd_rst),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
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
        .wr_rst(wr_rst),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 113824)
`pragma protect data_block
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
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
