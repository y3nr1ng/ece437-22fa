-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Mon Nov  7 17:12:05 2022
-- Host        : ECEB-4022-07 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/ytliu2/ECE437/Lab9/Lab9.srcs/sources_1/ip/lvds_deserializer/lvds_deserializer_sim_netlist.vhdl
-- Design      : lvds_deserializer
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a75tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity lvds_deserializer_lvds_deserializer_selectio_wiz is
  port (
    data_in_from_pins_p : in STD_LOGIC_VECTOR ( 4 downto 0 );
    data_in_from_pins_n : in STD_LOGIC_VECTOR ( 4 downto 0 );
    data_in_to_device : out STD_LOGIC_VECTOR ( 4 downto 0 );
    delay_clk : in STD_LOGIC;
    in_delay_reset : in STD_LOGIC;
    in_delay_data_ce : in STD_LOGIC_VECTOR ( 4 downto 0 );
    in_delay_data_inc : in STD_LOGIC_VECTOR ( 4 downto 0 );
    in_delay_tap_in : in STD_LOGIC_VECTOR ( 24 downto 0 );
    in_delay_tap_out : out STD_LOGIC_VECTOR ( 24 downto 0 );
    delay_locked : out STD_LOGIC;
    ref_clock : in STD_LOGIC;
    clk_in_p : in STD_LOGIC;
    clk_in_n : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    io_reset : in STD_LOGIC
  );
  attribute DEV_W : integer;
  attribute DEV_W of lvds_deserializer_lvds_deserializer_selectio_wiz : entity is 5;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of lvds_deserializer_lvds_deserializer_selectio_wiz : entity is "lvds_deserializer_selectio_wiz";
  attribute SYS_W : integer;
  attribute SYS_W of lvds_deserializer_lvds_deserializer_selectio_wiz : entity is 5;
end lvds_deserializer_lvds_deserializer_selectio_wiz;

architecture STRUCTURE of lvds_deserializer_lvds_deserializer_selectio_wiz is
  signal clk_in_int : STD_LOGIC;
  signal \^clk_out\ : STD_LOGIC;
  signal data_in_from_pins_delay : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal data_in_from_pins_int : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal ref_clock_bufg : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkout_buf_inst : label is "PRIMITIVE";
  attribute BOX_TYPE of delayctrl : label is "PRIMITIVE";
  attribute IODELAY_GROUP : string;
  attribute IODELAY_GROUP of delayctrl : label is "lvds_deserializer_group";
  attribute BOX_TYPE of ibufds_clk_inst : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of ibufds_clk_inst : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of ibufds_clk_inst : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of ibufds_clk_inst : label is "AUTO";
  attribute BOX_TYPE of \pins[0].fdre_in_inst\ : label is "PRIMITIVE";
  attribute IOB : string;
  attribute IOB of \pins[0].fdre_in_inst\ : label is "TRUE";
  attribute BOX_TYPE of \pins[0].ibufds_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[0].ibufds_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[0].ibufds_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[0].ibufds_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[0].idelaye2_bus\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \pins[0].idelaye2_bus\ : label is "lvds_deserializer_group";
  attribute SIM_DELAY_D : integer;
  attribute SIM_DELAY_D of \pins[0].idelaye2_bus\ : label is 0;
  attribute BOX_TYPE of \pins[1].fdre_in_inst\ : label is "PRIMITIVE";
  attribute IOB of \pins[1].fdre_in_inst\ : label is "TRUE";
  attribute BOX_TYPE of \pins[1].ibufds_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[1].ibufds_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[1].ibufds_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[1].ibufds_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[1].idelaye2_bus\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \pins[1].idelaye2_bus\ : label is "lvds_deserializer_group";
  attribute SIM_DELAY_D of \pins[1].idelaye2_bus\ : label is 0;
  attribute BOX_TYPE of \pins[2].fdre_in_inst\ : label is "PRIMITIVE";
  attribute IOB of \pins[2].fdre_in_inst\ : label is "TRUE";
  attribute BOX_TYPE of \pins[2].ibufds_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[2].ibufds_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[2].ibufds_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[2].ibufds_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[2].idelaye2_bus\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \pins[2].idelaye2_bus\ : label is "lvds_deserializer_group";
  attribute SIM_DELAY_D of \pins[2].idelaye2_bus\ : label is 0;
  attribute BOX_TYPE of \pins[3].fdre_in_inst\ : label is "PRIMITIVE";
  attribute IOB of \pins[3].fdre_in_inst\ : label is "TRUE";
  attribute BOX_TYPE of \pins[3].ibufds_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[3].ibufds_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[3].ibufds_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[3].ibufds_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[3].idelaye2_bus\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \pins[3].idelaye2_bus\ : label is "lvds_deserializer_group";
  attribute SIM_DELAY_D of \pins[3].idelaye2_bus\ : label is 0;
  attribute BOX_TYPE of \pins[4].fdre_in_inst\ : label is "PRIMITIVE";
  attribute IOB of \pins[4].fdre_in_inst\ : label is "TRUE";
  attribute BOX_TYPE of \pins[4].ibufds_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[4].ibufds_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[4].ibufds_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[4].ibufds_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[4].idelaye2_bus\ : label is "PRIMITIVE";
  attribute IODELAY_GROUP of \pins[4].idelaye2_bus\ : label is "lvds_deserializer_group";
  attribute SIM_DELAY_D of \pins[4].idelaye2_bus\ : label is 0;
  attribute BOX_TYPE of ref_clk_bufg : label is "PRIMITIVE";
