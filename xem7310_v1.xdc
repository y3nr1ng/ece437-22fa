############################################################################
# XEM7310 - Xilinx constraints file
#
# Pin mappings for the XEM7310.  Use this as a template and comment out 
# the pins that are not used in your design.  (By default, map will fail
# if this file contains constraints for signals not in your design).
#
# UIUC design on 1/14/2019
############################################################################

set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS True [current_design]

############################################################################
## FrontPanel Host Interface
############################################################################
set_property PACKAGE_PIN Y19 [get_ports {okHU[0]}]
set_property PACKAGE_PIN R18 [get_ports {okHU[1]}]
set_property PACKAGE_PIN R16 [get_ports {okHU[2]}]
set_property SLEW FAST [get_ports {okHU[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {okHU[*]}]

set_property PACKAGE_PIN W19 [get_ports {okUH[0]}]
set_property PACKAGE_PIN V18 [get_ports {okUH[1]}]
set_property PACKAGE_PIN U17 [get_ports {okUH[2]}]
set_property PACKAGE_PIN W17 [get_ports {okUH[3]}]
set_property PACKAGE_PIN T19 [get_ports {okUH[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {okUH[*]}]

set_property PACKAGE_PIN AB22 [get_ports {okUHU[0]}]
set_property PACKAGE_PIN AB21 [get_ports {okUHU[1]}]
set_property PACKAGE_PIN Y22 [get_ports {okUHU[2]}]
set_property PACKAGE_PIN AA21 [get_ports {okUHU[3]}]
set_property PACKAGE_PIN AA20 [get_ports {okUHU[4]}]
set_property PACKAGE_PIN W22 [get_ports {okUHU[5]}]
set_property PACKAGE_PIN W21 [get_ports {okUHU[6]}]
set_property PACKAGE_PIN T20 [get_ports {okUHU[7]}]
set_property PACKAGE_PIN R19 [get_ports {okUHU[8]}]
set_property PACKAGE_PIN P19 [get_ports {okUHU[9]}]
set_property PACKAGE_PIN U21 [get_ports {okUHU[10]}]
set_property PACKAGE_PIN T21 [get_ports {okUHU[11]}]
set_property PACKAGE_PIN R21 [get_ports {okUHU[12]}]
set_property PACKAGE_PIN P21 [get_ports {okUHU[13]}]
set_property PACKAGE_PIN R22 [get_ports {okUHU[14]}]
set_property PACKAGE_PIN P22 [get_ports {okUHU[15]}]
set_property PACKAGE_PIN R14 [get_ports {okUHU[16]}]
set_property PACKAGE_PIN W20 [get_ports {okUHU[17]}]
set_property PACKAGE_PIN Y21 [get_ports {okUHU[18]}]
set_property PACKAGE_PIN P17 [get_ports {okUHU[19]}]
set_property PACKAGE_PIN U20 [get_ports {okUHU[20]}]
set_property PACKAGE_PIN N17 [get_ports {okUHU[21]}]
set_property PACKAGE_PIN N14 [get_ports {okUHU[22]}]
set_property PACKAGE_PIN V20 [get_ports {okUHU[23]}]
set_property PACKAGE_PIN P16 [get_ports {okUHU[24]}]
set_property PACKAGE_PIN T18 [get_ports {okUHU[25]}]
set_property PACKAGE_PIN V19 [get_ports {okUHU[26]}]
set_property PACKAGE_PIN AB20 [get_ports {okUHU[27]}]
set_property PACKAGE_PIN P15 [get_ports {okUHU[28]}]
set_property PACKAGE_PIN V22 [get_ports {okUHU[29]}]
set_property PACKAGE_PIN U18 [get_ports {okUHU[30]}]
set_property PACKAGE_PIN AB18 [get_ports {okUHU[31]}]
set_property SLEW FAST [get_ports {okUHU[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {okUHU[*]}]

set_property PACKAGE_PIN N13 [get_ports {okAA}]
set_property IOSTANDARD LVCMOS18 [get_ports {okAA}]


create_clock -name okUH0 -period 9.920 [get_ports {okUH[0]}]

set_input_delay -add_delay -max -clock [get_clocks {okUH0}]  8.000 [get_ports {okUH[*]}]
set_input_delay -add_delay -min -clock [get_clocks {okUH0}] 10.000 [get_ports {okUH[*]}]
set_multicycle_path -setup -from [get_ports {okUH[*]}] 2

set_input_delay -add_delay -max -clock [get_clocks {okUH0}]  8.000 [get_ports {okUHU[*]}]
set_input_delay -add_delay -min -clock [get_clocks {okUH0}]  2.000 [get_ports {okUHU[*]}]
set_multicycle_path -setup -from [get_ports {okUHU[*]}] 2

set_output_delay -add_delay -max -clock [get_clocks {okUH0}]  2.000 [get_ports {okHU[*]}]
set_output_delay -add_delay -min -clock [get_clocks {okUH0}]  -0.500 [get_ports {okHU[*]}]

set_output_delay -add_delay -max -clock [get_clocks {okUH0}]  2.000 [get_ports {okUHU[*]}]
set_output_delay -add_delay -min -clock [get_clocks {okUH0}]  -0.500 [get_ports {okUHU[*]}]


############################################################################
## System Clock
############################################################################
set_property IOSTANDARD LVDS_25 [get_ports {sys_clkp}]
set_property PACKAGE_PIN W11 [get_ports {sys_clkp}]

set_property IOSTANDARD LVDS_25 [get_ports {sys_clkn}]
set_property PACKAGE_PIN W12 [get_ports {sys_clkn}]

create_clock -name sys_clk -period 5 [get_ports sys_clkp]
set_clock_groups -asynchronous -group [get_clocks {sys_clk}] -group [get_clocks {mmcm0_clk0 okUH0}]

############################################################################
## User Reset
############################################################################
set_property PACKAGE_PIN Y18 [get_ports {reset}]
set_property IOSTANDARD LVCMOS18 [get_ports {reset}]
set_property SLEW FAST [get_ports {reset}]

# CMV300-Clocking #####################################################
# MC1-77 
#set_property PACKAGE_PIN V4 [get_ports {CMV300_LVDS_CLK_P}]
#set_property IOSTANDARD LVDS_25 [get_ports {CMV300-LVDS_CLK_P}]
# MC1-79 
#set_property PACKAGE_PIN W4 [get_ports {CMV300_LVDS_CLK_N}]
#set_property IOSTANDARD LVDS_25 [get_ports {CMV300_LVDS_CLK_N}]

# MC2-77 
set_property PACKAGE_PIN H4 [get_ports {CMV300_CLK_IN}]
set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_CLK_IN}]

# MC2-63 
set_property PACKAGE_PIN K4 [get_ports {CMV300_CLK_OUT}]
set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_CLK_OUT}]

# CMV300-Configuration ###############################################
# MC2-29 
set_property PACKAGE_PIN M5 [get_ports {CMV300_SYS_RES_N}]
set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_SYS_RES_N}]
# MC2-15 
set_property PACKAGE_PIN P5 [get_ports {CMV300_Enable_LVDS}]
set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_Enable_LVDS}]

