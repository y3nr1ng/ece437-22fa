-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Fri Dec 16 04:17:37 2022
-- Host        : SCKY-ASUS running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/sean9/ECE437/Final/Final.srcs/sources_1/ip/ref_clk_pll/ref_clk_pll_sim_netlist.vhdl
-- Design      : ref_clk_pll
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a75tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ref_clk_pll_clk_wiz is
  port (
    clk_80M : out STD_LOGIC;
    clk_120M : out STD_LOGIC;
    clk_10M : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );
end ref_clk_pll_clk_wiz;

architecture STRUCTURE of ref_clk_pll_clk_wiz is
  signal clk_10M_ref_clk_pll : STD_LOGIC;
  signal clk_120M_ref_clk_pll : STD_LOGIC;
  signal clk_80M_ref_clk_pll : STD_LOGIC;
  signal clk_in1_ref_clk_pll : STD_LOGIC;
  signal clkfbout_buf_ref_clk_pll : STD_LOGIC;
  signal clkfbout_ref_clk_pll : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_plle2_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_ibufgds : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufgds : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufgds : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufgds : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout3_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of plle2_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_ref_clk_pll,
      O => clkfbout_buf_ref_clk_pll
    );
clkin1_ibufgds: unisim.vcomponents.IBUFDS
    generic map(
      CCIO_EN_M => "TRUE",
      CCIO_EN_S => "TRUE",
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_in1_p,
      IB => clk_in1_n,
      O => clk_in1_ref_clk_pll
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_80M_ref_clk_pll,
      O => clk_80M
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_120M_ref_clk_pll,
      O => clk_120M
    );
clkout3_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_10M_ref_clk_pll,
      O => clk_10M
    );
plle2_adv_inst: unisim.vcomponents.PLLE2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT => 24,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN1_PERIOD => 5.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE => 12,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT1_DIVIDE => 8,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT2_DIVIDE => 96,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT3_DIVIDE => 1,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 5,
      IS_CLKINSEL_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      STARTUP_WAIT => "FALSE"
    )
        port map (
      CLKFBIN => clkfbout_buf_ref_clk_pll,
      CLKFBOUT => clkfbout_ref_clk_pll,
      CLKIN1 => clk_in1_ref_clk_pll,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKOUT0 => clk_80M_ref_clk_pll,
      CLKOUT1 => clk_120M_ref_clk_pll,
      CLKOUT2 => clk_10M_ref_clk_pll,
      CLKOUT3 => NLW_plle2_adv_inst_CLKOUT3_UNCONNECTED,
      CLKOUT4 => NLW_plle2_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_plle2_adv_inst_CLKOUT5_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_plle2_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_plle2_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ref_clk_pll is
  port (
    clk_80M : out STD_LOGIC;
    clk_120M : out STD_LOGIC;
    clk_10M : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ref_clk_pll : entity is true;
end ref_clk_pll;

architecture STRUCTURE of ref_clk_pll is
begin
inst: entity work.ref_clk_pll_clk_wiz
     port map (
      clk_10M => clk_10M,
      clk_120M => clk_120M,
      clk_80M => clk_80M,
      clk_in1_n => clk_in1_n,
      clk_in1_p => clk_in1_p,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
