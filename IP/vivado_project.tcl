# Created : 9:31:38, Tue Jun 21, 2016 : Sanjay Rai

source ../device_type.tcl
create_project -force project_X project_X -part [DEVICE_TYPE] 
set_property board_part xilinx.com:vck190:part0:2.2 [current_project]

add_files -fileset sources_1 -norecurse {
../IP/clk_wiz_0v/clk_wiz_0v.xci
../IP/vio_0v/vio_0v.xci
../IP/cips_ddr_pl_debug/cips_ddr_pl_debug.bd
}

proc regenrate_cips {} {
    reset_target all [get_files  cips_ddr_pl_debug.bd]
    generate_target all [get_files cips_ddr_pl_debug.bd]
}
