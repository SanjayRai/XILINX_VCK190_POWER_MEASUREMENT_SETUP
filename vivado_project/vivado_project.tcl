# Created : 9:31:38, Tue Jun 21, 2016 : Sanjay Rai

source ../device_type.tcl
create_project -force project_X project_X -part [DEVICE_TYPE] 
set_property board_part xilinx.com:vck190:part0:2.2 [current_project]

add_files -fileset sources_1 -norecurse {
../IP/cips_ddr_pl_debug/cips_ddr_pl_debug.bd
../IP/cips_dbg_minimal/cips_dbg_minimal.bd
../IP/clk_wiz_0v/clk_wiz_0v.xci
../IP/vio_0v/vio_0v.xci
../rtl/vck190_tester_parameters.vh
../rtl/block_ram_daisy_chain_v2.v
../rtl/clk_gen.v
../rtl/dsp.v
../rtl/dsp_top.v
../rtl/logic_slr.v
../rtl/top_log.v
../rtl/vck190_tester_top.sv
}
add_files -fileset constrs_1 -norecurse ../xdc/top.xdc

set_property SOURCE_SET sources_1 [get_filesets sim_1]
add_files -fileset sim_1 -norecurse ../rtl/tb_vck190_tester_top.sv
update_compile_order -fileset sim_1
set_property top tb_vck190_tester_top [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
set_property -name {xsim.simulate.runtime} -value {0} -objects [get_filesets sim_1]
update_compile_order -fileset sim_1

proc generate_saif {} {
launch_simulation
restart
open_saif  ./VCK190_test.saif
log_saif /tb_vck190_tester_top/UUT/u_power_consumer_top/*
run 100 ns
close_saif
}

proc run_build {} {
set_property top vck190_tester_top [get_filesets sources_1]
launch_runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -jobs 8
wait_on_run impl_1
open_run impl_1
launch_runs impl_1 -to_step write_device_image -jobs 8
wait_on_run impl_1
write_hw_platform -fixed -include_bit -force -file ./vck190_tester_top.xsa
read_saif ./VCK190_test.saif
report_power -file {./vck190_tester_top_power.txt} -xpe {./vck190_tester_top_power.xpe} -rpx {./vck190_tester_top_power.rpx} -name {power_1}
report_utilization -file {./vck190_tester_top_utilization.txt} -name utilization_1
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -routable_nets -name timing_1 -file ./vck190_tester_top_timing_summary.txt
report_clock_interaction -delay_type min_max -significant_digits 3 -name timing_2
}