# MC2-21 
set_property PACKAGE_PIN N3 [get_ports {CMV300_SPI_EN}]
set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_SPI_EN}]
# MC2-19 
set_property PACKAGE_PIN N4 [get_ports {CMV300_SPI_IN}]
set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_SPI_IN}]
# MC2-17 
set_property PACKAGE_PIN P4 [get_ports {CMV300_SPI_OUT}]
set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_SPI_OUT}]
# MC2-23 
set_property PACKAGE_PIN L5 [get_ports {CMV300_SPI_CLK}]
set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_SPI_CLK}]

# MC2-25 
#set_property PACKAGE_PIN L4 [get_ports {CMV300_T_EXP1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_T_EXP1}]
# MC2-27 
#set_property PACKAGE_PIN M6 [get_ports {CMV300_T_EXP2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_T_EXP2}]

# CMV300-LVDS-SYNC  ###################################################
# MC2-31 
set_property PACKAGE_PIN M1 [get_ports {CMV300_FRAME_REQ}]
set_property IOSTANDARD LVCMOS33 [get_ports {CMV300_FRAME_REQ}]


# CMV300-LVDS-DATA  ###################################################
# MC1-19 
#set_property PACKAGE_PIN R6 [get_ports {CMV300_Out_P[0]}]
# MC1-21 
#set_property PACKAGE_PIN T6 [get_ports {CMV300_Out_N[0]}]
# MC1-15 
#set_property PACKAGE_PIN W9 [get_ports {CMV300_Out_P[1]}]
# MC1-17 
#set_property PACKAGE_PIN Y9 [get_ports {CMV300_Out_N[1]}]
# MC1-31 
#set_property PACKAGE_PIN AA5 [get_ports {CMV300_Out_P[2]}]
# MC1-33 
#set_property PACKAGE_PIN AB5 [get_ports {CMV300_Out_N[2]}]
# MC1-27 
#set_property PACKAGE_PIN T5 [get_ports {CMV300_Out_P[3]}]
# MC1-29 
#set_property PACKAGE_PIN U5 [get_ports {CMV300_Out_N[3]}]

