// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Dec 12 12:56:00 2022
// Host        : SCKY-ASUS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top fifo_8i32o -prefix
//               fifo_8i32o_ fifo_8i32o_sim_netlist.v
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

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "12" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
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

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) 
(* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "SINGLE" *) 
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
(* INIT_SYNC_FF = "0" *) (* SIM_ASSERT_CHK = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 129616)
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
