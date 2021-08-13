
################################################################
# This is a generated script based on design: bd_b77e
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2021.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source bd_b77e_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvc1902-vsva2197-2MP-e-S
   set_property BOARD_PART xilinx.com:vck190:part0:2.2 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name bd_b77e

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design -bdsource SBD $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set FPD_CCI_NOC_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 FPD_CCI_NOC_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {824999207} \
   CONFIG.INDEX {0} \
   ] $FPD_CCI_NOC_0
  set_property APERTURES {{0x0 2G} {0x8_0000_0000 32G} {0xC0_0000_0000 256G} {0x100_0000_0000 734G} {0x200_0000_0000 4G} {0x201_0000_0000 2044G} {0x500_0000_0000 1T} {0x600_0000_0000 1T} {0x700_0000_0000 1T} {0x800_0000_0000 8T}} [get_bd_intf_ports FPD_CCI_NOC_0]

  set FPD_CCI_NOC_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 FPD_CCI_NOC_1 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {824999207} \
   CONFIG.INDEX {1} \
   ] $FPD_CCI_NOC_1
  set_property APERTURES {{0x0 2G} {0x8_0000_0000 32G} {0xC0_0000_0000 256G} {0x100_0000_0000 734G} {0x200_0000_0000 4G} {0x201_0000_0000 2044G} {0x500_0000_0000 1T} {0x600_0000_0000 1T} {0x700_0000_0000 1T} {0x800_0000_0000 8T}} [get_bd_intf_ports FPD_CCI_NOC_1]

  set FPD_CCI_NOC_2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 FPD_CCI_NOC_2 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {824999207} \
   CONFIG.INDEX {2} \
   ] $FPD_CCI_NOC_2
  set_property APERTURES {{0x0 2G} {0x8_0000_0000 32G} {0xC0_0000_0000 256G} {0x100_0000_0000 734G} {0x200_0000_0000 4G} {0x201_0000_0000 2044G} {0x500_0000_0000 1T} {0x600_0000_0000 1T} {0x700_0000_0000 1T} {0x800_0000_0000 8T}} [get_bd_intf_ports FPD_CCI_NOC_2]

  set FPD_CCI_NOC_3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 FPD_CCI_NOC_3 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {824999207} \
   CONFIG.INDEX {3} \
   ] $FPD_CCI_NOC_3
  set_property APERTURES {{0x0 2G} {0x8_0000_0000 32G} {0xC0_0000_0000 256G} {0x100_0000_0000 734G} {0x200_0000_0000 4G} {0x201_0000_0000 2044G} {0x500_0000_0000 1T} {0x600_0000_0000 1T} {0x700_0000_0000 1T} {0x800_0000_0000 8T}} [get_bd_intf_ports FPD_CCI_NOC_3]

  set LPD_AXI_NOC_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 LPD_AXI_NOC_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {591666077} \
   CONFIG.INDEX {0} \
   ] $LPD_AXI_NOC_0
  set_property APERTURES {{0x0 2G} {0x8_0000_0000 32G} {0xC0_0000_0000 256G} {0x100_0000_0000 734G} {0x200_0000_0000 4G} {0x201_0000_0000 2044G} {0x500_0000_0000 1T} {0x600_0000_0000 1T} {0x700_0000_0000 1T} {0x800_0000_0000 8T}} [get_bd_intf_ports LPD_AXI_NOC_0]

  set PMC_NOC_AXI_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 PMC_NOC_AXI_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {400000000} \
   CONFIG.INDEX {0} \
   ] $PMC_NOC_AXI_0
  set_property APERTURES {{0x0 2G} {0x8_0000_0000 32G} {0xC0_0000_0000 256G} {0x100_0000_0000 734G} {0x200_0000_0000 4G} {0x201_0000_0000 2044G} {0x500_0000_0000 1T} {0x600_0000_0000 1T} {0x700_0000_0000 1T} {0x800_0000_0000 8T}} [get_bd_intf_ports PMC_NOC_AXI_0]


  # Create ports
  set fpd_cci_noc_axi0_clk [ create_bd_port -dir O -type clk fpd_cci_noc_axi0_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {FPD_CCI_NOC_0} \
   CONFIG.FREQ_HZ {824999207} \
 ] $fpd_cci_noc_axi0_clk
  set_property CONFIG.ASSOCIATED_BUSIF.VALUE_SRC DEFAULT $fpd_cci_noc_axi0_clk

  set fpd_cci_noc_axi1_clk [ create_bd_port -dir O -type clk fpd_cci_noc_axi1_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {FPD_CCI_NOC_1} \
   CONFIG.FREQ_HZ {824999207} \
 ] $fpd_cci_noc_axi1_clk
  set_property CONFIG.ASSOCIATED_BUSIF.VALUE_SRC DEFAULT $fpd_cci_noc_axi1_clk

  set fpd_cci_noc_axi2_clk [ create_bd_port -dir O -type clk fpd_cci_noc_axi2_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {FPD_CCI_NOC_2} \
   CONFIG.FREQ_HZ {824999207} \
 ] $fpd_cci_noc_axi2_clk
  set_property CONFIG.ASSOCIATED_BUSIF.VALUE_SRC DEFAULT $fpd_cci_noc_axi2_clk

  set fpd_cci_noc_axi3_clk [ create_bd_port -dir O -type clk fpd_cci_noc_axi3_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {FPD_CCI_NOC_3} \
   CONFIG.FREQ_HZ {824999207} \
 ] $fpd_cci_noc_axi3_clk
  set_property CONFIG.ASSOCIATED_BUSIF.VALUE_SRC DEFAULT $fpd_cci_noc_axi3_clk

  set gem0_tsu_timer_cnt [ create_bd_port -dir O -from 93 -to 0 gem0_tsu_timer_cnt ]
  set lpd_axi_noc_clk [ create_bd_port -dir O -type clk lpd_axi_noc_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {LPD_AXI_NOC_0} \
   CONFIG.FREQ_HZ {591666077} \
 ] $lpd_axi_noc_clk
  set_property CONFIG.ASSOCIATED_BUSIF.VALUE_SRC DEFAULT $lpd_axi_noc_clk

  set pl0_ref_clk [ create_bd_port -dir O -type clk pl0_ref_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {333333008} \
 ] $pl0_ref_clk
  set pl0_resetn [ create_bd_port -dir O -type rst pl0_resetn ]
  set pmc_axi_noc_axi0_clk [ create_bd_port -dir O -type clk pmc_axi_noc_axi0_clk ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {PMC_NOC_AXI_0} \
   CONFIG.FREQ_HZ {400000000} \
 ] $pmc_axi_noc_axi0_clk
  set_property CONFIG.ASSOCIATED_BUSIF.VALUE_SRC DEFAULT $pmc_axi_noc_axi0_clk


  # Create instance: pspmc_0, and set properties
  set pspmc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:pspmc:1.0 pspmc_0 ]
  set_property -dict [ list \
   CONFIG.AURORA_LINE_RATE_GPBS {12.5} \
   CONFIG.BOOT_MODE {Custom} \
   CONFIG.BOOT_SECONDARY_PCIE_ENABLE {0} \
   CONFIG.CLOCK_MODE {Custom} \
   CONFIG.COHERENCY_MODE {Custom} \
   CONFIG.CPM_PCIE0_TANDEM {None} \
   CONFIG.DDR_MEMORY_MODE {Custom} \
   CONFIG.DEBUG_MODE {Custom} \
   CONFIG.DESIGN_MODE {1} \
   CONFIG.DEVICE_INTEGRITY_MODE {Custom} \
   CONFIG.DIS_AUTO_POL_CHECK {0} \
   CONFIG.GT_REFCLK_MHZ {156.25} \
   CONFIG.INIT_CLK_MHZ {125} \
   CONFIG.INV_POLARITY {0} \
   CONFIG.IO_CONFIG_MODE {Custom} \
   CONFIG.PCIE_APERTURES_DUAL_ENABLE {0} \
   CONFIG.PCIE_APERTURES_SINGLE_ENABLE {0} \
   CONFIG.PERFORMANCE_MODE {Custom} \
   CONFIG.PL_SEM_GPIO_ENABLE {0} \
   CONFIG.PMC_ALT_REF_CLK_FREQMHZ {33.333} \
   CONFIG.PMC_BANK_0_IO_STANDARD {LVCMOS1.8} \
   CONFIG.PMC_BANK_1_IO_STANDARD {LVCMOS1.8} \
   CONFIG.PMC_CIPS_MODE {ADVANCE} \
   CONFIG.PMC_CORE_SUBSYSTEM_LOAD {10} \
   CONFIG.PMC_CRP_CFU_REF_CTRL_ACT_FREQMHZ {394.444061} \
   CONFIG.PMC_CRP_CFU_REF_CTRL_DIVISOR0 {3} \
   CONFIG.PMC_CRP_CFU_REF_CTRL_FREQMHZ {400} \
   CONFIG.PMC_CRP_CFU_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_DFT_OSC_REF_CTRL_ACT_FREQMHZ {400} \
   CONFIG.PMC_CRP_DFT_OSC_REF_CTRL_DIVISOR0 {3} \
   CONFIG.PMC_CRP_DFT_OSC_REF_CTRL_FREQMHZ {400} \
   CONFIG.PMC_CRP_DFT_OSC_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_EFUSE_REF_CTRL_ACT_FREQMHZ {100.000000} \
   CONFIG.PMC_CRP_EFUSE_REF_CTRL_FREQMHZ {100.000000} \
   CONFIG.PMC_CRP_EFUSE_REF_CTRL_SRCSEL {IRO_CLK/4} \
   CONFIG.PMC_CRP_HSM0_REF_CTRL_ACT_FREQMHZ {32.870338} \
   CONFIG.PMC_CRP_HSM0_REF_CTRL_DIVISOR0 {36} \
   CONFIG.PMC_CRP_HSM0_REF_CTRL_FREQMHZ {33.333} \
   CONFIG.PMC_CRP_HSM0_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_HSM1_REF_CTRL_ACT_FREQMHZ {131.481354} \
   CONFIG.PMC_CRP_HSM1_REF_CTRL_DIVISOR0 {9} \
   CONFIG.PMC_CRP_HSM1_REF_CTRL_FREQMHZ {133.333} \
   CONFIG.PMC_CRP_HSM1_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_I2C_REF_CTRL_ACT_FREQMHZ {99.999901} \
   CONFIG.PMC_CRP_I2C_REF_CTRL_DIVISOR0 {10} \
   CONFIG.PMC_CRP_I2C_REF_CTRL_FREQMHZ {100} \
   CONFIG.PMC_CRP_I2C_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PMC_CRP_LSBUS_REF_CTRL_ACT_FREQMHZ {147.916519} \
   CONFIG.PMC_CRP_LSBUS_REF_CTRL_DIVISOR0 {8} \
   CONFIG.PMC_CRP_LSBUS_REF_CTRL_FREQMHZ {150} \
   CONFIG.PMC_CRP_LSBUS_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_NOC_REF_CTRL_ACT_FREQMHZ {999.999023} \
   CONFIG.PMC_CRP_NOC_REF_CTRL_FREQMHZ {1000} \
   CONFIG.PMC_CRP_NOC_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PMC_CRP_NPI_REF_CTRL_ACT_FREQMHZ {295.833038} \
   CONFIG.PMC_CRP_NPI_REF_CTRL_DIVISOR0 {4} \
   CONFIG.PMC_CRP_NPI_REF_CTRL_FREQMHZ {300} \
   CONFIG.PMC_CRP_NPI_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_NPLL_CTRL_CLKOUTDIV {4} \
   CONFIG.PMC_CRP_NPLL_CTRL_FBDIV {120} \
   CONFIG.PMC_CRP_NPLL_CTRL_SRCSEL {REF_CLK} \
   CONFIG.PMC_CRP_NPLL_TO_XPD_CTRL_DIVISOR0 {1} \
   CONFIG.PMC_CRP_OSPI_REF_CTRL_ACT_FREQMHZ {200} \
   CONFIG.PMC_CRP_OSPI_REF_CTRL_DIVISOR0 {4} \
   CONFIG.PMC_CRP_OSPI_REF_CTRL_FREQMHZ {200} \
   CONFIG.PMC_CRP_OSPI_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_PL0_REF_CTRL_ACT_FREQMHZ {333.333008} \
   CONFIG.PMC_CRP_PL0_REF_CTRL_DIVISOR0 {3} \
   CONFIG.PMC_CRP_PL0_REF_CTRL_FREQMHZ {334} \
   CONFIG.PMC_CRP_PL0_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PMC_CRP_PL1_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PMC_CRP_PL1_REF_CTRL_DIVISOR0 {3} \
   CONFIG.PMC_CRP_PL1_REF_CTRL_FREQMHZ {334} \
   CONFIG.PMC_CRP_PL1_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PMC_CRP_PL2_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PMC_CRP_PL2_REF_CTRL_DIVISOR0 {3} \
   CONFIG.PMC_CRP_PL2_REF_CTRL_FREQMHZ {334} \
   CONFIG.PMC_CRP_PL2_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PMC_CRP_PL3_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PMC_CRP_PL3_REF_CTRL_DIVISOR0 {3} \
   CONFIG.PMC_CRP_PL3_REF_CTRL_FREQMHZ {334} \
   CONFIG.PMC_CRP_PL3_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PMC_CRP_PL5_REF_CTRL_FREQMHZ {400} \
   CONFIG.PMC_CRP_PPLL_CTRL_CLKOUTDIV {2} \
   CONFIG.PMC_CRP_PPLL_CTRL_FBDIV {71} \
   CONFIG.PMC_CRP_PPLL_CTRL_SRCSEL {REF_CLK} \
   CONFIG.PMC_CRP_PPLL_TO_XPD_CTRL_DIVISOR0 {1} \
   CONFIG.PMC_CRP_QSPI_REF_CTRL_ACT_FREQMHZ {295.833038} \
   CONFIG.PMC_CRP_QSPI_REF_CTRL_DIVISOR0 {4} \
   CONFIG.PMC_CRP_QSPI_REF_CTRL_FREQMHZ {300} \
   CONFIG.PMC_CRP_QSPI_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_SDIO0_REF_CTRL_ACT_FREQMHZ {200} \
   CONFIG.PMC_CRP_SDIO0_REF_CTRL_DIVISOR0 {6} \
   CONFIG.PMC_CRP_SDIO0_REF_CTRL_FREQMHZ {200} \
   CONFIG.PMC_CRP_SDIO0_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_SDIO1_REF_CTRL_ACT_FREQMHZ {199.999802} \
   CONFIG.PMC_CRP_SDIO1_REF_CTRL_DIVISOR0 {5} \
   CONFIG.PMC_CRP_SDIO1_REF_CTRL_FREQMHZ {200} \
   CONFIG.PMC_CRP_SDIO1_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PMC_CRP_SD_DLL_REF_CTRL_ACT_FREQMHZ {1183.332153} \
   CONFIG.PMC_CRP_SD_DLL_REF_CTRL_DIVISOR0 {1} \
   CONFIG.PMC_CRP_SD_DLL_REF_CTRL_FREQMHZ {1200} \
   CONFIG.PMC_CRP_SD_DLL_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_SWITCH_TIMEOUT_CTRL_ACT_FREQMHZ {1.000000} \
   CONFIG.PMC_CRP_SWITCH_TIMEOUT_CTRL_DIVISOR0 {100} \
   CONFIG.PMC_CRP_SWITCH_TIMEOUT_CTRL_FREQMHZ {1} \
   CONFIG.PMC_CRP_SWITCH_TIMEOUT_CTRL_SRCSEL {IRO_CLK/4} \
   CONFIG.PMC_CRP_SYSMON_REF_CTRL_ACT_FREQMHZ {295.833038} \
   CONFIG.PMC_CRP_SYSMON_REF_CTRL_FREQMHZ {295.833038} \
   CONFIG.PMC_CRP_SYSMON_REF_CTRL_SRCSEL {NPI_REF_CLK} \
   CONFIG.PMC_CRP_TEST_PATTERN_REF_CTRL_ACT_FREQMHZ {200} \
   CONFIG.PMC_CRP_TEST_PATTERN_REF_CTRL_DIVISOR0 {6} \
   CONFIG.PMC_CRP_TEST_PATTERN_REF_CTRL_FREQMHZ {200} \
   CONFIG.PMC_CRP_TEST_PATTERN_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PMC_CRP_USB_SUSPEND_CTRL_ACT_FREQMHZ {0.200000} \
   CONFIG.PMC_CRP_USB_SUSPEND_CTRL_DIVISOR0 {500} \
   CONFIG.PMC_CRP_USB_SUSPEND_CTRL_FREQMHZ {0.2} \
   CONFIG.PMC_CRP_USB_SUSPEND_CTRL_SRCSEL {IRO_CLK/4} \
   CONFIG.PMC_EXTERNAL_TAMPER {{{ENABLE 0} {IO None}}} \
   CONFIG.PMC_GPIO0_MIO_PERIPHERAL {{{ENABLE 1} {IO {PMC_MIO 0 .. 25}}}} \
   CONFIG.PMC_GPIO1_MIO_PERIPHERAL {{{ENABLE 1} {IO {PMC_MIO 26 .. 51}}}} \
   CONFIG.PMC_GPIO_EMIO_PERIPHERAL_ENABLE {0} \
   CONFIG.PMC_GPIO_EMIO_WIDTH {64} \
   CONFIG.PMC_GPIO_EMIO_WIDTH_HDL {64} \
   CONFIG.PMC_GPI_ENABLE {0} \
   CONFIG.PMC_GPI_WIDTH {32} \
   CONFIG.PMC_GPO_ENABLE {0} \
   CONFIG.PMC_GPO_WIDTH {32} \
   CONFIG.PMC_HSM0_CLK_ENABLE {1} \
   CONFIG.PMC_HSM1_CLK_ENABLE {1} \
   CONFIG.PMC_I2CPMC_PERIPHERAL {{{ENABLE 1} {IO {PMC_MIO 46 .. 47}}}} \
   CONFIG.PMC_MIO0 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO1 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO2 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO3 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO4 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO5 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO6 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO7 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO8 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO9 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO10 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO11 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO12 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO13 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO14 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO15 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO16 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO17 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO18 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO19 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO20 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO21 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO22 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO23 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO24 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO25 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO26 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO27 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO28 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO29 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO30 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO31 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO32 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO33 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO34 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO35 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO36 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO37 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA high} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE GPIO}}}\
   CONFIG.PMC_MIO38 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Unassigned}}}\
   CONFIG.PMC_MIO39 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Unassigned}}}\
   CONFIG.PMC_MIO40 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO41 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO42 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO43 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO44 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO45 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO46 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO47 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO48 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Unassigned}}}\
   CONFIG.PMC_MIO49 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Unassigned}}}\
   CONFIG.PMC_MIO50 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Unassigned}}}\
   CONFIG.PMC_MIO51 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PMC_MIO_EN_FOR_PL_PCIE {0} \
   CONFIG.PMC_MIO_TREE_PERIPHERALS {{QSPI#QSPI#QSPI#QSPI#QSPI#QSPI#Loopback Clk#QSPI#QSPI#QSPI#QSPI#QSPI#QSPI#USB\
0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB\
0#SD1/eMMC1#SD1/eMMC1#SD1#SD1/eMMC1#SD1/eMMC1#SD1/eMMC1#SD1/eMMC1#SD1/eMMC1#SD1/eMMC1#SD1/eMMC1#SD1/eMMC1#GPIO\
1###CAN 1#CAN 1#UART 0#UART 0#I2C 1#I2C 1#i2c_pmc#i2c_pmc####SD1/eMMC1#Enet\
0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet\
0#Enet 1#Enet 1#Enet 1#Enet 1#Enet 1#Enet 1#Enet 1#Enet 1#Enet 1#Enet 1#Enet\
1#Enet 1#Enet 0#Enet 0}}\
   CONFIG.PMC_MIO_TREE_SIGNALS {qspi0_clk#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]#qspi0_io[0]#qspi0_cs_b#qspi_lpbk#qspi1_cs_b#qspi1_io[0]#qspi1_io[1]#qspi1_io[2]#qspi1_io[3]#qspi1_clk#usb2phy_reset#ulpi_tx_data[0]#ulpi_tx_data[1]#ulpi_tx_data[2]#ulpi_tx_data[3]#ulpi_clk#ulpi_tx_data[4]#ulpi_tx_data[5]#ulpi_tx_data[6]#ulpi_tx_data[7]#ulpi_dir#ulpi_stp#ulpi_nxt#clk#dir1/data[7]#detect#cmd#data[0]#data[1]#data[2]#data[3]#sel/data[4]#dir_cmd/data[5]#dir0/data[6]#gpio_1_pin[37]###phy_tx#phy_rx#rxd#txd#scl#sda#scl#sda####buspwr/rst#rgmii_tx_clk#rgmii_txd[0]#rgmii_txd[1]#rgmii_txd[2]#rgmii_txd[3]#rgmii_tx_ctl#rgmii_rx_clk#rgmii_rxd[0]#rgmii_rxd[1]#rgmii_rxd[2]#rgmii_rxd[3]#rgmii_rx_ctl#rgmii_tx_clk#rgmii_txd[0]#rgmii_txd[1]#rgmii_txd[2]#rgmii_txd[3]#rgmii_tx_ctl#rgmii_rx_clk#rgmii_rxd[0]#rgmii_rxd[1]#rgmii_rxd[2]#rgmii_rxd[3]#rgmii_rx_ctl#gem0_mdc#gem0_mdio}\
   CONFIG.PMC_NOC_PMC_ADDR_WIDTH {64} \
   CONFIG.PMC_NOC_PMC_DATA_WIDTH {128} \
   CONFIG.PMC_OSPI_COHERENCY {0} \
   CONFIG.PMC_OSPI_PERIPHERAL {{{ENABLE 0} {IO {PMC_MIO 0 .. 11}} {MODE Single}}} \
   CONFIG.PMC_OSPI_ROUTE_THROUGH_FPD {0} \
   CONFIG.PMC_PL_ALT_REF_CLK_FREQMHZ {33.333} \
   CONFIG.PMC_PMC_NOC_ADDR_WIDTH {64} \
   CONFIG.PMC_PMC_NOC_DATA_WIDTH {128} \
   CONFIG.PMC_QSPI_COHERENCY {0} \
   CONFIG.PMC_QSPI_FBCLK {{{ENABLE 1} {IO {PMC_MIO 6}}}} \
   CONFIG.PMC_QSPI_PERIPHERAL_DATA_MODE {x4} \
   CONFIG.PMC_QSPI_PERIPHERAL_ENABLE {1} \
   CONFIG.PMC_QSPI_PERIPHERAL_MODE {{Dual Parallel}} \
   CONFIG.PMC_QSPI_ROUTE_THROUGH_FPD {0} \
   CONFIG.PMC_REF_CLK_FREQMHZ {33.3333} \
   CONFIG.PMC_SD0 {{{CD_ENABLE 0} {CD_IO {PMC_MIO 24}} {POW_ENABLE 0} {POW_IO {PMC_MIO 17}}\
{RESET_ENABLE 0} {RESET_IO {PMC_MIO 17}} {WP_ENABLE 0} {WP_IO {PMC_MIO 25}}}}\
   CONFIG.PMC_SD0_COHERENCY {0} \
   CONFIG.PMC_SD0_DATA_TRANSFER_MODE {4Bit} \
   CONFIG.PMC_SD0_PERIPHERAL {{{ENABLE 0} {IO {PMC_MIO 13 .. 25}}}} \
   CONFIG.PMC_SD0_ROUTE_THROUGH_FPD {0} \
   CONFIG.PMC_SD0_SLOT_TYPE {{SD 2.0}} \
   CONFIG.PMC_SD0_SPEED_MODE {{default speed}} \
   CONFIG.PMC_SD1 {{{CD_ENABLE 1} {CD_IO {PMC_MIO 28}} {POW_ENABLE 1} {POW_IO {PMC_MIO 51}}\
{RESET_ENABLE 0} {RESET_IO {PMC_MIO 1}} {WP_ENABLE 0} {WP_IO {PMC_MIO 1}}}}\
   CONFIG.PMC_SD1_COHERENCY {0} \
   CONFIG.PMC_SD1_DATA_TRANSFER_MODE {8Bit} \
   CONFIG.PMC_SD1_PERIPHERAL {{{ENABLE 1} {IO {PMC_MIO 26 .. 36}}}} \
   CONFIG.PMC_SD1_ROUTE_THROUGH_FPD {0} \
   CONFIG.PMC_SD1_SLOT_TYPE {{SD 3.0}} \
   CONFIG.PMC_SD1_SPEED_MODE {{high speed}} \
   CONFIG.PMC_SHOW_CCI_SMMU_SETTINGS {0} \
   CONFIG.PMC_SMAP_PERIPHERAL {{{ENABLE 0} {IO {32 Bit}}}} \
   CONFIG.PMC_TAMPER_EXTMIO_ENABLE {0} \
   CONFIG.PMC_TAMPER_EXTMIO_ERASE_BBRAM {0} \
   CONFIG.PMC_TAMPER_EXTMIO_RESPONSE {{SYS INTERRUPT}} \
   CONFIG.PMC_TAMPER_GLITCHDETECT_ENABLE {0} \
   CONFIG.PMC_TAMPER_GLITCHDETECT_ERASE_BBRAM {0} \
   CONFIG.PMC_TAMPER_GLITCHDETECT_RESPONSE {{SYS INTERRUPT}} \
   CONFIG.PMC_TAMPER_JTAGDETECT_ENABLE {0} \
   CONFIG.PMC_TAMPER_JTAGDETECT_ERASE_BBRAM {0} \
   CONFIG.PMC_TAMPER_JTAGDETECT_RESPONSE {{SYS INTERRUPT}} \
   CONFIG.PMC_TAMPER_TEMPERATURE_ENABLE {0} \
   CONFIG.PMC_TAMPER_TEMPERATURE_ERASE_BBRAM {0} \
   CONFIG.PMC_TAMPER_TEMPERATURE_RESPONSE {{SYS INTERRUPT}} \
   CONFIG.PMC_TAMPER_TRIGGER_ERASE_BBRAM {0} \
   CONFIG.PMC_TAMPER_TRIGGER_REGISTER {0} \
   CONFIG.PMC_TAMPER_TRIGGER_RESPONSE {{SYS INTERRUPT}} \
   CONFIG.PMC_USE_CFU_SEU {0} \
   CONFIG.PMC_USE_NOC_PMC_AXI0 {0} \
   CONFIG.PMC_USE_PL_PMC_AUX_REF_CLK {0} \
   CONFIG.PMC_USE_PMC_NOC_AXI0 {1} \
   CONFIG.PMC_WDT_PERIOD {100} \
   CONFIG.PMC_WDT_PERIPHERAL {{{ENABLE 0} {IO {PMC_MIO 0}}}} \
   CONFIG.POWER_REPORTING_MODE {Custom} \
   CONFIG.PSPMC_MANUAL_CLK_ENABLE {0} \
   CONFIG.PS_A72_ACTIVE_BLOCKS {2} \
   CONFIG.PS_A72_LOAD {90} \
   CONFIG.PS_BANK_2_IO_STANDARD {LVCMOS1.8} \
   CONFIG.PS_BANK_3_IO_STANDARD {LVCMOS1.8} \
   CONFIG.PS_BOARD_INTERFACE {ps_pmc_fixed_io} \
   CONFIG.PS_CAN0_CLK {{{ENABLE 0} {IO {PMC_MIO 0}}}} \
   CONFIG.PS_CAN0_PERIPHERAL {{{ENABLE 0} {IO {PMC_MIO 8 .. 9}}}} \
   CONFIG.PS_CAN1_CLK {{{ENABLE 0} {IO {PMC_MIO 0}}}} \
   CONFIG.PS_CAN1_PERIPHERAL {{{ENABLE 1} {IO {PMC_MIO 40 .. 41}}}} \
   CONFIG.PS_CRF_ACPU_CTRL_ACT_FREQMHZ {1399.998657} \
   CONFIG.PS_CRF_ACPU_CTRL_DIVISOR0 {1} \
   CONFIG.PS_CRF_ACPU_CTRL_FREQMHZ {1400} \
   CONFIG.PS_CRF_ACPU_CTRL_SRCSEL {APLL} \
   CONFIG.PS_CRF_APLL_CTRL_CLKOUTDIV {2} \
   CONFIG.PS_CRF_APLL_CTRL_FBDIV {84} \
   CONFIG.PS_CRF_APLL_CTRL_SRCSEL {REF_CLK} \
   CONFIG.PS_CRF_APLL_TO_XPD_CTRL_DIVISOR0 {1} \
   CONFIG.PS_CRF_DBG_FPD_CTRL_ACT_FREQMHZ {394.444061} \
   CONFIG.PS_CRF_DBG_FPD_CTRL_DIVISOR0 {3} \
   CONFIG.PS_CRF_DBG_FPD_CTRL_FREQMHZ {400} \
   CONFIG.PS_CRF_DBG_FPD_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRF_DBG_TRACE_CTRL_ACT_FREQMHZ {300} \
   CONFIG.PS_CRF_DBG_TRACE_CTRL_DIVISOR0 {3} \
   CONFIG.PS_CRF_DBG_TRACE_CTRL_FREQMHZ {300} \
   CONFIG.PS_CRF_DBG_TRACE_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRF_FPD_LSBUS_CTRL_ACT_FREQMHZ {147.916519} \
   CONFIG.PS_CRF_FPD_LSBUS_CTRL_DIVISOR0 {8} \
   CONFIG.PS_CRF_FPD_LSBUS_CTRL_FREQMHZ {150} \
   CONFIG.PS_CRF_FPD_LSBUS_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRF_FPD_TOP_SWITCH_CTRL_ACT_FREQMHZ {824.999207} \
   CONFIG.PS_CRF_FPD_TOP_SWITCH_CTRL_DIVISOR0 {1} \
   CONFIG.PS_CRF_FPD_TOP_SWITCH_CTRL_FREQMHZ {825} \
   CONFIG.PS_CRF_FPD_TOP_SWITCH_CTRL_SRCSEL {RPLL} \
   CONFIG.PS_CRL_CAN0_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PS_CRL_CAN0_REF_CTRL_DIVISOR0 {12} \
   CONFIG.PS_CRL_CAN0_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_CRL_CAN0_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRL_CAN1_REF_CTRL_ACT_FREQMHZ {99.999901} \
   CONFIG.PS_CRL_CAN1_REF_CTRL_DIVISOR0 {10} \
   CONFIG.PS_CRL_CAN1_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_CRL_CAN1_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PS_CRL_CPM_TOPSW_REF_CTRL_ACT_FREQMHZ {824.999207} \
   CONFIG.PS_CRL_CPM_TOPSW_REF_CTRL_DIVISOR0 {2} \
   CONFIG.PS_CRL_CPM_TOPSW_REF_CTRL_FREQMHZ {825} \
   CONFIG.PS_CRL_CPM_TOPSW_REF_CTRL_SRCSEL {RPLL} \
   CONFIG.PS_CRL_CPU_R5_CTRL_ACT_FREQMHZ {591.666077} \
   CONFIG.PS_CRL_CPU_R5_CTRL_DIVISOR0 {2} \
   CONFIG.PS_CRL_CPU_R5_CTRL_FREQMHZ {600} \
   CONFIG.PS_CRL_CPU_R5_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRL_DBG_LPD_CTRL_ACT_FREQMHZ {394.444061} \
   CONFIG.PS_CRL_DBG_LPD_CTRL_DIVISOR0 {3} \
   CONFIG.PS_CRL_DBG_LPD_CTRL_FREQMHZ {400} \
   CONFIG.PS_CRL_DBG_LPD_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRL_DBG_TSTMP_CTRL_ACT_FREQMHZ {394.444061} \
   CONFIG.PS_CRL_DBG_TSTMP_CTRL_DIVISOR0 {3} \
   CONFIG.PS_CRL_DBG_TSTMP_CTRL_FREQMHZ {400} \
   CONFIG.PS_CRL_DBG_TSTMP_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRL_GEM0_REF_CTRL_ACT_FREQMHZ {124.999878} \
   CONFIG.PS_CRL_GEM0_REF_CTRL_DIVISOR0 {8} \
   CONFIG.PS_CRL_GEM0_REF_CTRL_FREQMHZ {125} \
   CONFIG.PS_CRL_GEM0_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PS_CRL_GEM1_REF_CTRL_ACT_FREQMHZ {124.999878} \
   CONFIG.PS_CRL_GEM1_REF_CTRL_DIVISOR0 {8} \
   CONFIG.PS_CRL_GEM1_REF_CTRL_FREQMHZ {125} \
   CONFIG.PS_CRL_GEM1_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PS_CRL_GEM_TSU_REF_CTRL_ACT_FREQMHZ {249.999756} \
   CONFIG.PS_CRL_GEM_TSU_REF_CTRL_DIVISOR0 {4} \
   CONFIG.PS_CRL_GEM_TSU_REF_CTRL_FREQMHZ {250} \
   CONFIG.PS_CRL_GEM_TSU_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PS_CRL_I2C0_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PS_CRL_I2C0_REF_CTRL_DIVISOR0 {12} \
   CONFIG.PS_CRL_I2C0_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_CRL_I2C0_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRL_I2C1_REF_CTRL_ACT_FREQMHZ {99.999901} \
   CONFIG.PS_CRL_I2C1_REF_CTRL_DIVISOR0 {10} \
   CONFIG.PS_CRL_I2C1_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_CRL_I2C1_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PS_CRL_IOU_SWITCH_CTRL_ACT_FREQMHZ {249.999756} \
   CONFIG.PS_CRL_IOU_SWITCH_CTRL_DIVISOR0 {4} \
   CONFIG.PS_CRL_IOU_SWITCH_CTRL_FREQMHZ {250} \
   CONFIG.PS_CRL_IOU_SWITCH_CTRL_SRCSEL {NPLL} \
   CONFIG.PS_CRL_LPD_LSBUS_CTRL_ACT_FREQMHZ {149.999863} \
   CONFIG.PS_CRL_LPD_LSBUS_CTRL_DIVISOR0 {11} \
   CONFIG.PS_CRL_LPD_LSBUS_CTRL_FREQMHZ {150} \
   CONFIG.PS_CRL_LPD_LSBUS_CTRL_SRCSEL {RPLL} \
   CONFIG.PS_CRL_LPD_TOP_SWITCH_CTRL_ACT_FREQMHZ {591.666077} \
   CONFIG.PS_CRL_LPD_TOP_SWITCH_CTRL_DIVISOR0 {2} \
   CONFIG.PS_CRL_LPD_TOP_SWITCH_CTRL_FREQMHZ {600} \
   CONFIG.PS_CRL_LPD_TOP_SWITCH_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRL_PSM_REF_CTRL_ACT_FREQMHZ {394.444061} \
   CONFIG.PS_CRL_PSM_REF_CTRL_DIVISOR0 {3} \
   CONFIG.PS_CRL_PSM_REF_CTRL_FREQMHZ {400} \
   CONFIG.PS_CRL_PSM_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRL_RPLL_CTRL_CLKOUTDIV {2} \
   CONFIG.PS_CRL_RPLL_CTRL_FBDIV {99} \
   CONFIG.PS_CRL_RPLL_CTRL_SRCSEL {REF_CLK} \
   CONFIG.PS_CRL_RPLL_TO_XPD_CTRL_DIVISOR0 {2} \
   CONFIG.PS_CRL_SPI0_REF_CTRL_ACT_FREQMHZ {200} \
   CONFIG.PS_CRL_SPI0_REF_CTRL_DIVISOR0 {6} \
   CONFIG.PS_CRL_SPI0_REF_CTRL_FREQMHZ {200} \
   CONFIG.PS_CRL_SPI0_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRL_SPI1_REF_CTRL_ACT_FREQMHZ {200} \
   CONFIG.PS_CRL_SPI1_REF_CTRL_DIVISOR0 {6} \
   CONFIG.PS_CRL_SPI1_REF_CTRL_FREQMHZ {200} \
   CONFIG.PS_CRL_SPI1_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRL_TIMESTAMP_REF_CTRL_ACT_FREQMHZ {99.999901} \
   CONFIG.PS_CRL_TIMESTAMP_REF_CTRL_DIVISOR0 {10} \
   CONFIG.PS_CRL_TIMESTAMP_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_CRL_TIMESTAMP_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PS_CRL_UART0_REF_CTRL_ACT_FREQMHZ {99.999901} \
   CONFIG.PS_CRL_UART0_REF_CTRL_DIVISOR0 {10} \
   CONFIG.PS_CRL_UART0_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_CRL_UART0_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PS_CRL_UART1_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PS_CRL_UART1_REF_CTRL_DIVISOR0 {12} \
   CONFIG.PS_CRL_UART1_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_CRL_UART1_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_CRL_USB0_BUS_REF_CTRL_ACT_FREQMHZ {19.999981} \
   CONFIG.PS_CRL_USB0_BUS_REF_CTRL_DIVISOR0 {50} \
   CONFIG.PS_CRL_USB0_BUS_REF_CTRL_FREQMHZ {20} \
   CONFIG.PS_CRL_USB0_BUS_REF_CTRL_SRCSEL {NPLL} \
   CONFIG.PS_CRL_USB3_DUAL_REF_CTRL_ACT_FREQMHZ {20} \
   CONFIG.PS_CRL_USB3_DUAL_REF_CTRL_DIVISOR0 {60} \
   CONFIG.PS_CRL_USB3_DUAL_REF_CTRL_FREQMHZ {10} \
   CONFIG.PS_CRL_USB3_DUAL_REF_CTRL_SRCSEL {PPLL} \
   CONFIG.PS_DDRC_ENABLE {1} \
   CONFIG.PS_DDR_RAM_HIGHADDR_OFFSET {0x800000000} \
   CONFIG.PS_DDR_RAM_LOWADDR_OFFSET {0x80000000} \
   CONFIG.PS_ENABLE_HSDP {0} \
   CONFIG.PS_ENET0_MDIO {{{ENABLE 1} {IO {PS_MIO 24 .. 25}}}} \
   CONFIG.PS_ENET0_PERIPHERAL {{{ENABLE 1} {IO {PS_MIO 0 .. 11}}}} \
   CONFIG.PS_ENET1_MDIO {{{ENABLE 0} {IO {PMC_MIO 50 .. 51}}}} \
   CONFIG.PS_ENET1_PERIPHERAL {{{ENABLE 1} {IO {PS_MIO 12 .. 23}}}} \
   CONFIG.PS_EN_AXI_STATUS_PORTS {0} \
   CONFIG.PS_EN_PORTS_CONTROLLER_BASED {0} \
   CONFIG.PS_EXPAND_CORESIGHT {0} \
   CONFIG.PS_EXPAND_FPD_SLAVES {0} \
   CONFIG.PS_EXPAND_GIC {0} \
   CONFIG.PS_EXPAND_LPD_SLAVES {0} \
   CONFIG.PS_FPD_INTERCONNECT_LOAD {90} \
   CONFIG.PS_FTM_CTI_IN0 {0} \
   CONFIG.PS_FTM_CTI_IN1 {0} \
   CONFIG.PS_FTM_CTI_IN2 {0} \
   CONFIG.PS_FTM_CTI_IN3 {0} \
   CONFIG.PS_FTM_CTI_OUT0 {0} \
   CONFIG.PS_FTM_CTI_OUT1 {0} \
   CONFIG.PS_FTM_CTI_OUT2 {0} \
   CONFIG.PS_FTM_CTI_OUT3 {0} \
   CONFIG.PS_GEM0_COHERENCY {0} \
   CONFIG.PS_GEM0_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_GEM1_COHERENCY {0} \
   CONFIG.PS_GEM1_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_GEM_TSU {{{ENABLE 0} {IO {PS_MIO 24}}}} \
   CONFIG.PS_GEM_TSU_CLK_PORT_PAIR {0} \
   CONFIG.PS_GEN_IPI0_ENABLE {1} \
   CONFIG.PS_GEN_IPI0_MASTER {A72} \
   CONFIG.PS_GEN_IPI1_ENABLE {1} \
   CONFIG.PS_GEN_IPI1_MASTER {A72} \
   CONFIG.PS_GEN_IPI2_ENABLE {1} \
   CONFIG.PS_GEN_IPI2_MASTER {A72} \
   CONFIG.PS_GEN_IPI3_ENABLE {1} \
   CONFIG.PS_GEN_IPI3_MASTER {A72} \
   CONFIG.PS_GEN_IPI4_ENABLE {1} \
   CONFIG.PS_GEN_IPI4_MASTER {A72} \
   CONFIG.PS_GEN_IPI5_ENABLE {1} \
   CONFIG.PS_GEN_IPI5_MASTER {A72} \
   CONFIG.PS_GEN_IPI6_ENABLE {1} \
   CONFIG.PS_GEN_IPI6_MASTER {A72} \
   CONFIG.PS_GEN_IPI_PMCNOBUF_ENABLE {1} \
   CONFIG.PS_GEN_IPI_PMCNOBUF_MASTER {PMC} \
   CONFIG.PS_GEN_IPI_PMC_ENABLE {1} \
   CONFIG.PS_GEN_IPI_PMC_MASTER {PMC} \
   CONFIG.PS_GEN_IPI_PSM_ENABLE {1} \
   CONFIG.PS_GEN_IPI_PSM_MASTER {PSM} \
   CONFIG.PS_GPIO2_MIO_PERIPHERAL {{{ENABLE 0} {IO {PS_MIO 0 .. 25}}}} \
   CONFIG.PS_GPIO_EMIO_PERIPHERAL_ENABLE {0} \
   CONFIG.PS_GPIO_EMIO_WIDTH {32} \
   CONFIG.PS_HSDP0_REFCLK {0} \
   CONFIG.PS_HSDP1_REFCLK {0} \
   CONFIG.PS_HSDP_EGRESS_TRAFFIC {JTAG} \
   CONFIG.PS_HSDP_INGRESS_TRAFFIC {JTAG} \
   CONFIG.PS_HSDP_MODE {NONE} \
   CONFIG.PS_HSDP_SAME_EGRESS_AS_INGRESS_TRAFFIC {1} \
   CONFIG.PS_HSDP_SAME_INGRESS_EGRESS_TRAFFIC {JTAG} \
   CONFIG.PS_I2C0_PERIPHERAL {{{ENABLE 0} {IO {PS_MIO 2 .. 3}}}} \
   CONFIG.PS_I2C1_PERIPHERAL {{{ENABLE 1} {IO {PMC_MIO 44 .. 45}}}} \
   CONFIG.PS_I2CSYSMON_PERIPHERAL {{{ENABLE 0} {IO {PS_MIO 23 .. 25}}}} \
   CONFIG.PS_IRQ_USAGE {{{CH0 0} {CH1 0} {CH10 0} {CH11 0} {CH12 0} {CH13 0} {CH14 0} {CH15 0} {CH2 0}\
{CH3 0} {CH4 0} {CH5 0} {CH6 0} {CH7 0} {CH8 0} {CH9 0}}}\
   CONFIG.PS_LPDMA0_COHERENCY {0} \
   CONFIG.PS_LPDMA0_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_LPDMA1_COHERENCY {0} \
   CONFIG.PS_LPDMA1_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_LPDMA2_COHERENCY {0} \
   CONFIG.PS_LPDMA2_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_LPDMA3_COHERENCY {0} \
   CONFIG.PS_LPDMA3_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_LPDMA4_COHERENCY {0} \
   CONFIG.PS_LPDMA4_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_LPDMA5_COHERENCY {0} \
   CONFIG.PS_LPDMA5_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_LPDMA6_COHERENCY {0} \
   CONFIG.PS_LPDMA6_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_LPDMA7_COHERENCY {0} \
   CONFIG.PS_LPDMA7_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_LPD_DMA_CHANNEL_ENABLE {{{CH0 0} {CH1 0} {CH2 0} {CH3 0} {CH4 0} {CH5 0} {CH6 0} {CH7 0}}} \
   CONFIG.PS_LPD_DMA_CH_TZ {{{CH0 NonSecure} {CH1 NonSecure} {CH2 NonSecure} {CH3 NonSecure} {CH4\
NonSecure} {CH5 NonSecure} {CH6 NonSecure} {CH7 NonSecure}}}\
   CONFIG.PS_LPD_DMA_ENABLE {0} \
   CONFIG.PS_LPD_INTERCONNECT_LOAD {90} \
   CONFIG.PS_MIO0 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO1 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO2 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO3 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO4 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO5 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO6 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO7 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
disable} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO8 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO9 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
disable} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO10 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO11 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO12 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO13 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO14 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO15 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO16 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO17 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO18 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO19 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
disable} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO20 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO21 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
disable} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO22 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO23 {{{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO24 {{{AUX_IO 0} {DIRECTION out} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 1} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_MIO25 {{{AUX_IO 0} {DIRECTION inout} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL\
pullup} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}}\
   CONFIG.PS_M_AXI_FPD_DATA_WIDTH {128} \
   CONFIG.PS_M_AXI_GP4_DATA_WIDTH {128} \
   CONFIG.PS_M_AXI_LPD_DATA_WIDTH {128} \
   CONFIG.PS_NOC_PS_CCI_DATA_WIDTH {128} \
   CONFIG.PS_NOC_PS_NCI_DATA_WIDTH {128} \
   CONFIG.PS_NOC_PS_PCI_DATA_WIDTH {128} \
   CONFIG.PS_NOC_PS_PMC_DATA_WIDTH {128} \
   CONFIG.PS_NUM_F2P0_INTR_INPUTS {1} \
   CONFIG.PS_NUM_F2P1_INTR_INPUTS {1} \
   CONFIG.PS_NUM_FABRIC_RESETS {1} \
   CONFIG.PS_OCM_ACTIVE_BLOCKS {1} \
   CONFIG.PS_PCIE1_PERIPHERAL_ENABLE {0} \
   CONFIG.PS_PCIE2_PERIPHERAL_ENABLE {0} \
   CONFIG.PS_PCIE_EP_RESET1_IO {None} \
   CONFIG.PS_PCIE_EP_RESET2_IO {None} \
   CONFIG.PS_PCIE_PERIPHERAL_ENABLE {0} \
   CONFIG.PS_PCIE_RESET {{{ENABLE 1} {IO {PMC_MIO 38 .. 39}}}} \
   CONFIG.PS_PCIE_ROOT_RESET1_IO {None} \
   CONFIG.PS_PCIE_ROOT_RESET1_IO_DIR {output} \
   CONFIG.PS_PCIE_ROOT_RESET1_POLARITY {{Active Low}} \
   CONFIG.PS_PCIE_ROOT_RESET2_IO {None} \
   CONFIG.PS_PCIE_ROOT_RESET2_IO_DIR {output} \
   CONFIG.PS_PCIE_ROOT_RESET2_POLARITY {{Active Low}} \
   CONFIG.PS_PL_CONNECTIVITY_MODE {Custom} \
   CONFIG.PS_PL_DONE {0} \
   CONFIG.PS_PL_PASS_AXPROT_VALUE {0} \
   CONFIG.PS_PMCPL_CLK0_BUF {1} \
   CONFIG.PS_PMCPL_CLK1_BUF {1} \
   CONFIG.PS_PMCPL_CLK2_BUF {1} \
   CONFIG.PS_PMCPL_CLK3_BUF {1} \
   CONFIG.PS_PMCPL_IRO_CLK_BUF {1} \
   CONFIG.PS_PMU_PERIPHERAL_ENABLE {0} \
   CONFIG.PS_PS_ENABLE {0} \
   CONFIG.PS_PS_NOC_CCI_DATA_WIDTH {128} \
   CONFIG.PS_PS_NOC_NCI_DATA_WIDTH {128} \
   CONFIG.PS_PS_NOC_PCI_DATA_WIDTH {128} \
   CONFIG.PS_PS_NOC_PMC_DATA_WIDTH {128} \
   CONFIG.PS_PS_NOC_RPU_DATA_WIDTH {128} \
   CONFIG.PS_R5_ACTIVE_BLOCKS {2} \
   CONFIG.PS_R5_LOAD {90} \
   CONFIG.PS_RPU_COHERENCY {0} \
   CONFIG.PS_SLR_TYPE {master} \
   CONFIG.PS_SMON_PL_PORTS_ENABLE {0} \
   CONFIG.PS_SPI0 {{{GRP_SS0_ENABLE 0} {GRP_SS0_IO {PMC_MIO 15}} {GRP_SS1_ENABLE 0} {GRP_SS1_IO\
{PMC_MIO 14}} {GRP_SS2_ENABLE 0} {GRP_SS2_IO {PMC_MIO 13}} {PERIPHERAL_ENABLE\
0} {PERIPHERAL_IO {PMC_MIO 12 .. 17}}}}\
   CONFIG.PS_SPI1 {{{GRP_SS0_ENABLE 0} {GRP_SS0_IO {PS_MIO 9}} {GRP_SS1_ENABLE 0} {GRP_SS1_IO\
{PS_MIO 8}} {GRP_SS2_ENABLE 0} {GRP_SS2_IO {PS_MIO 7}} {PERIPHERAL_ENABLE 0}\
{PERIPHERAL_IO {PS_MIO 6 .. 11}}}}\
   CONFIG.PS_S_AXI_ACE_DATA_WIDTH {128} \
   CONFIG.PS_S_AXI_ACP_DATA_WIDTH {128} \
   CONFIG.PS_S_AXI_FPD_DATA_WIDTH {128} \
   CONFIG.PS_S_AXI_GP2_DATA_WIDTH {128} \
   CONFIG.PS_S_AXI_LPD_DATA_WIDTH {128} \
   CONFIG.PS_TCM_ACTIVE_BLOCKS {2} \
   CONFIG.PS_TRACE_PERIPHERAL {{{ENABLE 0} {IO {PMC_MIO 30 .. 47}}}} \
   CONFIG.PS_TRACE_WIDTH {32Bit} \
   CONFIG.PS_TRISTATE_INVERTED {1} \
   CONFIG.PS_TTC0_CLK {{{ENABLE 0} {IO {PS_MIO 6}}}} \
   CONFIG.PS_TTC0_PERIPHERAL_ENABLE {0} \
   CONFIG.PS_TTC0_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PS_TTC0_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_TTC0_WAVEOUT {{{ENABLE 0} {IO {PS_MIO 7}}}} \
   CONFIG.PS_TTC1_CLK {{{ENABLE 0} {IO {PS_MIO 12}}}} \
   CONFIG.PS_TTC1_PERIPHERAL_ENABLE {0} \
   CONFIG.PS_TTC1_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PS_TTC1_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_TTC1_WAVEOUT {{{ENABLE 0} {IO {PS_MIO 13}}}} \
   CONFIG.PS_TTC2_CLK {{{ENABLE 0} {IO {PS_MIO 2}}}} \
   CONFIG.PS_TTC2_PERIPHERAL_ENABLE {0} \
   CONFIG.PS_TTC2_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PS_TTC2_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_TTC2_WAVEOUT {{{ENABLE 0} {IO {PS_MIO 3}}}} \
   CONFIG.PS_TTC3_CLK {{{ENABLE 0} {IO {PS_MIO 16}}}} \
   CONFIG.PS_TTC3_PERIPHERAL_ENABLE {0} \
   CONFIG.PS_TTC3_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PS_TTC3_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_TTC3_WAVEOUT {{{ENABLE 0} {IO {PS_MIO 17}}}} \
   CONFIG.PS_TTC_APB_CLK_TTC0_SEL {APB} \
   CONFIG.PS_TTC_APB_CLK_TTC1_SEL {APB} \
   CONFIG.PS_TTC_APB_CLK_TTC2_SEL {APB} \
   CONFIG.PS_TTC_APB_CLK_TTC3_SEL {APB} \
   CONFIG.PS_UART0_BAUD_RATE {115200} \
   CONFIG.PS_UART0_PERIPHERAL {{{ENABLE 1} {IO {PMC_MIO 42 .. 43}}}} \
   CONFIG.PS_UART0_RTS_CTS {{{ENABLE 0} {IO {PS_MIO 2 .. 3}}}} \
   CONFIG.PS_UART1_BAUD_RATE {115200} \
   CONFIG.PS_UART1_PERIPHERAL {{{ENABLE 0} {IO {PMC_MIO 4 .. 5}}}} \
   CONFIG.PS_UART1_RTS_CTS {{{ENABLE 0} {IO {PMC_MIO 6 .. 7}}}} \
   CONFIG.PS_UNITS_MODE {Custom} \
   CONFIG.PS_USB3_PERIPHERAL {{{ENABLE 1} {IO {PMC_MIO 13 .. 25}}}} \
   CONFIG.PS_USB_COHERENCY {0} \
   CONFIG.PS_USB_ROUTE_THROUGH_FPD {0} \
   CONFIG.PS_USE_ACE_LITE {0} \
   CONFIG.PS_USE_APU_EVENT_BUS {0} \
   CONFIG.PS_USE_APU_INTERRUPT {0} \
   CONFIG.PS_USE_AXI4_EXT_USER_BITS {0} \
   CONFIG.PS_USE_BSCAN_USER1 {0} \
   CONFIG.PS_USE_BSCAN_USER2 {0} \
   CONFIG.PS_USE_BSCAN_USER3 {0} \
   CONFIG.PS_USE_BSCAN_USER4 {0} \
   CONFIG.PS_USE_CAPTURE {0} \
   CONFIG.PS_USE_CLK {0} \
   CONFIG.PS_USE_DEBUG_TEST {0} \
   CONFIG.PS_USE_DIFF_RW_CLK_S_AXI_FPD {0} \
   CONFIG.PS_USE_DIFF_RW_CLK_S_AXI_GP2 {0} \
   CONFIG.PS_USE_DIFF_RW_CLK_S_AXI_LPD {0} \
   CONFIG.PS_USE_ENET0_PTP {0} \
   CONFIG.PS_USE_ENET1_PTP {0} \
   CONFIG.PS_USE_FIFO_ENET0 {0} \
   CONFIG.PS_USE_FIFO_ENET1 {0} \
   CONFIG.PS_USE_FIXED_IO {0} \
   CONFIG.PS_USE_FPD_AXI_NOC0 {0} \
   CONFIG.PS_USE_FPD_AXI_NOC1 {0} \
   CONFIG.PS_USE_FPD_CCI_NOC {1} \
   CONFIG.PS_USE_FPD_CCI_NOC0 {0} \
   CONFIG.PS_USE_FPD_CCI_NOC1 {0} \
   CONFIG.PS_USE_FPD_CCI_NOC2 {0} \
   CONFIG.PS_USE_FPD_CCI_NOC3 {0} \
   CONFIG.PS_USE_FTM_GPI {0} \
   CONFIG.PS_USE_FTM_GPO {0} \
   CONFIG.PS_USE_HSDP_PL {0} \
   CONFIG.PS_USE_M_AXI_FPD {0} \
   CONFIG.PS_USE_M_AXI_LPD {0} \
   CONFIG.PS_USE_NOC_FPD_AXI0 {0} \
   CONFIG.PS_USE_NOC_FPD_AXI1 {0} \
   CONFIG.PS_USE_NOC_FPD_CCI0 {0} \
   CONFIG.PS_USE_NOC_FPD_CCI1 {0} \
   CONFIG.PS_USE_NOC_LPD_AXI0 {1} \
   CONFIG.PS_USE_NOC_PS_PCI_0 {0} \
   CONFIG.PS_USE_NOC_PS_PMC_0 {0} \
   CONFIG.PS_USE_NPI_CLK {0} \
   CONFIG.PS_USE_NPI_RST {0} \
   CONFIG.PS_USE_PL_FPD_AUX_REF_CLK {0} \
   CONFIG.PS_USE_PL_LPD_AUX_REF_CLK {0} \
   CONFIG.PS_USE_PMC {0} \
   CONFIG.PS_USE_PMCPL_CLK0 {1} \
   CONFIG.PS_USE_PMCPL_CLK1 {0} \
   CONFIG.PS_USE_PMCPL_CLK2 {0} \
   CONFIG.PS_USE_PMCPL_CLK3 {0} \
   CONFIG.PS_USE_PMCPL_IRO_CLK {0} \
   CONFIG.PS_USE_PSPL_IRQ_FPD {0} \
   CONFIG.PS_USE_PSPL_IRQ_LPD {0} \
   CONFIG.PS_USE_PSPL_IRQ_PMC {0} \
   CONFIG.PS_USE_PS_NOC_PCI_0 {0} \
   CONFIG.PS_USE_PS_NOC_PCI_1 {0} \
   CONFIG.PS_USE_PS_NOC_PMC_0 {0} \
   CONFIG.PS_USE_PS_NOC_PMC_1 {0} \
   CONFIG.PS_USE_RPU_EVENT {0} \
   CONFIG.PS_USE_RPU_INTERRUPT {0} \
   CONFIG.PS_USE_RTC {0} \
   CONFIG.PS_USE_SMMU {0} \
   CONFIG.PS_USE_STARTUP {0} \
   CONFIG.PS_USE_STM {0} \
   CONFIG.PS_USE_S_ACP_FPD {0} \
   CONFIG.PS_USE_S_AXI_ACE {0} \
   CONFIG.PS_USE_S_AXI_FPD {0} \
   CONFIG.PS_USE_S_AXI_GP2 {0} \
   CONFIG.PS_USE_S_AXI_LPD {0} \
   CONFIG.PS_USE_TRACE_ATB {0} \
   CONFIG.PS_WDT0_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PS_WDT0_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_WDT0_REF_CTRL_SEL {NONE} \
   CONFIG.PS_WDT1_REF_CTRL_ACT_FREQMHZ {100} \
   CONFIG.PS_WDT1_REF_CTRL_FREQMHZ {100} \
   CONFIG.PS_WDT1_REF_CTRL_SEL {NONE} \
   CONFIG.PS_WWDT0_CLK {{{ENABLE 0} {IO {PMC_MIO 0}}}} \
   CONFIG.PS_WWDT0_PERIPHERAL {{{ENABLE 0} {IO {PMC_MIO 0 .. 5}}}} \
   CONFIG.PS_WWDT1_CLK {{{ENABLE 0} {IO {PMC_MIO 6}}}} \
   CONFIG.PS_WWDT1_PERIPHERAL {{{ENABLE 0} {IO {PMC_MIO 6 .. 11}}}} \
   CONFIG.SEM_ERROR_HANDLE_OPTIONS {{Detect & Correct}} \
   CONFIG.SEM_EVENT_LOG_OPTIONS {{Log & Notify}} \
   CONFIG.SEM_MEM_BUILT_IN_SELF_TEST {0} \
   CONFIG.SEM_MEM_ENABLE_ALL_TEST_FEATURE {0} \
   CONFIG.SEM_MEM_ENABLE_SCAN_AFTER {0} \
   CONFIG.SEM_MEM_GOLDEN_ECC {0} \
   CONFIG.SEM_MEM_GOLDEN_ECC_SW {0} \
   CONFIG.SEM_MEM_SCAN {0} \
   CONFIG.SEM_NPI_BUILT_IN_SELF_TEST {0} \
   CONFIG.SEM_NPI_ENABLE_ALL_TEST_FEATURE {0} \
   CONFIG.SEM_NPI_ENABLE_SCAN_AFTER {0} \
   CONFIG.SEM_NPI_GOLDEN_CHECKSUM_SW {0} \
   CONFIG.SEM_NPI_SCAN {0} \
   CONFIG.SEM_TIME_INTERVAL_BETWEEN_SCANS {0} \
   CONFIG.SMON_ALARMS {Set_Alarms_On} \
   CONFIG.SMON_ENABLE_INT_VOLTAGE_MONITORING {0} \
   CONFIG.SMON_ENABLE_TEMP_AVERAGING {0} \
   CONFIG.SMON_INTERFACE_TO_USE {None} \
   CONFIG.SMON_INT_MEASUREMENT_ALARM_ENABLE {0} \
   CONFIG.SMON_INT_MEASUREMENT_AVG_ENABLE {0} \
   CONFIG.SMON_INT_MEASUREMENT_ENABLE {0} \
   CONFIG.SMON_INT_MEASUREMENT_MODE {0} \
   CONFIG.SMON_INT_MEASUREMENT_TH_HIGH {0} \
   CONFIG.SMON_INT_MEASUREMENT_TH_LOW {0} \
   CONFIG.SMON_MEAS0 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_103}}}\
   CONFIG.SMON_MEAS1 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_104}}}\
   CONFIG.SMON_MEAS2 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_105}}}\
   CONFIG.SMON_MEAS3 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_106}}}\
   CONFIG.SMON_MEAS4 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_200}}}\
   CONFIG.SMON_MEAS5 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_201}}}\
   CONFIG.SMON_MEAS6 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_202}}}\
   CONFIG.SMON_MEAS7 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_203}}}\
   CONFIG.SMON_MEAS8 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_204}}}\
   CONFIG.SMON_MEAS9 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_205}}}\
   CONFIG.SMON_MEAS10 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCCAUX_206}}}\
   CONFIG.SMON_MEAS11 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_103}}}\
   CONFIG.SMON_MEAS12 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_104}}}\
   CONFIG.SMON_MEAS13 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_105}}}\
   CONFIG.SMON_MEAS14 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_106}}}\
   CONFIG.SMON_MEAS15 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_200}}}\
   CONFIG.SMON_MEAS16 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_201}}}\
   CONFIG.SMON_MEAS17 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_202}}}\
   CONFIG.SMON_MEAS18 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_203}}}\
   CONFIG.SMON_MEAS19 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_204}}}\
   CONFIG.SMON_MEAS20 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_205}}}\
   CONFIG.SMON_MEAS21 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVCC_206}}}\
   CONFIG.SMON_MEAS22 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_103}}}\
   CONFIG.SMON_MEAS23 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_104}}}\
   CONFIG.SMON_MEAS24 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_105}}}\
   CONFIG.SMON_MEAS25 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_106}}}\
   CONFIG.SMON_MEAS26 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_200}}}\
   CONFIG.SMON_MEAS27 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_201}}}\
   CONFIG.SMON_MEAS28 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_202}}}\
   CONFIG.SMON_MEAS29 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_203}}}\
   CONFIG.SMON_MEAS30 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_204}}}\
   CONFIG.SMON_MEAS31 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_205}}}\
   CONFIG.SMON_MEAS32 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME GTY_AVTT_206}}}\
   CONFIG.SMON_MEAS33 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCAUX}}}\
   CONFIG.SMON_MEAS34 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCAUX_PMC}}}\
   CONFIG.SMON_MEAS35 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCAUX_SMON}}}\
   CONFIG.SMON_MEAS36 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCINT}}}\
   CONFIG.SMON_MEAS37 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {4 V unipolar}} {NAME VCCO_306}}}\
   CONFIG.SMON_MEAS38 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {4 V unipolar}} {NAME VCCO_406}}}\
   CONFIG.SMON_MEAS39 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {4 V unipolar}} {NAME VCCO_500}}}\
   CONFIG.SMON_MEAS40 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {4 V unipolar}} {NAME VCCO_501}}}\
   CONFIG.SMON_MEAS41 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {4 V unipolar}} {NAME VCCO_502}}}\
   CONFIG.SMON_MEAS42 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {4 V unipolar}} {NAME VCCO_503}}}\
   CONFIG.SMON_MEAS43 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_700}}}\
   CONFIG.SMON_MEAS44 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_701}}}\
   CONFIG.SMON_MEAS45 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_702}}}\
   CONFIG.SMON_MEAS46 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_703}}}\
   CONFIG.SMON_MEAS47 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_704}}}\
   CONFIG.SMON_MEAS48 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_705}}}\
   CONFIG.SMON_MEAS49 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_706}}}\
   CONFIG.SMON_MEAS50 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_707}}}\
   CONFIG.SMON_MEAS51 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_708}}}\
   CONFIG.SMON_MEAS52 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_709}}}\
   CONFIG.SMON_MEAS53 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_710}}}\
   CONFIG.SMON_MEAS54 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCCO_711}}}\
   CONFIG.SMON_MEAS55 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCC_BATT}}}\
   CONFIG.SMON_MEAS56 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCC_PMC}}}\
   CONFIG.SMON_MEAS57 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCC_PSFP}}}\
   CONFIG.SMON_MEAS58 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCC_PSLP}}}\
   CONFIG.SMON_MEAS59 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCC_RAM}}}\
   CONFIG.SMON_MEAS60 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VCC_SOC}}}\
   CONFIG.SMON_MEAS61 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE {2 V unipolar}} {NAME VP_VN}}}\
   CONFIG.SMON_MEAS62 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS63 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS64 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS65 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS66 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS67 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS68 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS69 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS70 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS71 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS72 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS73 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS74 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS75 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS76 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS77 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS78 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS79 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS80 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS81 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS82 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS83 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS84 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS85 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS86 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS87 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS88 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS89 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS90 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS91 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS92 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS93 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS94 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS95 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS96 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS97 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS98 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS99 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS100 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS101 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS102 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS103 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS104 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS105 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS106 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS107 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS108 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS109 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS110 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS111 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS112 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS113 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS114 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS115 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS116 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS117 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS118 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS119 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS120 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS121 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS122 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS123 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS124 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS125 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS126 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS127 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS128 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS129 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS130 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS131 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS132 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS133 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS134 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS135 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS136 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS137 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS138 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS139 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS140 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS141 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS142 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS143 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS144 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS145 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS146 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS147 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS148 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS149 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS150 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS151 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS152 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS153 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS154 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS155 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS156 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS157 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS158 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS159 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS160 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS161 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS162 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS163 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS164 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS165 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS166 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS167 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS168 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS169 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS170 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS171 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS172 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS173 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS174 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEAS175 {{{ALARM_ENABLE 0} {ALARM_LOWER 0.00} {ALARM_UPPER 2.00} {AVERAGE_EN 0} {ENABLE\
0} {MODE None} {NAME GT_AVAUX_PKG_103}}}\
   CONFIG.SMON_MEASUREMENT_COUNT {62} \
   CONFIG.SMON_MEASUREMENT_LIST {BANK_VOLTAGE:GTY_AVTT-GTY_AVTT_103,GTY_AVTT_104,GTY_AVTT_105,GTY_AVTT_106,GTY_AVTT_200,GTY_AVTT_201,GTY_AVTT_202,GTY_AVTT_203,GTY_AVTT_204,GTY_AVTT_205,GTY_AVTT_206#VCC-GTY_AVCC_103,GTY_AVCC_104,GTY_AVCC_105,GTY_AVCC_106,GTY_AVCC_200,GTY_AVCC_201,GTY_AVCC_202,GTY_AVCC_203,GTY_AVCC_204,GTY_AVCC_205,GTY_AVCC_206#VCCAUX-GTY_AVCCAUX_103,GTY_AVCCAUX_104,GTY_AVCCAUX_105,GTY_AVCCAUX_106,GTY_AVCCAUX_200,GTY_AVCCAUX_201,GTY_AVCCAUX_202,GTY_AVCCAUX_203,GTY_AVCCAUX_204,GTY_AVCCAUX_205,GTY_AVCCAUX_206#VCCO-VCCO_306,VCCO_406,VCCO_500,VCCO_501,VCCO_502,VCCO_503,VCCO_700,VCCO_701,VCCO_702,VCCO_703,VCCO_704,VCCO_705,VCCO_706,VCCO_707,VCCO_708,VCCO_709,VCCO_710,VCCO_711|DEDICATED_PAD:VP-VP_VN|SUPPLY_VOLTAGE:VCC-VCC_BATT,VCC_PMC,VCC_PSFP,VCC_PSLP,VCC_RAM,VCC_SOC#VCCAUX-VCCAUX,VCCAUX_PMC,VCCAUX_SMON#VCCINT-VCCINT}\
   CONFIG.SMON_OT {{{THRESHOLD_LOWER -55} {THRESHOLD_UPPER 125}}} \
   CONFIG.SMON_PMBUS_ADDRESS {0x0} \
   CONFIG.SMON_PMBUS_UNRESTRICTED {0} \
   CONFIG.SMON_REFERENCE_SOURCE {Internal} \
   CONFIG.SMON_TEMP_AVERAGING_SAMPLES {8} \
   CONFIG.SMON_TEMP_THRESHOLD {0} \
   CONFIG.SMON_USER_TEMP {{{THRESHOLD_LOWER 0} {THRESHOLD_UPPER 125} {USER_ALARM_TYPE window}}} \
   CONFIG.SMON_VAUX_CH0 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH0}}}\
   CONFIG.SMON_VAUX_CH1 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH1}}}\
   CONFIG.SMON_VAUX_CH2 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH2}}}\
   CONFIG.SMON_VAUX_CH3 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH3}}}\
   CONFIG.SMON_VAUX_CH4 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH4}}}\
   CONFIG.SMON_VAUX_CH5 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH5}}}\
   CONFIG.SMON_VAUX_CH6 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH6}}}\
   CONFIG.SMON_VAUX_CH7 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH7}}}\
   CONFIG.SMON_VAUX_CH8 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH8}}}\
   CONFIG.SMON_VAUX_CH9 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH9}}}\
   CONFIG.SMON_VAUX_CH10 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH10}}}\
   CONFIG.SMON_VAUX_CH11 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH11}}}\
   CONFIG.SMON_VAUX_CH12 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH12}}}\
   CONFIG.SMON_VAUX_CH13 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH13}}}\
   CONFIG.SMON_VAUX_CH14 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH14}}}\
   CONFIG.SMON_VAUX_CH15 {{{ALARM_ENABLE 0} {ALARM_LOWER 0} {ALARM_UPPER 0} {AVERAGE_EN 0} {ENABLE 0}\
{IO_N PMC_MIO1_500} {IO_P PMC_MIO0_500} {MODE {1 V unipolar}} {NAME VAUX_CH15}}}\
   CONFIG.SMON_VAUX_IO_BANK {MIO_BANK0} \
   CONFIG.SMON_VOLTAGE_AVERAGING_SAMPLES {None} \
   CONFIG.SPP_PSPMC_FROM_CORE_WIDTH {12000} \
   CONFIG.SPP_PSPMC_TO_CORE_WIDTH {12000} \
   CONFIG.SUBPRESET1 {Custom} \
   CONFIG.USE_UART0_IN_DEVICE_BOOT {0} \
   CONFIG.preset {None} \
 ] $pspmc_0

  # Create interface connections
  connect_bd_intf_net -intf_net pspmc_0_FPD_CCI_NOC_0 [get_bd_intf_ports FPD_CCI_NOC_0] [get_bd_intf_pins pspmc_0/FPD_CCI_NOC_0]
  connect_bd_intf_net -intf_net pspmc_0_FPD_CCI_NOC_1 [get_bd_intf_ports FPD_CCI_NOC_1] [get_bd_intf_pins pspmc_0/FPD_CCI_NOC_1]
  connect_bd_intf_net -intf_net pspmc_0_FPD_CCI_NOC_2 [get_bd_intf_ports FPD_CCI_NOC_2] [get_bd_intf_pins pspmc_0/FPD_CCI_NOC_2]
  connect_bd_intf_net -intf_net pspmc_0_FPD_CCI_NOC_3 [get_bd_intf_ports FPD_CCI_NOC_3] [get_bd_intf_pins pspmc_0/FPD_CCI_NOC_3]
  connect_bd_intf_net -intf_net pspmc_0_LPD_AXI_NOC_0 [get_bd_intf_ports LPD_AXI_NOC_0] [get_bd_intf_pins pspmc_0/LPD_AXI_NOC_0]
  connect_bd_intf_net -intf_net pspmc_0_PMC_NOC_AXI_0 [get_bd_intf_ports PMC_NOC_AXI_0] [get_bd_intf_pins pspmc_0/PMC_NOC_AXI_0]

  # Create port connections
  connect_bd_net -net pspmc_0_fpd_cci_noc_axi0_clk [get_bd_ports fpd_cci_noc_axi0_clk] [get_bd_pins pspmc_0/fpd_cci_noc_axi0_clk]
  connect_bd_net -net pspmc_0_fpd_cci_noc_axi1_clk [get_bd_ports fpd_cci_noc_axi1_clk] [get_bd_pins pspmc_0/fpd_cci_noc_axi1_clk]
  connect_bd_net -net pspmc_0_fpd_cci_noc_axi2_clk [get_bd_ports fpd_cci_noc_axi2_clk] [get_bd_pins pspmc_0/fpd_cci_noc_axi2_clk]
  connect_bd_net -net pspmc_0_fpd_cci_noc_axi3_clk [get_bd_ports fpd_cci_noc_axi3_clk] [get_bd_pins pspmc_0/fpd_cci_noc_axi3_clk]
  connect_bd_net -net pspmc_0_gem0_tsu_timer_cnt [get_bd_ports gem0_tsu_timer_cnt] [get_bd_pins pspmc_0/gem0_tsu_timer_cnt]
  connect_bd_net -net pspmc_0_lpd_axi_noc_clk [get_bd_ports lpd_axi_noc_clk] [get_bd_pins pspmc_0/lpd_axi_noc_clk]
  connect_bd_net -net pspmc_0_pl0_ref_clk [get_bd_ports pl0_ref_clk] [get_bd_pins pspmc_0/pl0_ref_clk]
  connect_bd_net -net pspmc_0_pl0_resetn [get_bd_ports pl0_resetn] [get_bd_pins pspmc_0/pl0_resetn]
  connect_bd_net -net pspmc_0_pmc_axi_noc_axi0_clk [get_bd_ports pmc_axi_noc_axi0_clk] [get_bd_pins pspmc_0/pmc_axi_noc_axi0_clk]

  # Create address segments
  assign_bd_address -offset 0xF9000000 -range 0x00070000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_acpu_gic/psv_acpu_gic] -force
  assign_bd_address -offset 0xF9000000 -range 0x00070000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_acpu_gic/psv_acpu_gic] -force
  assign_bd_address -offset 0xF9000000 -range 0x00070000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_acpu_gic/psv_acpu_gic] -force
  assign_bd_address -offset 0xF9000000 -range 0x00070000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_acpu_gic/psv_acpu_gic] -force
  assign_bd_address -offset 0xFFA80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_adma_0/psv_adma_0] -force
  assign_bd_address -offset 0xFFA80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_adma_0/psv_adma_0] -force
  assign_bd_address -offset 0xFFA80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_adma_0/psv_adma_0] -force
  assign_bd_address -offset 0xFFA80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_adma_0/psv_adma_0] -force
  assign_bd_address -offset 0xFFA80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_adma_0/psv_adma_0] -force
  assign_bd_address -offset 0xFFA80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_adma_0/psv_adma_0] -force
  assign_bd_address -offset 0xFFA80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_adma_0/psv_adma_0] -force
  assign_bd_address -offset 0xFFA90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_adma_1/psv_adma_1] -force
  assign_bd_address -offset 0xFFA90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_adma_1/psv_adma_1] -force
  assign_bd_address -offset 0xFFA90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_adma_1/psv_adma_1] -force
  assign_bd_address -offset 0xFFA90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_adma_1/psv_adma_1] -force
  assign_bd_address -offset 0xFFA90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_adma_1/psv_adma_1] -force
  assign_bd_address -offset 0xFFA90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_adma_1/psv_adma_1] -force
  assign_bd_address -offset 0xFFA90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_adma_1/psv_adma_1] -force
  assign_bd_address -offset 0xFFAA0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_adma_2/psv_adma_2] -force
  assign_bd_address -offset 0xFFAA0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_adma_2/psv_adma_2] -force
  assign_bd_address -offset 0xFFAA0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_adma_2/psv_adma_2] -force
  assign_bd_address -offset 0xFFAA0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_adma_2/psv_adma_2] -force
  assign_bd_address -offset 0xFFAA0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_adma_2/psv_adma_2] -force
  assign_bd_address -offset 0xFFAA0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_adma_2/psv_adma_2] -force
  assign_bd_address -offset 0xFFAA0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_adma_2/psv_adma_2] -force
  assign_bd_address -offset 0xFFAB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_adma_3/psv_adma_3] -force
  assign_bd_address -offset 0xFFAB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_adma_3/psv_adma_3] -force
  assign_bd_address -offset 0xFFAB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_adma_3/psv_adma_3] -force
  assign_bd_address -offset 0xFFAB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_adma_3/psv_adma_3] -force
  assign_bd_address -offset 0xFFAB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_adma_3/psv_adma_3] -force
  assign_bd_address -offset 0xFFAB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_adma_3/psv_adma_3] -force
  assign_bd_address -offset 0xFFAB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_adma_3/psv_adma_3] -force
  assign_bd_address -offset 0xFFAC0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_adma_4/psv_adma_4] -force
  assign_bd_address -offset 0xFFAC0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_adma_4/psv_adma_4] -force
  assign_bd_address -offset 0xFFAC0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_adma_4/psv_adma_4] -force
  assign_bd_address -offset 0xFFAC0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_adma_4/psv_adma_4] -force
  assign_bd_address -offset 0xFFAC0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_adma_4/psv_adma_4] -force
  assign_bd_address -offset 0xFFAC0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_adma_4/psv_adma_4] -force
  assign_bd_address -offset 0xFFAC0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_adma_4/psv_adma_4] -force
  assign_bd_address -offset 0xFFAD0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_adma_5/psv_adma_5] -force
  assign_bd_address -offset 0xFFAD0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_adma_5/psv_adma_5] -force
  assign_bd_address -offset 0xFFAD0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_adma_5/psv_adma_5] -force
  assign_bd_address -offset 0xFFAD0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_adma_5/psv_adma_5] -force
  assign_bd_address -offset 0xFFAD0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_adma_5/psv_adma_5] -force
  assign_bd_address -offset 0xFFAD0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_adma_5/psv_adma_5] -force
  assign_bd_address -offset 0xFFAD0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_adma_5/psv_adma_5] -force
  assign_bd_address -offset 0xFFAE0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_adma_6/psv_adma_6] -force
  assign_bd_address -offset 0xFFAE0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_adma_6/psv_adma_6] -force
  assign_bd_address -offset 0xFFAE0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_adma_6/psv_adma_6] -force
  assign_bd_address -offset 0xFFAE0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_adma_6/psv_adma_6] -force
  assign_bd_address -offset 0xFFAE0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_adma_6/psv_adma_6] -force
  assign_bd_address -offset 0xFFAE0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_adma_6/psv_adma_6] -force
  assign_bd_address -offset 0xFFAE0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_adma_6/psv_adma_6] -force
  assign_bd_address -offset 0xFFAF0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_adma_7/psv_adma_7] -force
  assign_bd_address -offset 0xFFAF0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_adma_7/psv_adma_7] -force
  assign_bd_address -offset 0xFFAF0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_adma_7/psv_adma_7] -force
  assign_bd_address -offset 0xFFAF0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_adma_7/psv_adma_7] -force
  assign_bd_address -offset 0xFFAF0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_adma_7/psv_adma_7] -force
  assign_bd_address -offset 0xFFAF0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_adma_7/psv_adma_7] -force
  assign_bd_address -offset 0xFFAF0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_adma_7/psv_adma_7] -force
  assign_bd_address -offset 0xFD5C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_apu_0/psv_apu_0] -force
  assign_bd_address -offset 0xFD5C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_apu_0/psv_apu_0] -force
  assign_bd_address -offset 0xFD5C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_apu_0/psv_apu_0] -force
  assign_bd_address -offset 0xFD5C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_apu_0/psv_apu_0] -force
  assign_bd_address -offset 0xFF070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_canfd_1/psv_canfd_1] -force
  assign_bd_address -offset 0xFF070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_canfd_1/psv_canfd_1] -force
  assign_bd_address -offset 0xFF070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_canfd_1/psv_canfd_1] -force
  assign_bd_address -offset 0xFF070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_canfd_1/psv_canfd_1] -force
  assign_bd_address -offset 0xFF070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_canfd_1/psv_canfd_1] -force
  assign_bd_address -offset 0xFF070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_canfd_1/psv_canfd_1] -force
  assign_bd_address -offset 0xFF070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_canfd_1/psv_canfd_1] -force
  assign_bd_address -offset 0xF0800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_coresight_0/psv_coresight_0] -force
  assign_bd_address -offset 0xF0800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_coresight_0/psv_coresight_0] -force
  assign_bd_address -offset 0xF0800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_coresight_0/psv_coresight_0] -force
  assign_bd_address -offset 0xF0800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_coresight_0/psv_coresight_0] -force
  assign_bd_address -offset 0xF0800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_coresight_0/psv_coresight_0] -force
  assign_bd_address -offset 0xF0800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_coresight_0/psv_coresight_0] -force
  assign_bd_address -offset 0xF0800000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_coresight_0/psv_coresight_0] -force
  assign_bd_address -offset 0xF0B80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_atm/psv_coresight_fpd_atm] -force
  assign_bd_address -offset 0xF0B80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_atm/psv_coresight_fpd_atm] -force
  assign_bd_address -offset 0xF0B80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_atm/psv_coresight_fpd_atm] -force
  assign_bd_address -offset 0xF0B80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_atm/psv_coresight_fpd_atm] -force
  assign_bd_address -offset 0xF0B80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_atm/psv_coresight_fpd_atm] -force
  assign_bd_address -offset 0xF0B80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_atm/psv_coresight_fpd_atm] -force
  assign_bd_address -offset 0xF0B80000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_atm/psv_coresight_fpd_atm] -force
  assign_bd_address -offset 0xF0B70000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_stm/psv_coresight_fpd_stm] -force
  assign_bd_address -offset 0xF0B70000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_stm/psv_coresight_fpd_stm] -force
  assign_bd_address -offset 0xF0B70000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_stm/psv_coresight_fpd_stm] -force
  assign_bd_address -offset 0xF0B70000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_stm/psv_coresight_fpd_stm] -force
  assign_bd_address -offset 0xF0B70000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_stm/psv_coresight_fpd_stm] -force
  assign_bd_address -offset 0xF0B70000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_stm/psv_coresight_fpd_stm] -force
  assign_bd_address -offset 0xF0B70000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_coresight_fpd_stm/psv_coresight_fpd_stm] -force
  assign_bd_address -offset 0xF0980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_coresight_lpd_atm/psv_coresight_lpd_atm] -force
  assign_bd_address -offset 0xF0980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_coresight_lpd_atm/psv_coresight_lpd_atm] -force
  assign_bd_address -offset 0xF0980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_coresight_lpd_atm/psv_coresight_lpd_atm] -force
  assign_bd_address -offset 0xF0980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_coresight_lpd_atm/psv_coresight_lpd_atm] -force
  assign_bd_address -offset 0xF0980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_coresight_lpd_atm/psv_coresight_lpd_atm] -force
  assign_bd_address -offset 0xF0980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_coresight_lpd_atm/psv_coresight_lpd_atm] -force
  assign_bd_address -offset 0xF0980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_coresight_lpd_atm/psv_coresight_lpd_atm] -force
  assign_bd_address -offset 0xFD1A0000 -range 0x00140000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_crf_0/psv_crf_0] -force
  assign_bd_address -offset 0xFD1A0000 -range 0x00140000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_crf_0/psv_crf_0] -force
  assign_bd_address -offset 0xFD1A0000 -range 0x00140000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_crf_0/psv_crf_0] -force
  assign_bd_address -offset 0xFD1A0000 -range 0x00140000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_crf_0/psv_crf_0] -force
  assign_bd_address -offset 0xFD1A0000 -range 0x00140000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_crf_0/psv_crf_0] -force
  assign_bd_address -offset 0xFD1A0000 -range 0x00140000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_crf_0/psv_crf_0] -force
  assign_bd_address -offset 0xFD1A0000 -range 0x00140000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_crf_0/psv_crf_0] -force
  assign_bd_address -offset 0xFF5E0000 -range 0x00300000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_crl_0/psv_crl_0] -force
  assign_bd_address -offset 0xFF5E0000 -range 0x00300000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_crl_0/psv_crl_0] -force
  assign_bd_address -offset 0xFF5E0000 -range 0x00300000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_crl_0/psv_crl_0] -force
  assign_bd_address -offset 0xFF5E0000 -range 0x00300000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_crl_0/psv_crl_0] -force
  assign_bd_address -offset 0xFF5E0000 -range 0x00300000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_crl_0/psv_crl_0] -force
  assign_bd_address -offset 0xFF5E0000 -range 0x00300000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_crl_0/psv_crl_0] -force
  assign_bd_address -offset 0xFF5E0000 -range 0x00300000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_crl_0/psv_crl_0] -force
  assign_bd_address -offset 0xF1260000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_crp_0/psv_crp_0] -force
  assign_bd_address -offset 0xF1260000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_crp_0/psv_crp_0] -force
  assign_bd_address -offset 0xF1260000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_crp_0/psv_crp_0] -force
  assign_bd_address -offset 0xF1260000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_crp_0/psv_crp_0] -force
  assign_bd_address -offset 0xF1260000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_crp_0/psv_crp_0] -force
  assign_bd_address -offset 0xF1260000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_crp_0/psv_crp_0] -force
  assign_bd_address -offset 0xF1260000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_crp_0/psv_crp_0] -force
  assign_bd_address -offset 0xFF0C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ethernet_0/psv_ethernet_0] -force
  assign_bd_address -offset 0xFF0C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ethernet_0/psv_ethernet_0] -force
  assign_bd_address -offset 0xFF0C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ethernet_0/psv_ethernet_0] -force
  assign_bd_address -offset 0xFF0C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ethernet_0/psv_ethernet_0] -force
  assign_bd_address -offset 0xFF0C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ethernet_0/psv_ethernet_0] -force
  assign_bd_address -offset 0xFF0C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ethernet_0/psv_ethernet_0] -force
  assign_bd_address -offset 0xFF0C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ethernet_0/psv_ethernet_0] -force
  assign_bd_address -offset 0xFF0D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ethernet_1/psv_ethernet_1] -force
  assign_bd_address -offset 0xFF0D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ethernet_1/psv_ethernet_1] -force
  assign_bd_address -offset 0xFF0D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ethernet_1/psv_ethernet_1] -force
  assign_bd_address -offset 0xFF0D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ethernet_1/psv_ethernet_1] -force
  assign_bd_address -offset 0xFF0D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ethernet_1/psv_ethernet_1] -force
  assign_bd_address -offset 0xFF0D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ethernet_1/psv_ethernet_1] -force
  assign_bd_address -offset 0xFF0D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ethernet_1/psv_ethernet_1] -force
  assign_bd_address -offset 0xFD360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_fpd_afi_0/psv_fpd_afi_0] -force
  assign_bd_address -offset 0xFD360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_fpd_afi_0/psv_fpd_afi_0] -force
  assign_bd_address -offset 0xFD360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_fpd_afi_0/psv_fpd_afi_0] -force
  assign_bd_address -offset 0xFD360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_fpd_afi_0/psv_fpd_afi_0] -force
  assign_bd_address -offset 0xFD360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_fpd_afi_0/psv_fpd_afi_0] -force
  assign_bd_address -offset 0xFD360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_fpd_afi_0/psv_fpd_afi_0] -force
  assign_bd_address -offset 0xFD360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_fpd_afi_0/psv_fpd_afi_0] -force
  assign_bd_address -offset 0xFD380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_fpd_afi_2/psv_fpd_afi_2] -force
  assign_bd_address -offset 0xFD380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_fpd_afi_2/psv_fpd_afi_2] -force
  assign_bd_address -offset 0xFD380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_fpd_afi_2/psv_fpd_afi_2] -force
  assign_bd_address -offset 0xFD380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_fpd_afi_2/psv_fpd_afi_2] -force
  assign_bd_address -offset 0xFD380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_fpd_afi_2/psv_fpd_afi_2] -force
  assign_bd_address -offset 0xFD380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_fpd_afi_2/psv_fpd_afi_2] -force
  assign_bd_address -offset 0xFD380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_fpd_afi_2/psv_fpd_afi_2] -force
  assign_bd_address -offset 0xFD5E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_fpd_cci_0/psv_fpd_cci_0] -force
  assign_bd_address -offset 0xFD5E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_fpd_cci_0/psv_fpd_cci_0] -force
  assign_bd_address -offset 0xFD5E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_fpd_cci_0/psv_fpd_cci_0] -force
  assign_bd_address -offset 0xFD5E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_fpd_cci_0/psv_fpd_cci_0] -force
  assign_bd_address -offset 0xFD5E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_fpd_cci_0/psv_fpd_cci_0] -force
  assign_bd_address -offset 0xFD5E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_fpd_cci_0/psv_fpd_cci_0] -force
  assign_bd_address -offset 0xFD5E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_fpd_cci_0/psv_fpd_cci_0] -force
  assign_bd_address -offset 0xFD700000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_fpd_gpv_0/psv_fpd_gpv_0] -force
  assign_bd_address -offset 0xFD700000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_fpd_gpv_0/psv_fpd_gpv_0] -force
  assign_bd_address -offset 0xFD700000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_fpd_gpv_0/psv_fpd_gpv_0] -force
  assign_bd_address -offset 0xFD700000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_fpd_gpv_0/psv_fpd_gpv_0] -force
  assign_bd_address -offset 0xFD700000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_fpd_gpv_0/psv_fpd_gpv_0] -force
  assign_bd_address -offset 0xFD700000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_fpd_gpv_0/psv_fpd_gpv_0] -force
  assign_bd_address -offset 0xFD700000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_fpd_gpv_0/psv_fpd_gpv_0] -force
  assign_bd_address -offset 0xFD000000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_fpd_maincci_0/psv_fpd_maincci_0] -force
  assign_bd_address -offset 0xFD000000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_fpd_maincci_0/psv_fpd_maincci_0] -force
  assign_bd_address -offset 0xFD000000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_fpd_maincci_0/psv_fpd_maincci_0] -force
  assign_bd_address -offset 0xFD000000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_fpd_maincci_0/psv_fpd_maincci_0] -force
  assign_bd_address -offset 0xFD000000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_fpd_maincci_0/psv_fpd_maincci_0] -force
  assign_bd_address -offset 0xFD000000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_fpd_maincci_0/psv_fpd_maincci_0] -force
  assign_bd_address -offset 0xFD000000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_fpd_maincci_0/psv_fpd_maincci_0] -force
  assign_bd_address -offset 0xFD390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_fpd_slave_xmpu_0/psv_fpd_slave_xmpu_0] -force
  assign_bd_address -offset 0xFD390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_fpd_slave_xmpu_0/psv_fpd_slave_xmpu_0] -force
  assign_bd_address -offset 0xFD390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_fpd_slave_xmpu_0/psv_fpd_slave_xmpu_0] -force
  assign_bd_address -offset 0xFD390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_fpd_slave_xmpu_0/psv_fpd_slave_xmpu_0] -force
  assign_bd_address -offset 0xFD390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_fpd_slave_xmpu_0/psv_fpd_slave_xmpu_0] -force
  assign_bd_address -offset 0xFD390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_fpd_slave_xmpu_0/psv_fpd_slave_xmpu_0] -force
  assign_bd_address -offset 0xFD390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_fpd_slave_xmpu_0/psv_fpd_slave_xmpu_0] -force
  assign_bd_address -offset 0xFD610000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_0/psv_fpd_slcr_0] -force
  assign_bd_address -offset 0xFD610000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_0/psv_fpd_slcr_0] -force
  assign_bd_address -offset 0xFD610000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_0/psv_fpd_slcr_0] -force
  assign_bd_address -offset 0xFD610000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_0/psv_fpd_slcr_0] -force
  assign_bd_address -offset 0xFD610000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_0/psv_fpd_slcr_0] -force
  assign_bd_address -offset 0xFD610000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_0/psv_fpd_slcr_0] -force
  assign_bd_address -offset 0xFD610000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_0/psv_fpd_slcr_0] -force
  assign_bd_address -offset 0xFD690000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_secure_0/psv_fpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFD690000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_secure_0/psv_fpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFD690000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_secure_0/psv_fpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFD690000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_secure_0/psv_fpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFD690000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_secure_0/psv_fpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFD690000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_secure_0/psv_fpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFD690000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_fpd_slcr_secure_0/psv_fpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFD5F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_fpd_smmu_0/psv_fpd_smmu_0] -force
  assign_bd_address -offset 0xFD5F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_fpd_smmu_0/psv_fpd_smmu_0] -force
  assign_bd_address -offset 0xFD5F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_fpd_smmu_0/psv_fpd_smmu_0] -force
  assign_bd_address -offset 0xFD5F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_fpd_smmu_0/psv_fpd_smmu_0] -force
  assign_bd_address -offset 0xFD5F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_fpd_smmu_0/psv_fpd_smmu_0] -force
  assign_bd_address -offset 0xFD5F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_fpd_smmu_0/psv_fpd_smmu_0] -force
  assign_bd_address -offset 0xFD5F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_fpd_smmu_0/psv_fpd_smmu_0] -force
  assign_bd_address -offset 0xFD800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_fpd_smmutcu_0/psv_fpd_smmutcu_0] -force
  assign_bd_address -offset 0xFD800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_fpd_smmutcu_0/psv_fpd_smmutcu_0] -force
  assign_bd_address -offset 0xFD800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_fpd_smmutcu_0/psv_fpd_smmutcu_0] -force
  assign_bd_address -offset 0xFD800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_fpd_smmutcu_0/psv_fpd_smmutcu_0] -force
  assign_bd_address -offset 0xFD800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_fpd_smmutcu_0/psv_fpd_smmutcu_0] -force
  assign_bd_address -offset 0xFD800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_fpd_smmutcu_0/psv_fpd_smmutcu_0] -force
  assign_bd_address -offset 0xFD800000 -range 0x00800000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_fpd_smmutcu_0/psv_fpd_smmutcu_0] -force
  assign_bd_address -offset 0xFF030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_i2c_1/psv_i2c_1] -force
  assign_bd_address -offset 0xFF030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_i2c_1/psv_i2c_1] -force
  assign_bd_address -offset 0xFF030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_i2c_1/psv_i2c_1] -force
  assign_bd_address -offset 0xFF030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_i2c_1/psv_i2c_1] -force
  assign_bd_address -offset 0xFF030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_i2c_1/psv_i2c_1] -force
  assign_bd_address -offset 0xFF030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_i2c_1/psv_i2c_1] -force
  assign_bd_address -offset 0xFF030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_i2c_1/psv_i2c_1] -force
  assign_bd_address -offset 0xFF330000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ipi_0/psv_ipi_0] -force
  assign_bd_address -offset 0xFF330000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ipi_0/psv_ipi_0] -force
  assign_bd_address -offset 0xFF330000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ipi_0/psv_ipi_0] -force
  assign_bd_address -offset 0xFF330000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ipi_0/psv_ipi_0] -force
  assign_bd_address -offset 0xFF330000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ipi_0/psv_ipi_0] -force
  assign_bd_address -offset 0xFF330000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ipi_0/psv_ipi_0] -force
  assign_bd_address -offset 0xFF330000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ipi_0/psv_ipi_0] -force
  assign_bd_address -offset 0xFF340000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ipi_1/psv_ipi_1] -force
  assign_bd_address -offset 0xFF340000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ipi_1/psv_ipi_1] -force
  assign_bd_address -offset 0xFF340000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ipi_1/psv_ipi_1] -force
  assign_bd_address -offset 0xFF340000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ipi_1/psv_ipi_1] -force
  assign_bd_address -offset 0xFF340000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ipi_1/psv_ipi_1] -force
  assign_bd_address -offset 0xFF340000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ipi_1/psv_ipi_1] -force
  assign_bd_address -offset 0xFF340000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ipi_1/psv_ipi_1] -force
  assign_bd_address -offset 0xFF350000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ipi_2/psv_ipi_2] -force
  assign_bd_address -offset 0xFF350000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ipi_2/psv_ipi_2] -force
  assign_bd_address -offset 0xFF350000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ipi_2/psv_ipi_2] -force
  assign_bd_address -offset 0xFF350000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ipi_2/psv_ipi_2] -force
  assign_bd_address -offset 0xFF350000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ipi_2/psv_ipi_2] -force
  assign_bd_address -offset 0xFF350000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ipi_2/psv_ipi_2] -force
  assign_bd_address -offset 0xFF350000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ipi_2/psv_ipi_2] -force
  assign_bd_address -offset 0xFF360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ipi_3/psv_ipi_3] -force
  assign_bd_address -offset 0xFF360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ipi_3/psv_ipi_3] -force
  assign_bd_address -offset 0xFF360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ipi_3/psv_ipi_3] -force
  assign_bd_address -offset 0xFF360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ipi_3/psv_ipi_3] -force
  assign_bd_address -offset 0xFF360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ipi_3/psv_ipi_3] -force
  assign_bd_address -offset 0xFF360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ipi_3/psv_ipi_3] -force
  assign_bd_address -offset 0xFF360000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ipi_3/psv_ipi_3] -force
  assign_bd_address -offset 0xFF370000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ipi_4/psv_ipi_4] -force
  assign_bd_address -offset 0xFF370000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ipi_4/psv_ipi_4] -force
  assign_bd_address -offset 0xFF370000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ipi_4/psv_ipi_4] -force
  assign_bd_address -offset 0xFF370000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ipi_4/psv_ipi_4] -force
  assign_bd_address -offset 0xFF370000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ipi_4/psv_ipi_4] -force
  assign_bd_address -offset 0xFF370000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ipi_4/psv_ipi_4] -force
  assign_bd_address -offset 0xFF370000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ipi_4/psv_ipi_4] -force
  assign_bd_address -offset 0xFF380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ipi_5/psv_ipi_5] -force
  assign_bd_address -offset 0xFF380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ipi_5/psv_ipi_5] -force
  assign_bd_address -offset 0xFF380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ipi_5/psv_ipi_5] -force
  assign_bd_address -offset 0xFF380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ipi_5/psv_ipi_5] -force
  assign_bd_address -offset 0xFF380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ipi_5/psv_ipi_5] -force
  assign_bd_address -offset 0xFF380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ipi_5/psv_ipi_5] -force
  assign_bd_address -offset 0xFF380000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ipi_5/psv_ipi_5] -force
  assign_bd_address -offset 0xFF3A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ipi_6/psv_ipi_6] -force
  assign_bd_address -offset 0xFF3A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ipi_6/psv_ipi_6] -force
  assign_bd_address -offset 0xFF3A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ipi_6/psv_ipi_6] -force
  assign_bd_address -offset 0xFF3A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ipi_6/psv_ipi_6] -force
  assign_bd_address -offset 0xFF3A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ipi_6/psv_ipi_6] -force
  assign_bd_address -offset 0xFF3A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ipi_6/psv_ipi_6] -force
  assign_bd_address -offset 0xFF3A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ipi_6/psv_ipi_6] -force
  assign_bd_address -offset 0xFF390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ipi_pmc_nobuf/psv_ipi_pmc_nobuf] -force
  assign_bd_address -offset 0xFF390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ipi_pmc_nobuf/psv_ipi_pmc_nobuf] -force
  assign_bd_address -offset 0xFF390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ipi_pmc_nobuf/psv_ipi_pmc_nobuf] -force
  assign_bd_address -offset 0xFF390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ipi_pmc_nobuf/psv_ipi_pmc_nobuf] -force
  assign_bd_address -offset 0xFF390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ipi_pmc_nobuf/psv_ipi_pmc_nobuf] -force
  assign_bd_address -offset 0xFF390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ipi_pmc_nobuf/psv_ipi_pmc_nobuf] -force
  assign_bd_address -offset 0xFF390000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ipi_pmc_nobuf/psv_ipi_pmc_nobuf] -force
  assign_bd_address -offset 0xFF320000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ipi_pmc/psv_ipi_pmc] -force
  assign_bd_address -offset 0xFF320000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ipi_pmc/psv_ipi_pmc] -force
  assign_bd_address -offset 0xFF320000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ipi_pmc/psv_ipi_pmc] -force
  assign_bd_address -offset 0xFF320000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ipi_pmc/psv_ipi_pmc] -force
  assign_bd_address -offset 0xFF320000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ipi_pmc/psv_ipi_pmc] -force
  assign_bd_address -offset 0xFF320000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ipi_pmc/psv_ipi_pmc] -force
  assign_bd_address -offset 0xFF320000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ipi_pmc/psv_ipi_pmc] -force
  assign_bd_address -offset 0xFF310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ipi_psm/psv_ipi_psm] -force
  assign_bd_address -offset 0xFF310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ipi_psm/psv_ipi_psm] -force
  assign_bd_address -offset 0xFF310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ipi_psm/psv_ipi_psm] -force
  assign_bd_address -offset 0xFF310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ipi_psm/psv_ipi_psm] -force
  assign_bd_address -offset 0xFF310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ipi_psm/psv_ipi_psm] -force
  assign_bd_address -offset 0xFF310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ipi_psm/psv_ipi_psm] -force
  assign_bd_address -offset 0xFF310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ipi_psm/psv_ipi_psm] -force
  assign_bd_address -offset 0xFF9B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_lpd_afi_0/psv_lpd_afi_0] -force
  assign_bd_address -offset 0xFF9B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_lpd_afi_0/psv_lpd_afi_0] -force
  assign_bd_address -offset 0xFF9B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_lpd_afi_0/psv_lpd_afi_0] -force
  assign_bd_address -offset 0xFF9B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_lpd_afi_0/psv_lpd_afi_0] -force
  assign_bd_address -offset 0xFF9B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_lpd_afi_0/psv_lpd_afi_0] -force
  assign_bd_address -offset 0xFF9B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_lpd_afi_0/psv_lpd_afi_0] -force
  assign_bd_address -offset 0xFF9B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_lpd_afi_0/psv_lpd_afi_0] -force
  assign_bd_address -offset 0xFF0A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_lpd_iou_secure_slcr_0/psv_lpd_iou_secure_slcr_0] -force
  assign_bd_address -offset 0xFF0A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_lpd_iou_secure_slcr_0/psv_lpd_iou_secure_slcr_0] -force
  assign_bd_address -offset 0xFF0A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_lpd_iou_secure_slcr_0/psv_lpd_iou_secure_slcr_0] -force
  assign_bd_address -offset 0xFF0A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_lpd_iou_secure_slcr_0/psv_lpd_iou_secure_slcr_0] -force
  assign_bd_address -offset 0xFF0A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_lpd_iou_secure_slcr_0/psv_lpd_iou_secure_slcr_0] -force
  assign_bd_address -offset 0xFF0A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_lpd_iou_secure_slcr_0/psv_lpd_iou_secure_slcr_0] -force
  assign_bd_address -offset 0xFF0A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_lpd_iou_secure_slcr_0/psv_lpd_iou_secure_slcr_0] -force
  assign_bd_address -offset 0xFF080000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_lpd_iou_slcr_0/psv_lpd_iou_slcr_0] -force
  assign_bd_address -offset 0xFF080000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_lpd_iou_slcr_0/psv_lpd_iou_slcr_0] -force
  assign_bd_address -offset 0xFF080000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_lpd_iou_slcr_0/psv_lpd_iou_slcr_0] -force
  assign_bd_address -offset 0xFF080000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_lpd_iou_slcr_0/psv_lpd_iou_slcr_0] -force
  assign_bd_address -offset 0xFF080000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_lpd_iou_slcr_0/psv_lpd_iou_slcr_0] -force
  assign_bd_address -offset 0xFF080000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_lpd_iou_slcr_0/psv_lpd_iou_slcr_0] -force
  assign_bd_address -offset 0xFF080000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_lpd_iou_slcr_0/psv_lpd_iou_slcr_0] -force
  assign_bd_address -offset 0xFF410000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_0/psv_lpd_slcr_0] -force
  assign_bd_address -offset 0xFF410000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_0/psv_lpd_slcr_0] -force
  assign_bd_address -offset 0xFF410000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_0/psv_lpd_slcr_0] -force
  assign_bd_address -offset 0xFF410000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_0/psv_lpd_slcr_0] -force
  assign_bd_address -offset 0xFF410000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_0/psv_lpd_slcr_0] -force
  assign_bd_address -offset 0xFF410000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_0/psv_lpd_slcr_0] -force
  assign_bd_address -offset 0xFF410000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_0/psv_lpd_slcr_0] -force
  assign_bd_address -offset 0xFF510000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_secure_0/psv_lpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFF510000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_secure_0/psv_lpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFF510000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_secure_0/psv_lpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFF510000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_secure_0/psv_lpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFF510000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_secure_0/psv_lpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFF510000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_secure_0/psv_lpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFF510000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_lpd_slcr_secure_0/psv_lpd_slcr_secure_0] -force
  assign_bd_address -offset 0xFF990000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_lpd_xppu_0/psv_lpd_xppu_0] -force
  assign_bd_address -offset 0xFF990000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_lpd_xppu_0/psv_lpd_xppu_0] -force
  assign_bd_address -offset 0xFF990000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_lpd_xppu_0/psv_lpd_xppu_0] -force
  assign_bd_address -offset 0xFF990000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_lpd_xppu_0/psv_lpd_xppu_0] -force
  assign_bd_address -offset 0xFF990000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_lpd_xppu_0/psv_lpd_xppu_0] -force
  assign_bd_address -offset 0xFF990000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_lpd_xppu_0/psv_lpd_xppu_0] -force
  assign_bd_address -offset 0xFF990000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_lpd_xppu_0/psv_lpd_xppu_0] -force
  assign_bd_address -offset 0xFF960000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ocm_ctrl/psv_ocm_ctrl] -force
  assign_bd_address -offset 0xFF960000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ocm_ctrl/psv_ocm_ctrl] -force
  assign_bd_address -offset 0xFF960000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ocm_ctrl/psv_ocm_ctrl] -force
  assign_bd_address -offset 0xFF960000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ocm_ctrl/psv_ocm_ctrl] -force
  assign_bd_address -offset 0xFF960000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ocm_ctrl/psv_ocm_ctrl] -force
  assign_bd_address -offset 0xFF960000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ocm_ctrl/psv_ocm_ctrl] -force
  assign_bd_address -offset 0xFF960000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ocm_ctrl/psv_ocm_ctrl] -force
  assign_bd_address -offset 0xFFFC0000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ocm_ram_0/psv_ocm_ram_0] -force
  assign_bd_address -offset 0xFFFC0000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ocm_ram_0/psv_ocm_ram_0] -force
  assign_bd_address -offset 0xFFFC0000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ocm_ram_0/psv_ocm_ram_0] -force
  assign_bd_address -offset 0xFFFC0000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ocm_ram_0/psv_ocm_ram_0] -force
  assign_bd_address -offset 0xFFFC0000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ocm_ram_0/psv_ocm_ram_0] -force
  assign_bd_address -offset 0xFFFC0000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ocm_ram_0/psv_ocm_ram_0] -force
  assign_bd_address -offset 0xFFFC0000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ocm_ram_0/psv_ocm_ram_0] -force
  assign_bd_address -offset 0xFF980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_ocm_xmpu_0/psv_ocm_xmpu_0] -force
  assign_bd_address -offset 0xFF980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_ocm_xmpu_0/psv_ocm_xmpu_0] -force
  assign_bd_address -offset 0xFF980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_ocm_xmpu_0/psv_ocm_xmpu_0] -force
  assign_bd_address -offset 0xFF980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_ocm_xmpu_0/psv_ocm_xmpu_0] -force
  assign_bd_address -offset 0xFF980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_ocm_xmpu_0/psv_ocm_xmpu_0] -force
  assign_bd_address -offset 0xFF980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_ocm_xmpu_0/psv_ocm_xmpu_0] -force
  assign_bd_address -offset 0xFF980000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_ocm_xmpu_0/psv_ocm_xmpu_0] -force
  assign_bd_address -offset 0xF11E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_aes/psv_pmc_aes] -force
  assign_bd_address -offset 0xF11E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_aes/psv_pmc_aes] -force
  assign_bd_address -offset 0xF11E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_aes/psv_pmc_aes] -force
  assign_bd_address -offset 0xF11E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_aes/psv_pmc_aes] -force
  assign_bd_address -offset 0xF11E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_aes/psv_pmc_aes] -force
  assign_bd_address -offset 0xF11E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_aes/psv_pmc_aes] -force
  assign_bd_address -offset 0xF11E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_aes/psv_pmc_aes] -force
  assign_bd_address -offset 0xF11F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_bbram_ctrl/psv_pmc_bbram_ctrl] -force
  assign_bd_address -offset 0xF11F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_bbram_ctrl/psv_pmc_bbram_ctrl] -force
  assign_bd_address -offset 0xF11F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_bbram_ctrl/psv_pmc_bbram_ctrl] -force
  assign_bd_address -offset 0xF11F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_bbram_ctrl/psv_pmc_bbram_ctrl] -force
  assign_bd_address -offset 0xF11F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_bbram_ctrl/psv_pmc_bbram_ctrl] -force
  assign_bd_address -offset 0xF11F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_bbram_ctrl/psv_pmc_bbram_ctrl] -force
  assign_bd_address -offset 0xF11F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_bbram_ctrl/psv_pmc_bbram_ctrl] -force
  assign_bd_address -offset 0xF12D0000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_cfi_cframe_0/psv_pmc_cfi_cframe_0] -force
  assign_bd_address -offset 0xF12D0000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_cfi_cframe_0/psv_pmc_cfi_cframe_0] -force
  assign_bd_address -offset 0xF12D0000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_cfi_cframe_0/psv_pmc_cfi_cframe_0] -force
  assign_bd_address -offset 0xF12D0000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_cfi_cframe_0/psv_pmc_cfi_cframe_0] -force
  assign_bd_address -offset 0xF12D0000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_cfi_cframe_0/psv_pmc_cfi_cframe_0] -force
  assign_bd_address -offset 0xF12D0000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_cfi_cframe_0/psv_pmc_cfi_cframe_0] -force
  assign_bd_address -offset 0xF12D0000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_cfi_cframe_0/psv_pmc_cfi_cframe_0] -force
  assign_bd_address -offset 0xF12B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_cfu_apb_0/psv_pmc_cfu_apb_0] -force
  assign_bd_address -offset 0xF12B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_cfu_apb_0/psv_pmc_cfu_apb_0] -force
  assign_bd_address -offset 0xF12B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_cfu_apb_0/psv_pmc_cfu_apb_0] -force
  assign_bd_address -offset 0xF12B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_cfu_apb_0/psv_pmc_cfu_apb_0] -force
  assign_bd_address -offset 0xF12B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_cfu_apb_0/psv_pmc_cfu_apb_0] -force
  assign_bd_address -offset 0xF12B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_cfu_apb_0/psv_pmc_cfu_apb_0] -force
  assign_bd_address -offset 0xF12B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_cfu_apb_0/psv_pmc_cfu_apb_0] -force
  assign_bd_address -offset 0xF11C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_dma_0/psv_pmc_dma_0] -force
  assign_bd_address -offset 0xF11C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_dma_0/psv_pmc_dma_0] -force
  assign_bd_address -offset 0xF11C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_dma_0/psv_pmc_dma_0] -force
  assign_bd_address -offset 0xF11C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_dma_0/psv_pmc_dma_0] -force
  assign_bd_address -offset 0xF11C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_dma_0/psv_pmc_dma_0] -force
  assign_bd_address -offset 0xF11C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_dma_0/psv_pmc_dma_0] -force
  assign_bd_address -offset 0xF11C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_dma_0/psv_pmc_dma_0] -force
  assign_bd_address -offset 0xF11D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_dma_1/psv_pmc_dma_1] -force
  assign_bd_address -offset 0xF11D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_dma_1/psv_pmc_dma_1] -force
  assign_bd_address -offset 0xF11D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_dma_1/psv_pmc_dma_1] -force
  assign_bd_address -offset 0xF11D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_dma_1/psv_pmc_dma_1] -force
  assign_bd_address -offset 0xF11D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_dma_1/psv_pmc_dma_1] -force
  assign_bd_address -offset 0xF11D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_dma_1/psv_pmc_dma_1] -force
  assign_bd_address -offset 0xF11D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_dma_1/psv_pmc_dma_1] -force
  assign_bd_address -offset 0xF1240000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_efuse_ctrl/psv_pmc_efuse_ctrl] -force
  assign_bd_address -offset 0xF1240000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_efuse_ctrl/psv_pmc_efuse_ctrl] -force
  assign_bd_address -offset 0xF1240000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_efuse_ctrl/psv_pmc_efuse_ctrl] -force
  assign_bd_address -offset 0xF1240000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_efuse_ctrl/psv_pmc_efuse_ctrl] -force
  assign_bd_address -offset 0xF1240000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_efuse_ctrl/psv_pmc_efuse_ctrl] -force
  assign_bd_address -offset 0xF1240000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_efuse_ctrl/psv_pmc_efuse_ctrl] -force
  assign_bd_address -offset 0xF1240000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_efuse_ctrl/psv_pmc_efuse_ctrl] -force
  assign_bd_address -offset 0xF1110000 -range 0x00050000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_global_0/psv_pmc_global_0] -force
  assign_bd_address -offset 0xF1110000 -range 0x00050000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_global_0/psv_pmc_global_0] -force
  assign_bd_address -offset 0xF1110000 -range 0x00050000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_global_0/psv_pmc_global_0] -force
  assign_bd_address -offset 0xF1110000 -range 0x00050000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_global_0/psv_pmc_global_0] -force
  assign_bd_address -offset 0xF1110000 -range 0x00050000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_global_0/psv_pmc_global_0] -force
  assign_bd_address -offset 0xF1110000 -range 0x00050000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_global_0/psv_pmc_global_0] -force
  assign_bd_address -offset 0xF1110000 -range 0x00050000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_global_0/psv_pmc_global_0] -force
  assign_bd_address -offset 0xF1020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_gpio_0/psv_pmc_gpio_0] -force
  assign_bd_address -offset 0xF1020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_gpio_0/psv_pmc_gpio_0] -force
  assign_bd_address -offset 0xF1020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_gpio_0/psv_pmc_gpio_0] -force
  assign_bd_address -offset 0xF1020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_gpio_0/psv_pmc_gpio_0] -force
  assign_bd_address -offset 0xF1020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_gpio_0/psv_pmc_gpio_0] -force
  assign_bd_address -offset 0xF1020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_gpio_0/psv_pmc_gpio_0] -force
  assign_bd_address -offset 0xF1020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_gpio_0/psv_pmc_gpio_0] -force
  assign_bd_address -offset 0xF1000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_i2c_0/psv_pmc_i2c_0] -force
  assign_bd_address -offset 0xF1000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_i2c_0/psv_pmc_i2c_0] -force
  assign_bd_address -offset 0xF1000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_i2c_0/psv_pmc_i2c_0] -force
  assign_bd_address -offset 0xF1000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_i2c_0/psv_pmc_i2c_0] -force
  assign_bd_address -offset 0xF1000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_i2c_0/psv_pmc_i2c_0] -force
  assign_bd_address -offset 0xF1000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_i2c_0/psv_pmc_i2c_0] -force
  assign_bd_address -offset 0xF1000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_i2c_0/psv_pmc_i2c_0] -force
  assign_bd_address -offset 0xF0280000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_iomodule_0/psv_pmc_iomodule_0] -force
  assign_bd_address -offset 0xF0280000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_iomodule_0/psv_pmc_iomodule_0] -force
  assign_bd_address -offset 0xF0310000 -range 0x00008000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_ppu1_mdm_0/psv_pmc_ppu1_mdm_0] -force
  assign_bd_address -offset 0xF0310000 -range 0x00008000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_ppu1_mdm_0/psv_pmc_ppu1_mdm_0] -force
  assign_bd_address -offset 0xF0310000 -range 0x00008000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_ppu1_mdm_0/psv_pmc_ppu1_mdm_0] -force
  assign_bd_address -offset 0xF0310000 -range 0x00008000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_ppu1_mdm_0/psv_pmc_ppu1_mdm_0] -force
  assign_bd_address -offset 0xF0310000 -range 0x00008000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_ppu1_mdm_0/psv_pmc_ppu1_mdm_0] -force
  assign_bd_address -offset 0xF0310000 -range 0x00008000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_ppu1_mdm_0/psv_pmc_ppu1_mdm_0] -force
  assign_bd_address -offset 0xF0310000 -range 0x00008000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_ppu1_mdm_0/psv_pmc_ppu1_mdm_0] -force
  assign_bd_address -offset 0xF1030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_0/psv_pmc_qspi_0] -force
  assign_bd_address -offset 0xF1030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_0/psv_pmc_qspi_0] -force
  assign_bd_address -offset 0xF1030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_0/psv_pmc_qspi_0] -force
  assign_bd_address -offset 0xF1030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_0/psv_pmc_qspi_0] -force
  assign_bd_address -offset 0xF1030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_0/psv_pmc_qspi_0] -force
  assign_bd_address -offset 0xF1030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_0/psv_pmc_qspi_0] -force
  assign_bd_address -offset 0xF1030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_0/psv_pmc_qspi_0] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_ospi_flash_0/psv_pmc_qspi_ospi_flash_0] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_ospi_flash_0/psv_pmc_qspi_ospi_flash_0] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_ospi_flash_0/psv_pmc_qspi_ospi_flash_0] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_ospi_flash_0/psv_pmc_qspi_ospi_flash_0] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_ospi_flash_0/psv_pmc_qspi_ospi_flash_0] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_ospi_flash_0/psv_pmc_qspi_ospi_flash_0] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_qspi_ospi_flash_0/psv_pmc_qspi_ospi_flash_0] -force
  assign_bd_address -offset 0xF0240000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram_data_cntlr/psv_pmc_ram_data_cntlr] -force
  assign_bd_address -offset 0xF0240000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram_data_cntlr/psv_pmc_ram_data_cntlr] -force
  assign_bd_address -offset 0xF0200000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram_instr_cntlr/psv_pmc_ram_instr_cntlr] -force
  assign_bd_address -offset 0xF0200000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram_instr_cntlr/psv_pmc_ram_instr_cntlr] -force
  assign_bd_address -offset 0xF6000000 -range 0x02000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_ram_npi/psv_pmc_ram_npi] -force
  assign_bd_address -offset 0xF6000000 -range 0x02000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram_npi/psv_pmc_ram_npi] -force
  assign_bd_address -offset 0xF6000000 -range 0x02000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram_npi/psv_pmc_ram_npi] -force
  assign_bd_address -offset 0xF6000000 -range 0x02000000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram_npi/psv_pmc_ram_npi] -force
  assign_bd_address -offset 0xF6000000 -range 0x02000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_ram_npi/psv_pmc_ram_npi] -force
  assign_bd_address -offset 0xF6000000 -range 0x02000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram_npi/psv_pmc_ram_npi] -force
  assign_bd_address -offset 0xF6000000 -range 0x02000000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram_npi/psv_pmc_ram_npi] -force
  assign_bd_address -offset 0xF2000000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_ram/psv_pmc_ram] -force
  assign_bd_address -offset 0xF2000000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram/psv_pmc_ram] -force
  assign_bd_address -offset 0xF2000000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram/psv_pmc_ram] -force
  assign_bd_address -offset 0xF2000000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_ram/psv_pmc_ram] -force
  assign_bd_address -offset 0xF2000000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram/psv_pmc_ram] -force
  assign_bd_address -offset 0xF2000000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram/psv_pmc_ram] -force
  assign_bd_address -offset 0xF2000000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_ram/psv_pmc_ram] -force
  assign_bd_address -offset 0xF1200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_rsa/psv_pmc_rsa] -force
  assign_bd_address -offset 0xF1200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_rsa/psv_pmc_rsa] -force
  assign_bd_address -offset 0xF1200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_rsa/psv_pmc_rsa] -force
  assign_bd_address -offset 0xF1200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_rsa/psv_pmc_rsa] -force
  assign_bd_address -offset 0xF1200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_rsa/psv_pmc_rsa] -force
  assign_bd_address -offset 0xF1200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_rsa/psv_pmc_rsa] -force
  assign_bd_address -offset 0xF1200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_rsa/psv_pmc_rsa] -force
  assign_bd_address -offset 0xF12A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_rtc_0/psv_pmc_rtc_0] -force
  assign_bd_address -offset 0xF12A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_rtc_0/psv_pmc_rtc_0] -force
  assign_bd_address -offset 0xF12A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_rtc_0/psv_pmc_rtc_0] -force
  assign_bd_address -offset 0xF12A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_rtc_0/psv_pmc_rtc_0] -force
  assign_bd_address -offset 0xF12A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_rtc_0/psv_pmc_rtc_0] -force
  assign_bd_address -offset 0xF12A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_rtc_0/psv_pmc_rtc_0] -force
  assign_bd_address -offset 0xF12A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_rtc_0/psv_pmc_rtc_0] -force
  assign_bd_address -offset 0xF1050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_sd_1/psv_pmc_sd_1] -force
  assign_bd_address -offset 0xF1050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_sd_1/psv_pmc_sd_1] -force
  assign_bd_address -offset 0xF1050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_sd_1/psv_pmc_sd_1] -force
  assign_bd_address -offset 0xF1050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_sd_1/psv_pmc_sd_1] -force
  assign_bd_address -offset 0xF1050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_sd_1/psv_pmc_sd_1] -force
  assign_bd_address -offset 0xF1050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_sd_1/psv_pmc_sd_1] -force
  assign_bd_address -offset 0xF1050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_sd_1/psv_pmc_sd_1] -force
  assign_bd_address -offset 0xF1210000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_sha/psv_pmc_sha] -force
  assign_bd_address -offset 0xF1210000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_sha/psv_pmc_sha] -force
  assign_bd_address -offset 0xF1210000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_sha/psv_pmc_sha] -force
  assign_bd_address -offset 0xF1210000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_sha/psv_pmc_sha] -force
  assign_bd_address -offset 0xF1210000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_sha/psv_pmc_sha] -force
  assign_bd_address -offset 0xF1210000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_sha/psv_pmc_sha] -force
  assign_bd_address -offset 0xF1210000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_sha/psv_pmc_sha] -force
  assign_bd_address -offset 0xF1270000 -range 0x00030000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_sysmon_0/psv_pmc_sysmon_0] -force
  assign_bd_address -offset 0xF1270000 -range 0x00030000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_sysmon_0/psv_pmc_sysmon_0] -force
  assign_bd_address -offset 0xF1270000 -range 0x00030000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_sysmon_0/psv_pmc_sysmon_0] -force
  assign_bd_address -offset 0xF1270000 -range 0x00030000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_sysmon_0/psv_pmc_sysmon_0] -force
  assign_bd_address -offset 0xF1270000 -range 0x00030000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_sysmon_0/psv_pmc_sysmon_0] -force
  assign_bd_address -offset 0xF1270000 -range 0x00030000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_sysmon_0/psv_pmc_sysmon_0] -force
  assign_bd_address -offset 0xF1270000 -range 0x00030000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_sysmon_0/psv_pmc_sysmon_0] -force
  assign_bd_address -offset 0xF0083000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_tmr_inject_0/psv_pmc_tmr_inject_0] -force
  assign_bd_address -offset 0xF0083000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_tmr_inject_0/psv_pmc_tmr_inject_0] -force
  assign_bd_address -offset 0xF0283000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_tmr_manager_0/psv_pmc_tmr_manager_0] -force
  assign_bd_address -offset 0xF0283000 -range 0x00001000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_tmr_manager_0/psv_pmc_tmr_manager_0] -force
  assign_bd_address -offset 0xF1230000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_trng/psv_pmc_trng] -force
  assign_bd_address -offset 0xF1230000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_trng/psv_pmc_trng] -force
  assign_bd_address -offset 0xF1230000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_trng/psv_pmc_trng] -force
  assign_bd_address -offset 0xF1230000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_trng/psv_pmc_trng] -force
  assign_bd_address -offset 0xF1230000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_trng/psv_pmc_trng] -force
  assign_bd_address -offset 0xF1230000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_trng/psv_pmc_trng] -force
  assign_bd_address -offset 0xF1230000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_trng/psv_pmc_trng] -force
  assign_bd_address -offset 0xF12F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_xmpu_0/psv_pmc_xmpu_0] -force
  assign_bd_address -offset 0xF12F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_xmpu_0/psv_pmc_xmpu_0] -force
  assign_bd_address -offset 0xF12F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_xmpu_0/psv_pmc_xmpu_0] -force
  assign_bd_address -offset 0xF12F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_xmpu_0/psv_pmc_xmpu_0] -force
  assign_bd_address -offset 0xF12F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_xmpu_0/psv_pmc_xmpu_0] -force
  assign_bd_address -offset 0xF12F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_xmpu_0/psv_pmc_xmpu_0] -force
  assign_bd_address -offset 0xF12F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_xmpu_0/psv_pmc_xmpu_0] -force
  assign_bd_address -offset 0xF1310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_0/psv_pmc_xppu_0] -force
  assign_bd_address -offset 0xF1310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_0/psv_pmc_xppu_0] -force
  assign_bd_address -offset 0xF1310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_0/psv_pmc_xppu_0] -force
  assign_bd_address -offset 0xF1310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_0/psv_pmc_xppu_0] -force
  assign_bd_address -offset 0xF1310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_0/psv_pmc_xppu_0] -force
  assign_bd_address -offset 0xF1310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_0/psv_pmc_xppu_0] -force
  assign_bd_address -offset 0xF1310000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_0/psv_pmc_xppu_0] -force
  assign_bd_address -offset 0xF1300000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_npi_0/psv_pmc_xppu_npi_0] -force
  assign_bd_address -offset 0xF1300000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_npi_0/psv_pmc_xppu_npi_0] -force
  assign_bd_address -offset 0xF1300000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_npi_0/psv_pmc_xppu_npi_0] -force
  assign_bd_address -offset 0xF1300000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_npi_0/psv_pmc_xppu_npi_0] -force
  assign_bd_address -offset 0xF1300000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_npi_0/psv_pmc_xppu_npi_0] -force
  assign_bd_address -offset 0xF1300000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_npi_0/psv_pmc_xppu_npi_0] -force
  assign_bd_address -offset 0xF1300000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_pmc_xppu_npi_0/psv_pmc_xppu_npi_0] -force
  assign_bd_address -offset 0xFFC90000 -range 0x0000F000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_psm_global_reg/psv_psm_global_reg] -force
  assign_bd_address -offset 0xFFC90000 -range 0x0000F000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_psm_global_reg/psv_psm_global_reg] -force
  assign_bd_address -offset 0xFFC90000 -range 0x0000F000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_psm_global_reg/psv_psm_global_reg] -force
  assign_bd_address -offset 0xFFC90000 -range 0x0000F000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_psm_global_reg/psv_psm_global_reg] -force
  assign_bd_address -offset 0xFFC90000 -range 0x0000F000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_psm_global_reg/psv_psm_global_reg] -force
  assign_bd_address -offset 0xFFC90000 -range 0x0000F000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_psm_global_reg/psv_psm_global_reg] -force
  assign_bd_address -offset 0xFFC90000 -range 0x0000F000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_psm_global_reg/psv_psm_global_reg] -force
  assign_bd_address -offset 0xFFC80000 -range 0x00008000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_psm_iomodule_0/psv_psm_iomodule_0] -force
  assign_bd_address -offset 0xFFC20000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_psm_ram_data_cntlr/psv_psm_ram_data_cntlr] -force
  assign_bd_address -offset 0xFFC00000 -range 0x00020000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_psm_ram_instr_cntlr/psv_psm_ram_instr_cntlr] -force
  assign_bd_address -offset 0xFFCD0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_psm_tmr_inject_0/psv_psm_tmr_inject_0] -force
  assign_bd_address -offset 0xFFCC0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_psm_tmr_manager_0/psv_psm_tmr_manager_0] -force
  assign_bd_address -offset 0x00000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_r5_0_atcm/psv_r5_0_atcm] -force
  assign_bd_address -offset 0x00020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_r5_0_btcm/psv_r5_0_btcm] -force
  assign_bd_address -offset 0xFFE50000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_r5_0_data_cache/psv_r5_0_data_cache] -force
  assign_bd_address -offset 0xFFE50000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_r5_0_data_cache/psv_r5_0_data_cache] -force
  assign_bd_address -offset 0xFFE40000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_r5_0_instruction_cache/psv_r5_0_instruction_cache] -force
  assign_bd_address -offset 0xFFE40000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_r5_0_instruction_cache/psv_r5_0_instruction_cache] -force
  assign_bd_address -offset 0xFFE90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_r5_1_atcm_global/psv_r5_1_atcm_global] -force
  assign_bd_address -offset 0xFFE90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_r5_1_atcm_global/psv_r5_1_atcm_global] -force
  assign_bd_address -offset 0xFFE90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_r5_1_atcm_global/psv_r5_1_atcm_global] -force
  assign_bd_address -offset 0xFFE90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_r5_1_atcm_global/psv_r5_1_atcm_global] -force
  assign_bd_address -offset 0xFFE90000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_r5_1_atcm_global/psv_r5_1_atcm_global] -force
  assign_bd_address -offset 0x00000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_r5_1_atcm/psv_r5_1_atcm] -force
  assign_bd_address -offset 0xFFEB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_r5_1_btcm_global/psv_r5_1_btcm_global] -force
  assign_bd_address -offset 0xFFEB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_r5_1_btcm_global/psv_r5_1_btcm_global] -force
  assign_bd_address -offset 0xFFEB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_r5_1_btcm_global/psv_r5_1_btcm_global] -force
  assign_bd_address -offset 0xFFEB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_r5_1_btcm_global/psv_r5_1_btcm_global] -force
  assign_bd_address -offset 0xFFEB0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_r5_1_btcm_global/psv_r5_1_btcm_global] -force
  assign_bd_address -offset 0x00020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_r5_1_btcm/psv_r5_1_btcm] -force
  assign_bd_address -offset 0xFFED0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_r5_1_data_cache/psv_r5_1_data_cache] -force
  assign_bd_address -offset 0xFFED0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_r5_1_data_cache/psv_r5_1_data_cache] -force
  assign_bd_address -offset 0xFFEC0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_r5_1_instruction_cache/psv_r5_1_instruction_cache] -force
  assign_bd_address -offset 0xFFEC0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_r5_1_instruction_cache/psv_r5_1_instruction_cache] -force
  assign_bd_address -offset 0x00000000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_r5_tcm_ram_0/psv_r5_tcm_ram_0] -force
  assign_bd_address -offset 0x00000000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_r5_tcm_ram_0/psv_r5_tcm_ram_0] -force
  assign_bd_address -offset 0xFFE00000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_r5_tcm_ram_global/psv_r5_tcm_ram_global] -force
  assign_bd_address -offset 0xFFE00000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_r5_tcm_ram_global/psv_r5_tcm_ram_global] -force
  assign_bd_address -offset 0xFFE00000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_r5_tcm_ram_global/psv_r5_tcm_ram_global] -force
  assign_bd_address -offset 0xFFE00000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_r5_tcm_ram_global/psv_r5_tcm_ram_global] -force
  assign_bd_address -offset 0xFFE00000 -range 0x00040000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_r5_tcm_ram_global/psv_r5_tcm_ram_global] -force
  assign_bd_address -offset 0xF9000000 -range 0x00003000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_rcpu_gic/psv_rcpu_gic] -force
  assign_bd_address -offset 0xF9000000 -range 0x00003000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_rcpu_gic/psv_rcpu_gic] -force
  assign_bd_address -offset 0xF9000000 -range 0x00003000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_rcpu_gic/psv_rcpu_gic] -force
  assign_bd_address -offset 0xF9000000 -range 0x00003000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_rcpu_gic/psv_rcpu_gic] -force
  assign_bd_address -offset 0xFF9A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_rpu_0/psv_rpu_0] -force
  assign_bd_address -offset 0xFF9A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_rpu_0/psv_rpu_0] -force
  assign_bd_address -offset 0xFF9A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_rpu_0/psv_rpu_0] -force
  assign_bd_address -offset 0xFF9A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_rpu_0/psv_rpu_0] -force
  assign_bd_address -offset 0xFF000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_sbsauart_0/psv_sbsauart_0] -force
  assign_bd_address -offset 0xFF000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_sbsauart_0/psv_sbsauart_0] -force
  assign_bd_address -offset 0xFF000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_sbsauart_0/psv_sbsauart_0] -force
  assign_bd_address -offset 0xFF000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_sbsauart_0/psv_sbsauart_0] -force
  assign_bd_address -offset 0xFF000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_sbsauart_0/psv_sbsauart_0] -force
  assign_bd_address -offset 0xFF000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_sbsauart_0/psv_sbsauart_0] -force
  assign_bd_address -offset 0xFF000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_sbsauart_0/psv_sbsauart_0] -force
  assign_bd_address -offset 0xFF130000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_scntr_0/psv_scntr_0] -force
  assign_bd_address -offset 0xFF130000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_scntr_0/psv_scntr_0] -force
  assign_bd_address -offset 0xFF130000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_scntr_0/psv_scntr_0] -force
  assign_bd_address -offset 0xFF130000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_scntr_0/psv_scntr_0] -force
  assign_bd_address -offset 0xFF130000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_scntr_0/psv_scntr_0] -force
  assign_bd_address -offset 0xFF130000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_scntr_0/psv_scntr_0] -force
  assign_bd_address -offset 0xFF130000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_scntr_0/psv_scntr_0] -force
  assign_bd_address -offset 0xFF140000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_scntrs_0/psv_scntrs_0] -force
  assign_bd_address -offset 0xFF140000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_scntrs_0/psv_scntrs_0] -force
  assign_bd_address -offset 0xFF140000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_scntrs_0/psv_scntrs_0] -force
  assign_bd_address -offset 0xFF140000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_scntrs_0/psv_scntrs_0] -force
  assign_bd_address -offset 0xFF140000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_scntrs_0/psv_scntrs_0] -force
  assign_bd_address -offset 0xFF140000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_scntrs_0/psv_scntrs_0] -force
  assign_bd_address -offset 0xFF140000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_scntrs_0/psv_scntrs_0] -force
  assign_bd_address -offset 0xFF9D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_usb_0/psv_usb_0] -force
  assign_bd_address -offset 0xFF9D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_usb_0/psv_usb_0] -force
  assign_bd_address -offset 0xFF9D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_usb_0/psv_usb_0] -force
  assign_bd_address -offset 0xFF9D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_usb_0/psv_usb_0] -force
  assign_bd_address -offset 0xFF9D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_usb_0/psv_usb_0] -force
  assign_bd_address -offset 0xFF9D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_usb_0/psv_usb_0] -force
  assign_bd_address -offset 0xFF9D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_usb_0/psv_usb_0] -force
  assign_bd_address -offset 0xFE200000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_pmc_0] [get_bd_addr_segs pspmc_0/psv_usb_xhci_0/psv_usb_xhci_0] -force
  assign_bd_address -offset 0xFE200000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/pmc_ppu_0] [get_bd_addr_segs pspmc_0/psv_usb_xhci_0/psv_usb_xhci_0] -force
  assign_bd_address -offset 0xFE200000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_psm_0] [get_bd_addr_segs pspmc_0/psv_usb_xhci_0/psv_usb_xhci_0] -force
  assign_bd_address -offset 0xFE200000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_1] [get_bd_addr_segs pspmc_0/psv_usb_xhci_0/psv_usb_xhci_0] -force
  assign_bd_address -offset 0xFE200000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_0] [get_bd_addr_segs pspmc_0/psv_usb_xhci_0/psv_usb_xhci_0] -force
  assign_bd_address -offset 0xFE200000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexa72_0] [get_bd_addr_segs pspmc_0/psv_usb_xhci_0/psv_usb_xhci_0] -force
  assign_bd_address -offset 0xFE200000 -range 0x00100000 -target_address_space [get_bd_addr_spaces pspmc_0/psv_cortexr5_1] [get_bd_addr_segs pspmc_0/psv_usb_xhci_0/psv_usb_xhci_0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