#set_property IOSTANDARD LVDS_25 [get_ports {CMV300_Out_P[*]}]
#set_property IOSTANDARD LVDS_25 [get_ports {CMV300_Out_N[*]}]

# MC1-23 
#set_property PACKAGE_PIN U6 [get_ports {CMV300_Out_ctrl_P}]
#set_property IOSTANDARD LVDS_25 [get_ports {CMV300_Out_ctrl_P}]
# MC1-25 
#set_property PACKAGE_PIN V5 [get_ports {CMV300_Out_ctrl_N}]
#set_property IOSTANDARD LVDS_25 [get_ports {CMV300_Out_ctrl_N}]

# MC1-32 
#set_property PACKAGE_PIN R4 [get_ports {CMV300_Out_clk_P}]
#set_property IOSTANDARD LVDS_25 [get_ports {CMV300_Out_clk_P}]
# MC1-34 
#set_property PACKAGE_PIN T4 [get_ports {CMV300_Out_clk_N}]
#set_property IOSTANDARD LVDS_25 [get_ports {CMV300_Out_clk_N}]

# CMV300-CMOS-DATA  ###################################################
# MC1-19 
set_property PACKAGE_PIN R6 [get_ports {CMV300_D[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_D[0]}]
# MC1-21 
set_property PACKAGE_PIN T6 [get_ports {CMV300_D[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_D[1]}]
# MC1-15 
set_property PACKAGE_PIN W9 [get_ports {CMV300_D[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_D[2]}]
# MC1-17 
set_property PACKAGE_PIN Y9 [get_ports {CMV300_D[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_D[3]}]
# MC1-31 
set_property PACKAGE_PIN AA5 [get_ports {CMV300_D[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_D[4]}]
# MC1-33 
set_property PACKAGE_PIN AB5 [get_ports {CMV300_D[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_D[5]}]
# MC1-27 
set_property PACKAGE_PIN T5 [get_ports {CMV300_D[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_D[6]}]
# MC1-29 
set_property PACKAGE_PIN U5 [get_ports {CMV300_D[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_D[7]}]
# MC1-32 
set_property PACKAGE_PIN R4 [get_ports {CMV300_D[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_D[8]}]
# MC1-34 
set_property PACKAGE_PIN T4 [get_ports {CMV300_D[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_D[9]}]

# MC1-23 
set_property PACKAGE_PIN U6 [get_ports {CMV300_Line_valid}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_Line_valid}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CMV300_Line_valid_IBUF]
# MC1-2
set_property PACKAGE_PIN V5 [get_ports {CMV300_Data_valid}]
set_property IOSTANDARD LVCMOS25 [get_ports {CMV300_Data_valid}]



# USER EXPANSION PORT JP2 (3.3V) ##########################################
# MC2-16 
set_property PACKAGE_PIN P6 [get_ports {USER_33[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {USER_33[0]}]
# MC2-20 
set_property PACKAGE_PIN P2 [get_ports {USER_33[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {USER_33[1]}]
# MC2-24 
set_property PACKAGE_PIN R1 [get_ports {USER_33[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {USER_33[2]}]
# MC2-28 
set_property PACKAGE_PIN M3 [get_ports {USER_33[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {USER_33[3]}]
# MC2-18 
set_property PACKAGE_PIN N5 [get_ports {USER_33[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {USER_33[4]}]
# MC2-22 
set_property PACKAGE_PIN N2 [get_ports {USER_33[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {USER_33[5]}]
# MC2-26 
set_property PACKAGE_PIN P1 [get_ports {USER_33[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {USER_33[6]}]
# MC2-30 
set_property PACKAGE_PIN M2 [get_ports {USER_33[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {USER_33[7]}]

# MC2-38 
set_property PACKAGE_PIN L3 [get_ports {USER_SRCC_P}]
set_property IOSTANDARD LVCMOS33 [get_ports {USER_SRCC_P}]
# MC2-40 
set_property PACKAGE_PIN K3 [get_ports {USER_SRCC_N}]
set_property IOSTANDARD LVCMOS33 [get_ports {USER_SRCC_N}]


# USER EXPANSION PORT JP3  (2.5V) ##########################################
# MC1-16 
set_property PACKAGE_PIN V9 [get_ports {USER_25[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {USER_25[0]}]
# MC1-20 
set_property PACKAGE_PIN V7 [get_ports {USER_25[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {USER_25[1]}]
# MC1-24 
set_property PACKAGE_PIN Y8 [get_ports {USER_25[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {USER_25[2]}]
# MC1-28 
set_property PACKAGE_PIN W6 [get_ports {USER_25[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {USER_25[3]}]
# MC1-18 
set_property PACKAGE_PIN V8 [get_ports {USER_25[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {USER_25[4]}]
# MC1-22 
set_property PACKAGE_PIN W7 [get_ports {USER_25[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {USER_25[5]}]
# MC1-26 
set_property PACKAGE_PIN Y7 [get_ports {USER_25[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {USER_25[6]}]
# MC1-30 
set_property PACKAGE_PIN W5 [get_ports {USER_25[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {USER_25[7]}]


# PMOD PORT A ###################################################
# MC1-64 
set_property PACKAGE_PIN Y13 [get_ports {PMOD_A1}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_A1}]
# MC1-68 
set_property PACKAGE_PIN AA13 [get_ports {PMOD_A2}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_A2}]
# MC1-67 
set_property PACKAGE_PIN AB16 [get_ports {PMOD_A3}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_A3}]
# MC1-71 
set_property PACKAGE_PIN AA15 [get_ports {PMOD_A4}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_A4}]
# MC1-66 
set_property PACKAGE_PIN AA14 [get_ports {PMOD_A7}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_A7}]
# MC1-70 
set_property PACKAGE_PIN AB13 [get_ports {PMOD_A8}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_A8}]
# MC1-69 
set_property PACKAGE_PIN AB17 [get_ports {PMOD_A9}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_A9}]
# MC1-73 
set_property PACKAGE_PIN AB15 [get_ports {PMOD_A10}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_A10}]


# PMOD PORT B ###################################################
# MC1-75 
set_property PACKAGE_PIN Y16 [get_ports {PMOD_B1}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_B1}]
# MC1-74 
set_property PACKAGE_PIN W16 [get_ports {PMOD_B2}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_B2}]
# MC2-67 
set_property PACKAGE_PIN T16 [get_ports {PMOD_B3}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_B3}]
# MC2-71 
set_property PACKAGE_PIN V13 [get_ports {PMOD_B4}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_B4}]
# MC1-72 
set_property PACKAGE_PIN W15 [get_ports {PMOD_B7}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_B7}]
# MC1-76 
set_property PACKAGE_PIN AA16 [get_ports {PMOD_B8}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_B8}]
# MC2-69 
set_property PACKAGE_PIN U16 [get_ports {PMOD_B9}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_B9}]
# MC2-73 
set_property PACKAGE_PIN V14 [get_ports {PMOD_B10}]
set_property IOSTANDARD LVCMOS33 [get_ports {PMOD_B10}]


# I2C Sensor Bus 0 ###################################################
# MC2-45 
set_property PACKAGE_PIN H3 [get_ports {I2C_SCL_0}]
set_property IOSTANDARD LVCMOS33 [get_ports {I2C_SCL_0}]
# MC2-47 
set_property PACKAGE_PIN G3 [get_ports {I2C_SDA_0}]
set_property IOSTANDARD LVCMOS33 [get_ports {I2C_SDA_0}]

# MC2-39 
#set_property PACKAGE_PIN J2 [get_ports {LPS35_INT_DRDY}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LPS35_INT_DRDY}]
# MC2-41 
#set_property PACKAGE_PIN K1 [get_ports {LPS35_CS}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LPS35_CS}]
# MC2-43 
#set_property PACKAGE_PIN J1 [get_ports {LPS35_SDO}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LPS35_SDO}]

# MC2-53 
#set_property PACKAGE_PIN F3 [get_ports {HTS221_SPIenable}]
#set_property IOSTANDARD LVCMOS33 [get_ports {HTS221_SPIenable}]
# MC2-57 
#set_property PACKAGE_PIN E3 [get_ports {HTS221_DRDY}]
#set_property IOSTANDARD LVCMOS33 [get_ports {HTS221_DRDY}]

# MC2-59 
#set_property PACKAGE_PIN B1 [get_ports {ADT7420_CT}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ADT7420_CT}]
# MC2-61 
#set_property PACKAGE_PIN A1 [get_ports {ADT7420_INT}]
#set_property IOSTANDARD LVCMOS33 [get_ports {ADT7420_INT}]
# MC2-79 
set_property PACKAGE_PIN G4 [get_ports {ADT7420_A0}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADT7420_A0}]
# MC2-65 
set_property PACKAGE_PIN J4 [get_ports {ADT7420_A1}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADT7420_A1}]


# I2C Sensor Bus 1 ###################################################
# MC2-49 
set_property PACKAGE_PIN E2 [get_ports {I2C_SDA_1}]
set_property IOSTANDARD LVCMOS33 [get_ports {I2C_SDA_1}]
# MC2-51 
set_property PACKAGE_PIN D2 [get_ports {I2C_SCL_1}]
set_property IOSTANDARD LVCMOS33 [get_ports {I2C_SCL_1}]

# MC2-42 
#set_property PACKAGE_PIN J5 [get_ports {LSM303_DRDY}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LSM303_DRDY}]
# MC2-44 
#set_property PACKAGE_PIN H5 [get_ports {LSM303_INT1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LSM303_INT1}]
# MC2-46 
#set_property PACKAGE_PIN H2 [get_ports {LSM303_INT2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {LSM303_INT2}]

# MC2-54 
set_property PACKAGE_PIN E1 [get_ports {AD7156_OUT2}]
set_property IOSTANDARD LVCMOS33 [get_ports {AD7156_OUT2}]
# MC2-58 
set_property PACKAGE_PIN D1 [get_ports {AD7156_OUT1}]
set_property IOSTANDARD LVCMOS33 [get_ports {AD7156_OUT1}]

# Sensor Board LEDs ###################################################
# MC2-64 
set_property PACKAGE_PIN U15 [get_ports {s_LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s_LED[0]}]
# MC2-66 
set_property PACKAGE_PIN V15 [get_ports {s_LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s_LED[1]}]
# MC2-68 
set_property PACKAGE_PIN T14 [get_ports {s_LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s_LED[2]}]
# MC2-70 
set_property PACKAGE_PIN T15 [get_ports {s_LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {s_LED[3]}]

# Buttons ###################################################
# MC2-75 
set_property PACKAGE_PIN Y11 [get_ports {button[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[0]}]
# MC2-76 
set_property PACKAGE_PIN Y12 [get_ports {button[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[1]}]
# MC2-74 
set_property PACKAGE_PIN Y14 [get_ports {button[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[2]}]
# MC2-72 
set_property PACKAGE_PIN W14 [get_ports {button[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {button[3]}]


# XEM LEDs #####################################################################
set_property PACKAGE_PIN A13 [get_ports {led[0]}]
set_property PACKAGE_PIN B13 [get_ports {led[1]}]
set_property PACKAGE_PIN A14 [get_ports {led[2]}]
set_property PACKAGE_PIN A15 [get_ports {led[3]}]
set_property PACKAGE_PIN B15 [get_ports {led[4]}]
set_property PACKAGE_PIN A16 [get_ports {led[5]}]
set_property PACKAGE_PIN B16 [get_ports {led[6]}]
set_property PACKAGE_PIN B17 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[*]}]

# Flash ####################################################################
#set_property PACKAGE_PIN AA9 [get_ports {spi_dq0}]
#set_property PACKAGE_PIN V10 [get_ports {spi_c}]
#set_property PACKAGE_PIN W10 [get_ports {spi_s}]
#set_property PACKAGE_PIN AB10 [get_ports {spi_dq1}]
#set_property PACKAGE_PIN AA10 [get_ports {spi_w_dq2}]
#set_property PACKAGE_PIN AA11 [get_ports {spi_hold_dq3}]
#set_property IOSTANDARD LVCMOS33 [get_ports {spi_dq0}]
#set_property IOSTANDARD LVCMOS33 [get_ports {spi_c}]
#set_property IOSTANDARD LVCMOS33 [get_ports {spi_s}]
#set_property IOSTANDARD LVCMOS33 [get_ports {spi_dq1}]
#set_property IOSTANDARD LVCMOS33 [get_ports {spi_w_dq2}]
#set_property IOSTANDARD LVCMOS33 [get_ports {spi_hold_dq3}]

# DRAM #####################################################################
#set_property PACKAGE_PIN N18 [get_ports {ddr3_dq[0]}]
#set_property PACKAGE_PIN L20 [get_ports {ddr3_dq[1]}]
#set_property PACKAGE_PIN N20 [get_ports {ddr3_dq[2]}]
#set_property PACKAGE_PIN K18 [get_ports {ddr3_dq[3]}]
#set_property PACKAGE_PIN M18 [get_ports {ddr3_dq[4]}]
#set_property PACKAGE_PIN K19 [get_ports {ddr3_dq[5]}]
#set_property PACKAGE_PIN N19 [get_ports {ddr3_dq[6]}]
#set_property PACKAGE_PIN L18 [get_ports {ddr3_dq[7]}]
#set_property PACKAGE_PIN L16 [get_ports {ddr3_dq[8]}]
#set_property PACKAGE_PIN L14 [get_ports {ddr3_dq[9]}]
#set_property PACKAGE_PIN K14 [get_ports {ddr3_dq[10]}]
#set_property PACKAGE_PIN M15 [get_ports {ddr3_dq[11]}]
#set_property PACKAGE_PIN K16 [get_ports {ddr3_dq[12]}]
#set_property PACKAGE_PIN M13 [get_ports {ddr3_dq[13]}]
#set_property PACKAGE_PIN K13 [get_ports {ddr3_dq[14]}]
#set_property PACKAGE_PIN L13 [get_ports {ddr3_dq[15]}]
#set_property PACKAGE_PIN D22 [get_ports {ddr3_dq[16]}]
#set_property PACKAGE_PIN C20 [get_ports {ddr3_dq[17]}]
#set_property PACKAGE_PIN E21 [get_ports {ddr3_dq[18]}]
#set_property PACKAGE_PIN D21 [get_ports {ddr3_dq[19]}]
#set_property PACKAGE_PIN G21 [get_ports {ddr3_dq[20]}]
#set_property PACKAGE_PIN C22 [get_ports {ddr3_dq[21]}]
#set_property PACKAGE_PIN E22 [get_ports {ddr3_dq[22]}]
#set_property PACKAGE_PIN B22 [get_ports {ddr3_dq[23]}]
#set_property PACKAGE_PIN A20 [get_ports {ddr3_dq[24]}]
#set_property PACKAGE_PIN D19 [get_ports {ddr3_dq[25]}]
#set_property PACKAGE_PIN A19 [get_ports {ddr3_dq[26]}]
#set_property PACKAGE_PIN F19 [get_ports {ddr3_dq[27]}]
#set_property PACKAGE_PIN C18 [get_ports {ddr3_dq[28]}]
#set_property PACKAGE_PIN E19 [get_ports {ddr3_dq[29]}]
#set_property PACKAGE_PIN A18 [get_ports {ddr3_dq[30]}]
#set_property PACKAGE_PIN C19 [get_ports {ddr3_dq[31]}]
#set_property SLEW FAST [get_ports {ddr3_dq[*]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[*]}]

#set_property PACKAGE_PIN J21 [get_ports {ddr3_addr[0]}]
#set_property PACKAGE_PIN J22 [get_ports {ddr3_addr[1]}]
#set_property PACKAGE_PIN K21 [get_ports {ddr3_addr[2]}]
#set_property PACKAGE_PIN H22 [get_ports {ddr3_addr[3]}]
#set_property PACKAGE_PIN G13 [get_ports {ddr3_addr[4]}]
#set_property PACKAGE_PIN G17 [get_ports {ddr3_addr[5]}]
#set_property PACKAGE_PIN H15 [get_ports {ddr3_addr[6]}]
#set_property PACKAGE_PIN G16 [get_ports {ddr3_addr[7]}]
#set_property PACKAGE_PIN G20 [get_ports {ddr3_addr[8]}]
#set_property PACKAGE_PIN M21 [get_ports {ddr3_addr[9]}]
#set_property PACKAGE_PIN J15 [get_ports {ddr3_addr[10]}]
#set_property PACKAGE_PIN G15 [get_ports {ddr3_addr[11]}]
#set_property PACKAGE_PIN H13 [get_ports {ddr3_addr[12]}]
#set_property PACKAGE_PIN K22 [get_ports {ddr3_addr[13]}]
#set_property PACKAGE_PIN L21 [get_ports {ddr3_addr[14]}]
#set_property SLEW FAST [get_ports {ddr3_addr[*]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[*]}]

#set_property PACKAGE_PIN H18 [get_ports {ddr3_ba[0]}]
#set_property PACKAGE_PIN J19 [get_ports {ddr3_ba[1]}]
#set_property PACKAGE_PIN H19 [get_ports {ddr3_ba[2]}]
#set_property SLEW FAST [get_ports {ddr3_ba[*]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[*]}]

#set_property PACKAGE_PIN J16 [get_ports {ddr3_ras_n}]
#set_property SLEW FAST [get_ports {ddr3_ras_n}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_ras_n}]

#set_property PACKAGE_PIN H17 [get_ports {ddr3_cas_n}]
#set_property SLEW FAST [get_ports {ddr3_cas_n}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_cas_n}]

#set_property PACKAGE_PIN J20 [get_ports {ddr3_we_n}]
#set_property SLEW FAST [get_ports {ddr3_we_n}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_we_n}]

#set_property PACKAGE_PIN F21 [get_ports {ddr3_reset_n}]
#set_property SLEW FAST [get_ports {ddr3_reset_n}]
#set_property IOSTANDARD LVCMOS15 [get_ports {ddr3_reset_n}]

#set_property PACKAGE_PIN G18 [get_ports {ddr3_cke[0]}]
#set_property SLEW FAST [get_ports {ddr3_cke[*]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_cke[*]}]

#set_property PACKAGE_PIN H20 [get_ports {ddr3_odt[0]}]
#set_property SLEW FAST [get_ports {ddr3_odt[*]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_odt[*]}]

#set_property PACKAGE_PIN L19 [get_ports {ddr3_dm[0]}]
#set_property PACKAGE_PIN L15 [get_ports {ddr3_dm[1]}]
#set_property PACKAGE_PIN D20 [get_ports {ddr3_dm[2]}]
#set_property PACKAGE_PIN B20 [get_ports {ddr3_dm[3]}]
#set_property SLEW FAST [get_ports {ddr3_dm[*]}]
#set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[*]}]

#set_property PACKAGE_PIN N22 [get_ports {ddr3_dqs_p[0]}]
#set_property PACKAGE_PIN M22 [get_ports {ddr3_dqs_n[0]}]
#set_property PACKAGE_PIN K17 [get_ports {ddr3_dqs_p[1]}]
#set_property PACKAGE_PIN J17 [get_ports {ddr3_dqs_n[1]}]
#set_property PACKAGE_PIN B21 [get_ports {ddr3_dqs_p[2]}]
#set_property PACKAGE_PIN A21 [get_ports {ddr3_dqs_n[2]}]
#set_property PACKAGE_PIN F18 [get_ports {ddr3_dqs_p[3]}]
#set_property PACKAGE_PIN E18 [get_ports {ddr3_dqs_n[3]}]
#set_property SLEW FAST [get_ports {ddr3_dqs*}]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs*}]

#set_property PACKAGE_PIN J14 [get_ports {ddr3_ck_p[0]}]
#set_property PACKAGE_PIN H14 [get_ports {ddr3_ck_n[0]}]
#set_property SLEW FAST [get_ports {ddr3_ck*}]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_*}]

