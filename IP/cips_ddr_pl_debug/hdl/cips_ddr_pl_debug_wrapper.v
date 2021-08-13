//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Wed Aug 11 00:01:23 2021
//Host        : mcxlnx running 64-bit CentOS Linux release 7.7.1908 (Core)
//Command     : generate_target cips_ddr_pl_debug_wrapper.bd
//Design      : cips_ddr_pl_debug_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module cips_ddr_pl_debug_wrapper
   (CIPS_CLOCK_OUT_100M,
    ddr4_dimm1_act_n,
    ddr4_dimm1_adr,
    ddr4_dimm1_ba,
    ddr4_dimm1_bg,
    ddr4_dimm1_ck_c,
    ddr4_dimm1_ck_t,
    ddr4_dimm1_cke,
    ddr4_dimm1_cs_n,
    ddr4_dimm1_dm_n,
    ddr4_dimm1_dq,
    ddr4_dimm1_dqs_c,
    ddr4_dimm1_dqs_t,
    ddr4_dimm1_odt,
    ddr4_dimm1_reset_n,
    ddr4_dimm1_sma_clk_clk_n,
    ddr4_dimm1_sma_clk_clk_p,
    gpio_rtl_tri_o);
  output CIPS_CLOCK_OUT_100M;
  output ddr4_dimm1_act_n;
  output [16:0]ddr4_dimm1_adr;
  output [1:0]ddr4_dimm1_ba;
  output [1:0]ddr4_dimm1_bg;
  output ddr4_dimm1_ck_c;
  output ddr4_dimm1_ck_t;
  output ddr4_dimm1_cke;
  output ddr4_dimm1_cs_n;
  inout [7:0]ddr4_dimm1_dm_n;
  inout [63:0]ddr4_dimm1_dq;
  inout [7:0]ddr4_dimm1_dqs_c;
  inout [7:0]ddr4_dimm1_dqs_t;
  output ddr4_dimm1_odt;
  output ddr4_dimm1_reset_n;
  input ddr4_dimm1_sma_clk_clk_n;
  input ddr4_dimm1_sma_clk_clk_p;
  output [3:0]gpio_rtl_tri_o;

  wire CIPS_CLOCK_OUT_100M;
  wire ddr4_dimm1_act_n;
  wire [16:0]ddr4_dimm1_adr;
  wire [1:0]ddr4_dimm1_ba;
  wire [1:0]ddr4_dimm1_bg;
  wire ddr4_dimm1_ck_c;
  wire ddr4_dimm1_ck_t;
  wire ddr4_dimm1_cke;
  wire ddr4_dimm1_cs_n;
  wire [7:0]ddr4_dimm1_dm_n;
  wire [63:0]ddr4_dimm1_dq;
  wire [7:0]ddr4_dimm1_dqs_c;
  wire [7:0]ddr4_dimm1_dqs_t;
  wire ddr4_dimm1_odt;
  wire ddr4_dimm1_reset_n;
  wire ddr4_dimm1_sma_clk_clk_n;
  wire ddr4_dimm1_sma_clk_clk_p;
  wire [3:0]gpio_rtl_tri_o;

  cips_ddr_pl_debug cips_ddr_pl_debug_i
       (.CIPS_CLOCK_OUT_100M(CIPS_CLOCK_OUT_100M),
        .ddr4_dimm1_act_n(ddr4_dimm1_act_n),
        .ddr4_dimm1_adr(ddr4_dimm1_adr),
        .ddr4_dimm1_ba(ddr4_dimm1_ba),
        .ddr4_dimm1_bg(ddr4_dimm1_bg),
        .ddr4_dimm1_ck_c(ddr4_dimm1_ck_c),
        .ddr4_dimm1_ck_t(ddr4_dimm1_ck_t),
        .ddr4_dimm1_cke(ddr4_dimm1_cke),
        .ddr4_dimm1_cs_n(ddr4_dimm1_cs_n),
        .ddr4_dimm1_dm_n(ddr4_dimm1_dm_n),
        .ddr4_dimm1_dq(ddr4_dimm1_dq),
        .ddr4_dimm1_dqs_c(ddr4_dimm1_dqs_c),
        .ddr4_dimm1_dqs_t(ddr4_dimm1_dqs_t),
        .ddr4_dimm1_odt(ddr4_dimm1_odt),
        .ddr4_dimm1_reset_n(ddr4_dimm1_reset_n),
        .ddr4_dimm1_sma_clk_clk_n(ddr4_dimm1_sma_clk_clk_n),
        .ddr4_dimm1_sma_clk_clk_p(ddr4_dimm1_sma_clk_clk_p),
        .gpio_rtl_tri_o(gpio_rtl_tri_o));
endmodule
