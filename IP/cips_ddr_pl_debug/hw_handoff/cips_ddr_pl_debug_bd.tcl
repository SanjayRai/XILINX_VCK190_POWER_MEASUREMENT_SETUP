
################################################################
# This is a generated script based on design: cips_ddr_pl_debug
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
# source cips_ddr_pl_debug_script.tcl

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
set design_name cips_ddr_pl_debug

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir .

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2030 -severity "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_gid_msg -ssname BD::TCL -id 2031 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_gid_msg -ssname BD::TCL -id 2032 -severity "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2033 -severity "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2034 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files -quiet */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2035 -severity "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_gid_msg -ssname BD::TCL -id 2036 -severity "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2037 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_gid_msg -ssname BD::TCL -id 2038 -severity "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

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
  set ddr4_dimm1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_dimm1 ]

  set ddr4_dimm1_sma_clk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 ddr4_dimm1_sma_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $ddr4_dimm1_sma_clk

  set gpio_rtl [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 gpio_rtl ]


  # Create ports
  set CIPS_CLOCK_OUT_100M [ create_bd_port -dir O -type clk CIPS_CLOCK_OUT_100M ]

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]

  # Create instance: axi_bram_ctrl_0_bram, and set properties
  set axi_bram_ctrl_0_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:emb_mem_gen:1.0 axi_bram_ctrl_0_bram ]
  set_property -dict [ list \
   CONFIG.MEMORY_TYPE {True_Dual_Port_RAM} \
 ] $axi_bram_ctrl_0_bram

  # Create instance: axi_dbg_hub_0, and set properties
  set axi_dbg_hub_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dbg_hub:2.0 axi_dbg_hub_0 ]
  set_property -dict [ list \
   CONFIG.C_AXI_DATA_WIDTH {128} \
   CONFIG.C_NUM_DEBUG_CORES {0} \
 ] $axi_dbg_hub_0

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {4} \
   CONFIG.GPIO_BOARD_INTERFACE {Custom} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_gpio_0

  # Create instance: axi_gpio_0_smc, and set properties
  set axi_gpio_0_smc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_gpio_0_smc ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {1} \
 ] $axi_gpio_0_smc

  # Create instance: axi_noc_0, and set properties
  set axi_noc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_noc:1.0 axi_noc_0 ]
  set_property -dict [ list \
   CONFIG.CH0_DDR4_0_BOARD_INTERFACE {ddr4_dimm1} \
   CONFIG.NUM_CLKS {7} \
   CONFIG.NUM_MI {3} \
   CONFIG.NUM_SI {6} \
   CONFIG.sys_clk0_BOARD_INTERFACE {ddr4_dimm1_sma_clk} \
 ] $axi_noc_0

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.APERTURES {{0x201_0000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M00_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.APERTURES {{0x201_4000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M01_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.APERTURES {{0x201_C000_0000 1G}} \
   CONFIG.CATEGORY {pl} \
 ] [get_bd_intf_pins /axi_noc_0/M02_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.CONNECTIONS {MC_0 { read_bw {5} write_bw {5} read_avg_burst {4} write_avg_burst {4}} M00_AXI { read_bw {5} write_bw {5}}  M00_AXI {read_bw {5} write_bw {5}}} \
   CONFIG.DEST_IDS {M00_AXI:0x0} \
   CONFIG.CATEGORY {ps_pmc} \
 ] [get_bd_intf_pins /axi_noc_0/S00_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.CONNECTIONS {MC_0 { read_bw {5} write_bw {5} read_avg_burst {4} write_avg_burst {4}} } \
   CONFIG.CATEGORY {ps_rpu} \
 ] [get_bd_intf_pins /axi_noc_0/S01_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.CONNECTIONS {MC_0 { read_bw {5} write_bw {5} read_avg_burst {4} write_avg_burst {4}} M01_AXI { read_bw {5} write_bw {5} read_avg_burst {4} write_avg_burst {4}}  M02_AXI {read_bw {5} write_bw {5}}} \
   CONFIG.DEST_IDS {M01_AXI:0x40:M02_AXI:0x80} \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S02_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.CONNECTIONS {MC_0 { read_bw {5} write_bw {5} read_avg_burst {4} write_avg_burst {4}} } \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S03_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.CONNECTIONS {MC_0 { read_bw {5} write_bw {5} read_avg_burst {4} write_avg_burst {4}} } \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S04_AXI]

  set_property -dict [ list \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.CONNECTIONS {MC_0 { read_bw {5} write_bw {5} read_avg_burst {4} write_avg_burst {4}} } \
   CONFIG.CATEGORY {ps_cci} \
 ] [get_bd_intf_pins /axi_noc_0/S05_AXI]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S00_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk0]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S01_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk1]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S02_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk2]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S03_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk3]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S04_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk4]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {S05_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk5]

  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {M00_AXI:M01_AXI:M02_AXI} \
 ] [get_bd_pins /axi_noc_0/aclk6]

  # Create instance: axis_ila_0, and set properties
  set axis_ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_ila:1.1 axis_ila_0 ]
  set_property -dict [ list \
   CONFIG.C_MON_TYPE {Interface_Monitor} \
   CONFIG.C_SLOT_0_APC_EN {0} \
   CONFIG.C_SLOT_0_AXI_AR_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_AR_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_AW_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_AW_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_B_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_B_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_R_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_R_SEL_TRIG {1} \
   CONFIG.C_SLOT_0_AXI_W_SEL_DATA {1} \
   CONFIG.C_SLOT_0_AXI_W_SEL_TRIG {1} \
 ] $axis_ila_0

  # Create instance: axis_vio_0, and set properties
  set axis_vio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_vio:1.0 axis_vio_0 ]
  set_property -dict [ list \
   CONFIG.C_NUM_PROBE_OUT {3} \
   CONFIG.C_PROBE_IN0_WIDTH {16} \
   CONFIG.C_PROBE_OUT2_WIDTH {16} \
 ] $axis_vio_0

  # Create instance: c_counter_binary_0, and set properties
  set c_counter_binary_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_counter_binary:12.0 c_counter_binary_0 ]
  set_property -dict [ list \
   CONFIG.Load {true} \
   CONFIG.SSET {true} \
 ] $c_counter_binary_0

  # Create instance: clk_wizard_0, and set properties
  set clk_wizard_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wizard:1.0 clk_wizard_0 ]
  set_property -dict [ list \
   CONFIG.PRIM_SOURCE {No_buffer} \
 ] $clk_wizard_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: versal_cips_0, and set properties
  set versal_cips_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:versal_cips:3.0 versal_cips_0 ]
  set_property -dict [ list \
   CONFIG.CLOCK_MODE {Custom} \
   CONFIG.DDR_MEMORY_MODE {Custom} \
   CONFIG.PS_BOARD_INTERFACE {ps_pmc_fixed_io} \
   CONFIG.PS_PMC_CONFIG {PS_GEN_IPI0_ENABLE 1 PS_GEN_IPI0_MASTER A72 PS_GEN_IPI1_ENABLE 1\
PS_GEN_IPI1_MASTER A72 PS_GEN_IPI2_ENABLE 1 PS_GEN_IPI2_MASTER A72\
PS_GEN_IPI3_ENABLE 1 PS_GEN_IPI3_MASTER A72 PS_GEN_IPI4_ENABLE 1\
PS_GEN_IPI4_MASTER A72 PS_GEN_IPI5_ENABLE 1 PS_GEN_IPI5_MASTER A72\
PS_GEN_IPI6_ENABLE 1 PS_GEN_IPI6_MASTER A72 CLOCK_MODE Custom DDR_MEMORY_MODE\
Custom PMC_USE_PMC_NOC_AXI0 1 PS_NUM_FABRIC_RESETS 1 PS_USE_FPD_CCI_NOC 1\
PS_USE_NOC_LPD_AXI0 1 PS_USE_PMCPL_CLK0 1 PS_MIO7 {{AUX_IO 0} {DIRECTION in}\
{DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL disable} {SCHMITT 0} {SLEW\
slow} {USAGE Reserved}} PS_MIO9 {{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA}\
{OUTPUT_DATA default} {PULL disable} {SCHMITT 0} {SLEW slow} {USAGE Reserved}}\
PS_MIO19 {{AUX_IO 0} {DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default}\
{PULL disable} {SCHMITT 0} {SLEW slow} {USAGE Reserved}} PS_MIO21 {{AUX_IO 0}\
{DIRECTION in} {DRIVE_STRENGTH 8mA} {OUTPUT_DATA default} {PULL disable}\
{SCHMITT 0} {SLEW slow} {USAGE Reserved}} PMC_MIO37 {{AUX_IO 0} {DIRECTION out}\
{DRIVE_STRENGTH 8mA} {OUTPUT_DATA high} {PULL pullup} {SCHMITT 0} {SLEW slow}\
{USAGE GPIO}} PMC_SD1 {{CD_ENABLE 1} {CD_IO {PMC_MIO 28}} {POW_ENABLE 1}\
{POW_IO {PMC_MIO 51}} {RESET_ENABLE 0} {RESET_IO {PMC_MIO 1}} {WP_ENABLE 0}\
{WP_IO {PMC_MIO 1}}} PMC_SD1_COHERENCY 0 PMC_SD1_DATA_TRANSFER_MODE 8Bit\
PMC_SD1_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 26 .. 36}}} PMC_SD1_SLOT_TYPE {SD\
3.0} PMC_GPIO0_MIO_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 0 .. 25}}}\
PMC_GPIO1_MIO_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 26 .. 51}}}\
PMC_I2CPMC_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 46 .. 47}}} PMC_OSPI_PERIPHERAL\
{{ENABLE 0} {IO {PMC_MIO 0 .. 11}} {MODE Single}} PMC_QSPI_COHERENCY 0\
PMC_QSPI_FBCLK {{ENABLE 1} {IO {PMC_MIO 6}}} PMC_QSPI_PERIPHERAL_DATA_MODE x4\
PMC_QSPI_PERIPHERAL_ENABLE 1 PMC_QSPI_PERIPHERAL_MODE {Dual Parallel}\
PS_CAN1_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 40 .. 41}}} PS_ENET0_MDIO {{ENABLE\
1} {IO {PS_MIO 24 .. 25}}} PS_ENET0_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 0 ..\
11}}} PS_ENET1_PERIPHERAL {{ENABLE 1} {IO {PS_MIO 12 .. 23}}}\
PS_I2C1_PERIPHERAL {{ENABLE 1} {IO {PMC_MIO 44 .. 45}}} PS_UART0_PERIPHERAL\
{{ENABLE 1} {IO {PMC_MIO 42 .. 43}}} PS_USB3_PERIPHERAL {{ENABLE 1} {IO\
{PMC_MIO 13 .. 25}}} PMC_REF_CLK_FREQMHZ 33.3333 PS_PCIE_RESET {{ENABLE 1} {IO\
{PMC_MIO 38 .. 39}}} PS_BOARD_INTERFACE ps_pmc_fixed_io SMON_ALARMS\
Set_Alarms_On SMON_ENABLE_TEMP_AVERAGING 0 SMON_TEMP_AVERAGING_SAMPLES 8\
DESIGN_MODE 1 PS_PCIE1_PERIPHERAL_ENABLE 0 PS_PCIE2_PERIPHERAL_ENABLE 0\
PCIE_APERTURES_SINGLE_ENABLE 0 PCIE_APERTURES_DUAL_ENABLE 0}\
 ] $versal_cips_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins axi_bram_ctrl_0_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTB [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTB] [get_bd_intf_pins axi_bram_ctrl_0_bram/BRAM_PORTB]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports gpio_rtl] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_0_smc_M00_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins axi_gpio_0_smc/M00_AXI]
  connect_bd_intf_net -intf_net axi_noc_0_CH0_DDR4_0 [get_bd_intf_ports ddr4_dimm1] [get_bd_intf_pins axi_noc_0/CH0_DDR4_0]
  connect_bd_intf_net -intf_net axi_noc_0_M00_AXI [get_bd_intf_pins axi_dbg_hub_0/S_AXI] [get_bd_intf_pins axi_noc_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_noc_0_M01_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_noc_0/M01_AXI]
