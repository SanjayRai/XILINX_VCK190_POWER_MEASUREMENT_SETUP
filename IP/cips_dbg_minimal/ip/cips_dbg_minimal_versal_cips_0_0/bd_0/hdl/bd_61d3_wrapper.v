//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_61d3_wrapper.bd
//Design : bd_61d3_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_61d3_wrapper
   (gem0_tsu_timer_cnt);
  output [93:0]gem0_tsu_timer_cnt;

  wire [93:0]gem0_tsu_timer_cnt;

  bd_61d3 bd_61d3_i
       (.gem0_tsu_timer_cnt(gem0_tsu_timer_cnt));
endmodule