begin
  clk_out <= \^clk_out\;
clkout_buf_inst: unisim.vcomponents.BUFR
    generic map(
      BUFR_DIVIDE => "BYPASS",
      SIM_DEVICE => "7SERIES"
    )
        port map (
      CE => '1',
      CLR => '0',
      I => clk_in_int,
      O => \^clk_out\
    );
delayctrl: unisim.vcomponents.IDELAYCTRL
    generic map(
      SIM_DEVICE => "7SERIES"
    )
        port map (
      RDY => delay_locked,
      REFCLK => ref_clock_bufg,
      RST => io_reset
    );
ibufds_clk_inst: unisim.vcomponents.IBUFDS
     port map (
      I => clk_in_p,
      IB => clk_in_n,
      O => clk_in_int
    );
\pins[0].fdre_in_inst\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_delay(0),
      Q => data_in_to_device(0),
      R => io_reset
    );
\pins[0].ibufds_inst\: unisim.vcomponents.IBUFDS
     port map (
      I => data_in_from_pins_p(0),
      IB => data_in_from_pins_n(0),
      O => data_in_from_pins_int(0)
    );
\pins[0].idelaye2_bus\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => delay_clk,
      CE => in_delay_data_ce(0),
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => in_delay_tap_in(4 downto 0),
      CNTVALUEOUT(4 downto 0) => in_delay_tap_out(4 downto 0),
      DATAIN => '0',
      DATAOUT => data_in_from_pins_delay(0),
      IDATAIN => data_in_from_pins_int(0),
      INC => in_delay_data_inc(0),
      LD => in_delay_reset,
      LDPIPEEN => '0',
      REGRST => io_reset
    );
\pins[1].fdre_in_inst\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_delay(1),
      Q => data_in_to_device(1),
      R => io_reset
    );
\pins[1].ibufds_inst\: unisim.vcomponents.IBUFDS
     port map (
      I => data_in_from_pins_p(1),
      IB => data_in_from_pins_n(1),
      O => data_in_from_pins_int(1)
    );
\pins[1].idelaye2_bus\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => delay_clk,
      CE => in_delay_data_ce(1),
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => in_delay_tap_in(9 downto 5),
      CNTVALUEOUT(4 downto 0) => in_delay_tap_out(9 downto 5),
      DATAIN => '0',
      DATAOUT => data_in_from_pins_delay(1),
      IDATAIN => data_in_from_pins_int(1),
      INC => in_delay_data_inc(1),
      LD => in_delay_reset,
      LDPIPEEN => '0',
      REGRST => io_reset
    );
\pins[2].fdre_in_inst\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_delay(2),
      Q => data_in_to_device(2),
      R => io_reset
    );
\pins[2].ibufds_inst\: unisim.vcomponents.IBUFDS
     port map (
      I => data_in_from_pins_p(2),
      IB => data_in_from_pins_n(2),
      O => data_in_from_pins_int(2)
    );
\pins[2].idelaye2_bus\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => delay_clk,
      CE => in_delay_data_ce(2),
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => in_delay_tap_in(14 downto 10),
      CNTVALUEOUT(4 downto 0) => in_delay_tap_out(14 downto 10),
      DATAIN => '0',
      DATAOUT => data_in_from_pins_delay(2),
      IDATAIN => data_in_from_pins_int(2),
      INC => in_delay_data_inc(2),
      LD => in_delay_reset,
      LDPIPEEN => '0',
      REGRST => io_reset
    );