connect_bd_intf_net -intf_net [get_bd_intf_nets axi_noc_0_M01_AXI] [get_bd_intf_pins axi_noc_0/M01_AXI] [get_bd_intf_pins axis_ila_0/SLOT_0_AXI]
  set_property HDL_ATTRIBUTE.DEBUG {true} [get_bd_intf_nets axi_noc_0_M01_AXI]
  connect_bd_intf_net -intf_net axi_noc_0_M02_AXI [get_bd_intf_pins axi_gpio_0_smc/S00_AXI] [get_bd_intf_pins axi_noc_0/M02_AXI]
  connect_bd_intf_net -intf_net ddr4_dimm1_sma_clk_1 [get_bd_intf_ports ddr4_dimm1_sma_clk] [get_bd_intf_pins axi_noc_0/sys_clk0]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_0 [get_bd_intf_pins axi_noc_0/S02_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_0]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_1 [get_bd_intf_pins axi_noc_0/S03_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_1]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_2 [get_bd_intf_pins axi_noc_0/S04_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_2]
  connect_bd_intf_net -intf_net versal_cips_0_FPD_CCI_NOC_3 [get_bd_intf_pins axi_noc_0/S05_AXI] [get_bd_intf_pins versal_cips_0/FPD_CCI_NOC_3]
  connect_bd_intf_net -intf_net versal_cips_0_LPD_AXI_NOC_0 [get_bd_intf_pins axi_noc_0/S01_AXI] [get_bd_intf_pins versal_cips_0/LPD_AXI_NOC_0]
  connect_bd_intf_net -intf_net versal_cips_0_PMC_NOC_AXI_0 [get_bd_intf_pins axi_noc_0/S00_AXI] [get_bd_intf_pins versal_cips_0/PMC_NOC_AXI_0]

  # Create port connections
  connect_bd_net -net axis_vio_0_probe_out0 [get_bd_pins axis_vio_0/probe_out0] [get_bd_pins c_counter_binary_0/SSET]
  connect_bd_net -net axis_vio_0_probe_out1 [get_bd_pins axis_vio_0/probe_out1] [get_bd_pins c_counter_binary_0/LOAD]
  connect_bd_net -net axis_vio_0_probe_out2 [get_bd_pins axis_vio_0/probe_out2] [get_bd_pins c_counter_binary_0/L]
  connect_bd_net -net c_counter_binary_0_Q [get_bd_pins axis_vio_0/probe_in0] [get_bd_pins c_counter_binary_0/Q]
  connect_bd_net -net clk_wizard_0_clk_out1 [get_bd_ports CIPS_CLOCK_OUT_100M] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_dbg_hub_0/aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_gpio_0_smc/aclk] [get_bd_pins axi_noc_0/aclk6] [get_bd_pins axis_ila_0/clk] [get_bd_pins axis_vio_0/clk] [get_bd_pins c_counter_binary_0/CLK] [get_bd_pins clk_wizard_0/clk_out1] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_dbg_hub_0/aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_gpio_0_smc/aresetn] [get_bd_pins axis_ila_0/resetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi0_clk [get_bd_pins axi_noc_0/aclk2] [get_bd_pins versal_cips_0/fpd_cci_noc_axi0_clk]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi1_clk [get_bd_pins axi_noc_0/aclk3] [get_bd_pins versal_cips_0/fpd_cci_noc_axi1_clk]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi2_clk [get_bd_pins axi_noc_0/aclk4] [get_bd_pins versal_cips_0/fpd_cci_noc_axi2_clk]
  connect_bd_net -net versal_cips_0_fpd_cci_noc_axi3_clk [get_bd_pins axi_noc_0/aclk5] [get_bd_pins versal_cips_0/fpd_cci_noc_axi3_clk]
  connect_bd_net -net versal_cips_0_lpd_axi_noc_clk [get_bd_pins axi_noc_0/aclk1] [get_bd_pins versal_cips_0/lpd_axi_noc_clk]
  connect_bd_net -net versal_cips_0_pl0_ref_clk [get_bd_pins clk_wizard_0/clk_in1] [get_bd_pins versal_cips_0/pl0_ref_clk]
  connect_bd_net -net versal_cips_0_pl0_resetn [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins versal_cips_0/pl0_resetn]
  connect_bd_net -net versal_cips_0_pmc_axi_noc_axi0_clk [get_bd_pins axi_noc_0/aclk0] [get_bd_pins versal_cips_0/pmc_axi_noc_axi0_clk]

  # Create address segments
  assign_bd_address -offset 0x020140000000 -range 0x00002000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_0] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x020100000000 -range 0x00200000 -target_address_space [get_bd_addr_spaces versal_cips_0/PMC_NOC_AXI_0] [get_bd_addr_segs axi_dbg_hub_0/S_AXI_DBG_HUB/Mem0] -force
  assign_bd_address -offset 0x0201C0000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_0] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_0] [get_bd_addr_segs axi_noc_0/S02_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_1] [get_bd_addr_segs axi_noc_0/S03_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_2] [get_bd_addr_segs axi_noc_0/S04_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/FPD_CCI_NOC_3] [get_bd_addr_segs axi_noc_0/S05_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/LPD_AXI_NOC_0] [get_bd_addr_segs axi_noc_0/S01_AXI/C0_DDR_LOW0] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces versal_cips_0/PMC_NOC_AXI_0] [get_bd_addr_segs axi_noc_0/S00_AXI/C0_DDR_LOW0] -force


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