\pins[3].fdre_in_inst\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_delay(3),
      Q => data_in_to_device(3),
      R => io_reset
    );
\pins[3].ibufds_inst\: unisim.vcomponents.IBUFDS
     port map (
      I => data_in_from_pins_p(3),
      IB => data_in_from_pins_n(3),
      O => data_in_from_pins_int(3)
    );
\pins[3].idelaye2_bus\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => delay_clk,
      CE => in_delay_data_ce(3),
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => in_delay_tap_in(19 downto 15),
      CNTVALUEOUT(4 downto 0) => in_delay_tap_out(19 downto 15),
      DATAIN => '0',
      DATAOUT => data_in_from_pins_delay(3),
      IDATAIN => data_in_from_pins_int(3),
      INC => in_delay_data_inc(3),
      LD => in_delay_reset,
      LDPIPEEN => '0',
      REGRST => io_reset
    );
\pins[4].fdre_in_inst\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_delay(4),
      Q => data_in_to_device(4),
      R => io_reset
    );
\pins[4].ibufds_inst\: unisim.vcomponents.IBUFDS
     port map (
      I => data_in_from_pins_p(4),
      IB => data_in_from_pins_n(4),
      O => data_in_from_pins_int(4)
    );
\pins[4].idelaye2_bus\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => delay_clk,
      CE => in_delay_data_ce(4),
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => in_delay_tap_in(24 downto 20),
      CNTVALUEOUT(4 downto 0) => in_delay_tap_out(24 downto 20),
      DATAIN => '0',
      DATAOUT => data_in_from_pins_delay(4),
      IDATAIN => data_in_from_pins_int(4),
      INC => in_delay_data_inc(4),
      LD => in_delay_reset,
      LDPIPEEN => '0',
      REGRST => io_reset
    );
ref_clk_bufg: unisim.vcomponents.BUFG
     port map (
      I => ref_clock,
      O => ref_clock_bufg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity lvds_deserializer is
  port (
    data_in_from_pins_p : in STD_LOGIC_VECTOR ( 4 downto 0 );
    data_in_from_pins_n : in STD_LOGIC_VECTOR ( 4 downto 0 );
    data_in_to_device : out STD_LOGIC_VECTOR ( 4 downto 0 );
    delay_clk : in STD_LOGIC;
    in_delay_reset : in STD_LOGIC;
    in_delay_data_ce : in STD_LOGIC_VECTOR ( 4 downto 0 );
    in_delay_data_inc : in STD_LOGIC_VECTOR ( 4 downto 0 );
    in_delay_tap_in : in STD_LOGIC_VECTOR ( 24 downto 0 );
    in_delay_tap_out : out STD_LOGIC_VECTOR ( 24 downto 0 );
    delay_locked : out STD_LOGIC;
    ref_clock : in STD_LOGIC;
    clk_in_p : in STD_LOGIC;
    clk_in_n : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    io_reset : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of lvds_deserializer : entity is true;
  attribute DEV_W : integer;
  attribute DEV_W of lvds_deserializer : entity is 5;
  attribute SYS_W : integer;
  attribute SYS_W of lvds_deserializer : entity is 5;
end lvds_deserializer;

architecture STRUCTURE of lvds_deserializer is
  attribute DEV_W of inst : label is 5;
  attribute SYS_W of inst : label is 5;
begin
inst: entity work.lvds_deserializer_lvds_deserializer_selectio_wiz
     port map (
      clk_in_n => clk_in_n,
      clk_in_p => clk_in_p,
      clk_out => clk_out,
      data_in_from_pins_n(4 downto 0) => data_in_from_pins_n(4 downto 0),
      data_in_from_pins_p(4 downto 0) => data_in_from_pins_p(4 downto 0),
      data_in_to_device(4 downto 0) => data_in_to_device(4 downto 0),
      delay_clk => delay_clk,
      delay_locked => delay_locked,
      in_delay_data_ce(4 downto 0) => in_delay_data_ce(4 downto 0),
      in_delay_data_inc(4 downto 0) => in_delay_data_inc(4 downto 0),
      in_delay_reset => in_delay_reset,
      in_delay_tap_in(24 downto 0) => in_delay_tap_in(24 downto 0),
      in_delay_tap_out(24 downto 0) => in_delay_tap_out(24 downto 0),
      io_reset => io_reset,
      ref_clock => ref_clock
    );
end STRUCTURE;
