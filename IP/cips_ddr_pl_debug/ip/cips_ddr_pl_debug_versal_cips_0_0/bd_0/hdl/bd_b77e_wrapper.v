//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_b77e_wrapper.bd
//Design : bd_b77e_wrapper
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bd_b77e_wrapper
   (FPD_CCI_NOC_0_araddr,
    FPD_CCI_NOC_0_arburst,
    FPD_CCI_NOC_0_arcache,
    FPD_CCI_NOC_0_arid,
    FPD_CCI_NOC_0_arlen,
    FPD_CCI_NOC_0_arlock,
    FPD_CCI_NOC_0_arprot,
    FPD_CCI_NOC_0_arqos,
    FPD_CCI_NOC_0_arready,
    FPD_CCI_NOC_0_arsize,
    FPD_CCI_NOC_0_aruser,
    FPD_CCI_NOC_0_arvalid,
    FPD_CCI_NOC_0_awaddr,
    FPD_CCI_NOC_0_awburst,
    FPD_CCI_NOC_0_awcache,
    FPD_CCI_NOC_0_awid,
    FPD_CCI_NOC_0_awlen,
    FPD_CCI_NOC_0_awlock,
    FPD_CCI_NOC_0_awprot,
    FPD_CCI_NOC_0_awqos,
    FPD_CCI_NOC_0_awready,
    FPD_CCI_NOC_0_awsize,
    FPD_CCI_NOC_0_awuser,
    FPD_CCI_NOC_0_awvalid,
    FPD_CCI_NOC_0_bid,
    FPD_CCI_NOC_0_bready,
    FPD_CCI_NOC_0_bresp,
    FPD_CCI_NOC_0_bvalid,
    FPD_CCI_NOC_0_rdata,
    FPD_CCI_NOC_0_rid,
    FPD_CCI_NOC_0_rlast,
    FPD_CCI_NOC_0_rready,
    FPD_CCI_NOC_0_rresp,
    FPD_CCI_NOC_0_rvalid,
    FPD_CCI_NOC_0_wdata,
    FPD_CCI_NOC_0_wlast,
    FPD_CCI_NOC_0_wready,
    FPD_CCI_NOC_0_wstrb,
    FPD_CCI_NOC_0_wuser,
    FPD_CCI_NOC_0_wvalid,
    FPD_CCI_NOC_1_araddr,
    FPD_CCI_NOC_1_arburst,
    FPD_CCI_NOC_1_arcache,
    FPD_CCI_NOC_1_arid,
    FPD_CCI_NOC_1_arlen,
    FPD_CCI_NOC_1_arlock,
    FPD_CCI_NOC_1_arprot,
    FPD_CCI_NOC_1_arqos,
    FPD_CCI_NOC_1_arready,
    FPD_CCI_NOC_1_arsize,
    FPD_CCI_NOC_1_aruser,
    FPD_CCI_NOC_1_arvalid,
    FPD_CCI_NOC_1_awaddr,
    FPD_CCI_NOC_1_awburst,
    FPD_CCI_NOC_1_awcache,
    FPD_CCI_NOC_1_awid,
    FPD_CCI_NOC_1_awlen,
    FPD_CCI_NOC_1_awlock,
    FPD_CCI_NOC_1_awprot,
    FPD_CCI_NOC_1_awqos,
    FPD_CCI_NOC_1_awready,
    FPD_CCI_NOC_1_awsize,
    FPD_CCI_NOC_1_awuser,
    FPD_CCI_NOC_1_awvalid,
    FPD_CCI_NOC_1_bid,
    FPD_CCI_NOC_1_bready,
    FPD_CCI_NOC_1_bresp,
    FPD_CCI_NOC_1_bvalid,
    FPD_CCI_NOC_1_rdata,
    FPD_CCI_NOC_1_rid,
    FPD_CCI_NOC_1_rlast,
    FPD_CCI_NOC_1_rready,
    FPD_CCI_NOC_1_rresp,
    FPD_CCI_NOC_1_rvalid,
    FPD_CCI_NOC_1_wdata,
    FPD_CCI_NOC_1_wlast,
    FPD_CCI_NOC_1_wready,
    FPD_CCI_NOC_1_wstrb,
    FPD_CCI_NOC_1_wuser,
    FPD_CCI_NOC_1_wvalid,
    FPD_CCI_NOC_2_araddr,
    FPD_CCI_NOC_2_arburst,
    FPD_CCI_NOC_2_arcache,
    FPD_CCI_NOC_2_arid,
    FPD_CCI_NOC_2_arlen,
    FPD_CCI_NOC_2_arlock,
    FPD_CCI_NOC_2_arprot,
    FPD_CCI_NOC_2_arqos,
    FPD_CCI_NOC_2_arready,
    FPD_CCI_NOC_2_arsize,
    FPD_CCI_NOC_2_aruser,
    FPD_CCI_NOC_2_arvalid,
    FPD_CCI_NOC_2_awaddr,
    FPD_CCI_NOC_2_awburst,
    FPD_CCI_NOC_2_awcache,
    FPD_CCI_NOC_2_awid,
    FPD_CCI_NOC_2_awlen,
    FPD_CCI_NOC_2_awlock,
    FPD_CCI_NOC_2_awprot,
    FPD_CCI_NOC_2_awqos,
    FPD_CCI_NOC_2_awready,
    FPD_CCI_NOC_2_awsize,
    FPD_CCI_NOC_2_awuser,
    FPD_CCI_NOC_2_awvalid,
    FPD_CCI_NOC_2_bid,
    FPD_CCI_NOC_2_bready,
    FPD_CCI_NOC_2_bresp,
    FPD_CCI_NOC_2_bvalid,
    FPD_CCI_NOC_2_rdata,
    FPD_CCI_NOC_2_rid,
    FPD_CCI_NOC_2_rlast,
    FPD_CCI_NOC_2_rready,
    FPD_CCI_NOC_2_rresp,
    FPD_CCI_NOC_2_rvalid,
    FPD_CCI_NOC_2_wdata,
    FPD_CCI_NOC_2_wlast,
    FPD_CCI_NOC_2_wready,
    FPD_CCI_NOC_2_wstrb,
    FPD_CCI_NOC_2_wuser,
    FPD_CCI_NOC_2_wvalid,
    FPD_CCI_NOC_3_araddr,
    FPD_CCI_NOC_3_arburst,
    FPD_CCI_NOC_3_arcache,
    FPD_CCI_NOC_3_arid,
    FPD_CCI_NOC_3_arlen,
    FPD_CCI_NOC_3_arlock,
    FPD_CCI_NOC_3_arprot,
    FPD_CCI_NOC_3_arqos,
    FPD_CCI_NOC_3_arready,
    FPD_CCI_NOC_3_arsize,
    FPD_CCI_NOC_3_aruser,
    FPD_CCI_NOC_3_arvalid,
    FPD_CCI_NOC_3_awaddr,
    FPD_CCI_NOC_3_awburst,
    FPD_CCI_NOC_3_awcache,
    FPD_CCI_NOC_3_awid,
    FPD_CCI_NOC_3_awlen,
    FPD_CCI_NOC_3_awlock,
    FPD_CCI_NOC_3_awprot,
    FPD_CCI_NOC_3_awqos,
    FPD_CCI_NOC_3_awready,
    FPD_CCI_NOC_3_awsize,
    FPD_CCI_NOC_3_awuser,
    FPD_CCI_NOC_3_awvalid,
    FPD_CCI_NOC_3_bid,
    FPD_CCI_NOC_3_bready,
    FPD_CCI_NOC_3_bresp,
    FPD_CCI_NOC_3_bvalid,
    FPD_CCI_NOC_3_rdata,
    FPD_CCI_NOC_3_rid,
    FPD_CCI_NOC_3_rlast,
    FPD_CCI_NOC_3_rready,
    FPD_CCI_NOC_3_rresp,
    FPD_CCI_NOC_3_rvalid,
    FPD_CCI_NOC_3_wdata,
    FPD_CCI_NOC_3_wlast,
    FPD_CCI_NOC_3_wready,
    FPD_CCI_NOC_3_wstrb,
    FPD_CCI_NOC_3_wuser,
    FPD_CCI_NOC_3_wvalid,
    LPD_AXI_NOC_0_araddr,
    LPD_AXI_NOC_0_arburst,
    LPD_AXI_NOC_0_arcache,
    LPD_AXI_NOC_0_arid,
    LPD_AXI_NOC_0_arlen,
    LPD_AXI_NOC_0_arlock,
    LPD_AXI_NOC_0_arprot,
    LPD_AXI_NOC_0_arqos,
    LPD_AXI_NOC_0_arready,
    LPD_AXI_NOC_0_arsize,
    LPD_AXI_NOC_0_aruser,
    LPD_AXI_NOC_0_arvalid,
    LPD_AXI_NOC_0_awaddr,
    LPD_AXI_NOC_0_awburst,
    LPD_AXI_NOC_0_awcache,
    LPD_AXI_NOC_0_awid,
    LPD_AXI_NOC_0_awlen,
    LPD_AXI_NOC_0_awlock,
    LPD_AXI_NOC_0_awprot,
    LPD_AXI_NOC_0_awqos,
    LPD_AXI_NOC_0_awready,
    LPD_AXI_NOC_0_awsize,
    LPD_AXI_NOC_0_awuser,
    LPD_AXI_NOC_0_awvalid,
    LPD_AXI_NOC_0_bid,
    LPD_AXI_NOC_0_bready,
    LPD_AXI_NOC_0_bresp,
    LPD_AXI_NOC_0_bvalid,
    LPD_AXI_NOC_0_rdata,
    LPD_AXI_NOC_0_rid,
    LPD_AXI_NOC_0_rlast,
    LPD_AXI_NOC_0_rready,
    LPD_AXI_NOC_0_rresp,
    LPD_AXI_NOC_0_rvalid,
    LPD_AXI_NOC_0_wdata,
    LPD_AXI_NOC_0_wlast,
    LPD_AXI_NOC_0_wready,
    LPD_AXI_NOC_0_wstrb,
    LPD_AXI_NOC_0_wvalid,
    PMC_NOC_AXI_0_araddr,
    PMC_NOC_AXI_0_arburst,
    PMC_NOC_AXI_0_arcache,
    PMC_NOC_AXI_0_arid,
    PMC_NOC_AXI_0_arlen,
    PMC_NOC_AXI_0_arlock,
    PMC_NOC_AXI_0_arprot,
    PMC_NOC_AXI_0_arqos,
    PMC_NOC_AXI_0_arready,
    PMC_NOC_AXI_0_arregion,
    PMC_NOC_AXI_0_arsize,
    PMC_NOC_AXI_0_aruser,
    PMC_NOC_AXI_0_arvalid,
    PMC_NOC_AXI_0_awaddr,
    PMC_NOC_AXI_0_awburst,
    PMC_NOC_AXI_0_awcache,
    PMC_NOC_AXI_0_awid,
    PMC_NOC_AXI_0_awlen,
    PMC_NOC_AXI_0_awlock,
    PMC_NOC_AXI_0_awprot,
    PMC_NOC_AXI_0_awqos,
    PMC_NOC_AXI_0_awready,
    PMC_NOC_AXI_0_awregion,
    PMC_NOC_AXI_0_awsize,
    PMC_NOC_AXI_0_awuser,
    PMC_NOC_AXI_0_awvalid,
    PMC_NOC_AXI_0_bid,
    PMC_NOC_AXI_0_bready,
    PMC_NOC_AXI_0_bresp,
    PMC_NOC_AXI_0_buser,
    PMC_NOC_AXI_0_bvalid,
    PMC_NOC_AXI_0_rdata,
    PMC_NOC_AXI_0_rid,
    PMC_NOC_AXI_0_rlast,
    PMC_NOC_AXI_0_rready,
    PMC_NOC_AXI_0_rresp,
    PMC_NOC_AXI_0_ruser,
    PMC_NOC_AXI_0_rvalid,
    PMC_NOC_AXI_0_wdata,
    PMC_NOC_AXI_0_wid,
    PMC_NOC_AXI_0_wlast,
    PMC_NOC_AXI_0_wready,
    PMC_NOC_AXI_0_wstrb,
    PMC_NOC_AXI_0_wuser,
    PMC_NOC_AXI_0_wvalid,
    fpd_cci_noc_axi0_clk,
    fpd_cci_noc_axi1_clk,
    fpd_cci_noc_axi2_clk,
    fpd_cci_noc_axi3_clk,
    gem0_tsu_timer_cnt,
    lpd_axi_noc_clk,
    pl0_ref_clk,
    pl0_resetn,
    pmc_axi_noc_axi0_clk);
  output [63:0]FPD_CCI_NOC_0_araddr;
  output [1:0]FPD_CCI_NOC_0_arburst;
  output [3:0]FPD_CCI_NOC_0_arcache;
  output [15:0]FPD_CCI_NOC_0_arid;
  output [7:0]FPD_CCI_NOC_0_arlen;
  output FPD_CCI_NOC_0_arlock;
  output [2:0]FPD_CCI_NOC_0_arprot;
  output [3:0]FPD_CCI_NOC_0_arqos;
  input FPD_CCI_NOC_0_arready;
  output [2:0]FPD_CCI_NOC_0_arsize;
  output [17:0]FPD_CCI_NOC_0_aruser;
  output FPD_CCI_NOC_0_arvalid;
  output [63:0]FPD_CCI_NOC_0_awaddr;
  output [1:0]FPD_CCI_NOC_0_awburst;
  output [3:0]FPD_CCI_NOC_0_awcache;
  output [15:0]FPD_CCI_NOC_0_awid;
  output [7:0]FPD_CCI_NOC_0_awlen;
  output FPD_CCI_NOC_0_awlock;
  output [2:0]FPD_CCI_NOC_0_awprot;
  output [3:0]FPD_CCI_NOC_0_awqos;
  input FPD_CCI_NOC_0_awready;
  output [2:0]FPD_CCI_NOC_0_awsize;
  output [17:0]FPD_CCI_NOC_0_awuser;
  output FPD_CCI_NOC_0_awvalid;
  input [15:0]FPD_CCI_NOC_0_bid;
  output FPD_CCI_NOC_0_bready;
  input [1:0]FPD_CCI_NOC_0_bresp;
  input FPD_CCI_NOC_0_bvalid;
  input [127:0]FPD_CCI_NOC_0_rdata;
  input [15:0]FPD_CCI_NOC_0_rid;
  input FPD_CCI_NOC_0_rlast;
  output FPD_CCI_NOC_0_rready;
  input [1:0]FPD_CCI_NOC_0_rresp;
  input FPD_CCI_NOC_0_rvalid;
  output [127:0]FPD_CCI_NOC_0_wdata;
  output FPD_CCI_NOC_0_wlast;
  input FPD_CCI_NOC_0_wready;
  output [15:0]FPD_CCI_NOC_0_wstrb;
  output [16:0]FPD_CCI_NOC_0_wuser;
  output FPD_CCI_NOC_0_wvalid;
  output [63:0]FPD_CCI_NOC_1_araddr;
  output [1:0]FPD_CCI_NOC_1_arburst;
  output [3:0]FPD_CCI_NOC_1_arcache;
  output [15:0]FPD_CCI_NOC_1_arid;
  output [7:0]FPD_CCI_NOC_1_arlen;
  output FPD_CCI_NOC_1_arlock;
  output [2:0]FPD_CCI_NOC_1_arprot;
  output [3:0]FPD_CCI_NOC_1_arqos;
  input FPD_CCI_NOC_1_arready;
  output [2:0]FPD_CCI_NOC_1_arsize;
  output [17:0]FPD_CCI_NOC_1_aruser;
  output FPD_CCI_NOC_1_arvalid;
  output [63:0]FPD_CCI_NOC_1_awaddr;
  output [1:0]FPD_CCI_NOC_1_awburst;
  output [3:0]FPD_CCI_NOC_1_awcache;
  output [15:0]FPD_CCI_NOC_1_awid;
  output [7:0]FPD_CCI_NOC_1_awlen;
  output FPD_CCI_NOC_1_awlock;
  output [2:0]FPD_CCI_NOC_1_awprot;
  output [3:0]FPD_CCI_NOC_1_awqos;
  input FPD_CCI_NOC_1_awready;
  output [2:0]FPD_CCI_NOC_1_awsize;
  output [17:0]FPD_CCI_NOC_1_awuser;
  output FPD_CCI_NOC_1_awvalid;
  input [15:0]FPD_CCI_NOC_1_bid;
  output FPD_CCI_NOC_1_bready;
  input [1:0]FPD_CCI_NOC_1_bresp;
  input FPD_CCI_NOC_1_bvalid;
  input [127:0]FPD_CCI_NOC_1_rdata;
  input [15:0]FPD_CCI_NOC_1_rid;
  input FPD_CCI_NOC_1_rlast;
  output FPD_CCI_NOC_1_rready;
  input [1:0]FPD_CCI_NOC_1_rresp;
  input FPD_CCI_NOC_1_rvalid;
  output [127:0]FPD_CCI_NOC_1_wdata;
  output FPD_CCI_NOC_1_wlast;
  input FPD_CCI_NOC_1_wready;
  output [15:0]FPD_CCI_NOC_1_wstrb;
  output [16:0]FPD_CCI_NOC_1_wuser;
  output FPD_CCI_NOC_1_wvalid;
  output [63:0]FPD_CCI_NOC_2_araddr;
  output [1:0]FPD_CCI_NOC_2_arburst;
  output [3:0]FPD_CCI_NOC_2_arcache;
  output [15:0]FPD_CCI_NOC_2_arid;
  output [7:0]FPD_CCI_NOC_2_arlen;
  output FPD_CCI_NOC_2_arlock;
  output [2:0]FPD_CCI_NOC_2_arprot;
  output [3:0]FPD_CCI_NOC_2_arqos;
  input FPD_CCI_NOC_2_arready;
  output [2:0]FPD_CCI_NOC_2_arsize;
  output [17:0]FPD_CCI_NOC_2_aruser;
  output FPD_CCI_NOC_2_arvalid;
  output [63:0]FPD_CCI_NOC_2_awaddr;
  output [1:0]FPD_CCI_NOC_2_awburst;
  output [3:0]FPD_CCI_NOC_2_awcache;
  output [15:0]FPD_CCI_NOC_2_awid;
  output [7:0]FPD_CCI_NOC_2_awlen;
  output FPD_CCI_NOC_2_awlock;
  output [2:0]FPD_CCI_NOC_2_awprot;
  output [3:0]FPD_CCI_NOC_2_awqos;
  input FPD_CCI_NOC_2_awready;
  output [2:0]FPD_CCI_NOC_2_awsize;
  output [17:0]FPD_CCI_NOC_2_awuser;
  output FPD_CCI_NOC_2_awvalid;
  input [15:0]FPD_CCI_NOC_2_bid;
  output FPD_CCI_NOC_2_bready;
  input [1:0]FPD_CCI_NOC_2_bresp;
  input FPD_CCI_NOC_2_bvalid;
  input [127:0]FPD_CCI_NOC_2_rdata;
  input [15:0]FPD_CCI_NOC_2_rid;
  input FPD_CCI_NOC_2_rlast;
  output FPD_CCI_NOC_2_rready;
  input [1:0]FPD_CCI_NOC_2_rresp;
  input FPD_CCI_NOC_2_rvalid;
  output [127:0]FPD_CCI_NOC_2_wdata;
  output FPD_CCI_NOC_2_wlast;
  input FPD_CCI_NOC_2_wready;
  output [15:0]FPD_CCI_NOC_2_wstrb;
  output [16:0]FPD_CCI_NOC_2_wuser;
  output FPD_CCI_NOC_2_wvalid;
  output [63:0]FPD_CCI_NOC_3_araddr;
  output [1:0]FPD_CCI_NOC_3_arburst;
  output [3:0]FPD_CCI_NOC_3_arcache;
  output [15:0]FPD_CCI_NOC_3_arid;
  output [7:0]FPD_CCI_NOC_3_arlen;
  output FPD_CCI_NOC_3_arlock;
  output [2:0]FPD_CCI_NOC_3_arprot;
  output [3:0]FPD_CCI_NOC_3_arqos;
  input FPD_CCI_NOC_3_arready;
  output [2:0]FPD_CCI_NOC_3_arsize;
  output [17:0]FPD_CCI_NOC_3_aruser;
  output FPD_CCI_NOC_3_arvalid;
  output [63:0]FPD_CCI_NOC_3_awaddr;
  output [1:0]FPD_CCI_NOC_3_awburst;
  output [3:0]FPD_CCI_NOC_3_awcache;
  output [15:0]FPD_CCI_NOC_3_awid;
  output [7:0]FPD_CCI_NOC_3_awlen;
  output FPD_CCI_NOC_3_awlock;
  output [2:0]FPD_CCI_NOC_3_awprot;
  output [3:0]FPD_CCI_NOC_3_awqos;
  input FPD_CCI_NOC_3_awready;
  output [2:0]FPD_CCI_NOC_3_awsize;
  output [17:0]FPD_CCI_NOC_3_awuser;
  output FPD_CCI_NOC_3_awvalid;
  input [15:0]FPD_CCI_NOC_3_bid;
  output FPD_CCI_NOC_3_bready;
  input [1:0]FPD_CCI_NOC_3_bresp;
  input FPD_CCI_NOC_3_bvalid;
  input [127:0]FPD_CCI_NOC_3_rdata;
  input [15:0]FPD_CCI_NOC_3_rid;
  input FPD_CCI_NOC_3_rlast;
  output FPD_CCI_NOC_3_rready;
  input [1:0]FPD_CCI_NOC_3_rresp;
  input FPD_CCI_NOC_3_rvalid;
  output [127:0]FPD_CCI_NOC_3_wdata;
  output FPD_CCI_NOC_3_wlast;
  input FPD_CCI_NOC_3_wready;
  output [15:0]FPD_CCI_NOC_3_wstrb;
  output [16:0]FPD_CCI_NOC_3_wuser;
  output FPD_CCI_NOC_3_wvalid;
  output [63:0]LPD_AXI_NOC_0_araddr;
  output [1:0]LPD_AXI_NOC_0_arburst;
  output [3:0]LPD_AXI_NOC_0_arcache;
  output [15:0]LPD_AXI_NOC_0_arid;
  output [7:0]LPD_AXI_NOC_0_arlen;
  output LPD_AXI_NOC_0_arlock;
  output [2:0]LPD_AXI_NOC_0_arprot;
  output [3:0]LPD_AXI_NOC_0_arqos;
  input LPD_AXI_NOC_0_arready;
  output [2:0]LPD_AXI_NOC_0_arsize;
  output [17:0]LPD_AXI_NOC_0_aruser;
  output LPD_AXI_NOC_0_arvalid;
  output [63:0]LPD_AXI_NOC_0_awaddr;
  output [1:0]LPD_AXI_NOC_0_awburst;
  output [3:0]LPD_AXI_NOC_0_awcache;
  output [15:0]LPD_AXI_NOC_0_awid;
  output [7:0]LPD_AXI_NOC_0_awlen;
  output LPD_AXI_NOC_0_awlock;
  output [2:0]LPD_AXI_NOC_0_awprot;
  output [3:0]LPD_AXI_NOC_0_awqos;
  input LPD_AXI_NOC_0_awready;
  output [2:0]LPD_AXI_NOC_0_awsize;
  output [17:0]LPD_AXI_NOC_0_awuser;
  output LPD_AXI_NOC_0_awvalid;
  input [15:0]LPD_AXI_NOC_0_bid;
  output LPD_AXI_NOC_0_bready;
  input [1:0]LPD_AXI_NOC_0_bresp;
  input LPD_AXI_NOC_0_bvalid;
  input [127:0]LPD_AXI_NOC_0_rdata;
  input [15:0]LPD_AXI_NOC_0_rid;
  input LPD_AXI_NOC_0_rlast;
  output LPD_AXI_NOC_0_rready;
  input [1:0]LPD_AXI_NOC_0_rresp;
  input LPD_AXI_NOC_0_rvalid;
  output [127:0]LPD_AXI_NOC_0_wdata;
  output LPD_AXI_NOC_0_wlast;
  input LPD_AXI_NOC_0_wready;
  output [15:0]LPD_AXI_NOC_0_wstrb;
  output LPD_AXI_NOC_0_wvalid;
  output [63:0]PMC_NOC_AXI_0_araddr;
  output [1:0]PMC_NOC_AXI_0_arburst;
  output [3:0]PMC_NOC_AXI_0_arcache;
  output [15:0]PMC_NOC_AXI_0_arid;
  output [7:0]PMC_NOC_AXI_0_arlen;
  output PMC_NOC_AXI_0_arlock;
  output [2:0]PMC_NOC_AXI_0_arprot;
  output [3:0]PMC_NOC_AXI_0_arqos;
  input PMC_NOC_AXI_0_arready;
  output [3:0]PMC_NOC_AXI_0_arregion;
  output [2:0]PMC_NOC_AXI_0_arsize;
  output [17:0]PMC_NOC_AXI_0_aruser;
  output PMC_NOC_AXI_0_arvalid;
  output [63:0]PMC_NOC_AXI_0_awaddr;
  output [1:0]PMC_NOC_AXI_0_awburst;
  output [3:0]PMC_NOC_AXI_0_awcache;
  output [15:0]PMC_NOC_AXI_0_awid;
  output [7:0]PMC_NOC_AXI_0_awlen;
  output PMC_NOC_AXI_0_awlock;
  output [2:0]PMC_NOC_AXI_0_awprot;
  output [3:0]PMC_NOC_AXI_0_awqos;
  input PMC_NOC_AXI_0_awready;
  output [3:0]PMC_NOC_AXI_0_awregion;
  output [2:0]PMC_NOC_AXI_0_awsize;
  output [17:0]PMC_NOC_AXI_0_awuser;
  output PMC_NOC_AXI_0_awvalid;
  input [15:0]PMC_NOC_AXI_0_bid;
  output PMC_NOC_AXI_0_bready;
  input [1:0]PMC_NOC_AXI_0_bresp;
  input [15:0]PMC_NOC_AXI_0_buser;
  input PMC_NOC_AXI_0_bvalid;
  input [127:0]PMC_NOC_AXI_0_rdata;
  input [15:0]PMC_NOC_AXI_0_rid;
  input PMC_NOC_AXI_0_rlast;
  output PMC_NOC_AXI_0_rready;
  input [1:0]PMC_NOC_AXI_0_rresp;
  input [16:0]PMC_NOC_AXI_0_ruser;
  input PMC_NOC_AXI_0_rvalid;
  output [127:0]PMC_NOC_AXI_0_wdata;
  output [15:0]PMC_NOC_AXI_0_wid;
  output PMC_NOC_AXI_0_wlast;
  input PMC_NOC_AXI_0_wready;
  output [15:0]PMC_NOC_AXI_0_wstrb;
  output [16:0]PMC_NOC_AXI_0_wuser;
  output PMC_NOC_AXI_0_wvalid;
  output fpd_cci_noc_axi0_clk;
  output fpd_cci_noc_axi1_clk;
  output fpd_cci_noc_axi2_clk;
  output fpd_cci_noc_axi3_clk;
  output [93:0]gem0_tsu_timer_cnt;
  output lpd_axi_noc_clk;
  output pl0_ref_clk;
  output pl0_resetn;
  output pmc_axi_noc_axi0_clk;

  wire [63:0]FPD_CCI_NOC_0_araddr;
  wire [1:0]FPD_CCI_NOC_0_arburst;
  wire [3:0]FPD_CCI_NOC_0_arcache;
  wire [15:0]FPD_CCI_NOC_0_arid;
  wire [7:0]FPD_CCI_NOC_0_arlen;
  wire FPD_CCI_NOC_0_arlock;
  wire [2:0]FPD_CCI_NOC_0_arprot;
  wire [3:0]FPD_CCI_NOC_0_arqos;
  wire FPD_CCI_NOC_0_arready;
  wire [2:0]FPD_CCI_NOC_0_arsize;
  wire [17:0]FPD_CCI_NOC_0_aruser;
  wire FPD_CCI_NOC_0_arvalid;
  wire [63:0]FPD_CCI_NOC_0_awaddr;
  wire [1:0]FPD_CCI_NOC_0_awburst;
  wire [3:0]FPD_CCI_NOC_0_awcache;
  wire [15:0]FPD_CCI_NOC_0_awid;
  wire [7:0]FPD_CCI_NOC_0_awlen;
  wire FPD_CCI_NOC_0_awlock;
  wire [2:0]FPD_CCI_NOC_0_awprot;
  wire [3:0]FPD_CCI_NOC_0_awqos;
  wire FPD_CCI_NOC_0_awready;
  wire [2:0]FPD_CCI_NOC_0_awsize;
  wire [17:0]FPD_CCI_NOC_0_awuser;
  wire FPD_CCI_NOC_0_awvalid;
  wire [15:0]FPD_CCI_NOC_0_bid;
  wire FPD_CCI_NOC_0_bready;
  wire [1:0]FPD_CCI_NOC_0_bresp;
  wire FPD_CCI_NOC_0_bvalid;
  wire [127:0]FPD_CCI_NOC_0_rdata;
  wire [15:0]FPD_CCI_NOC_0_rid;
  wire FPD_CCI_NOC_0_rlast;
  wire FPD_CCI_NOC_0_rready;
  wire [1:0]FPD_CCI_NOC_0_rresp;
  wire FPD_CCI_NOC_0_rvalid;
  wire [127:0]FPD_CCI_NOC_0_wdata;
  wire FPD_CCI_NOC_0_wlast;
  wire FPD_CCI_NOC_0_wready;
  wire [15:0]FPD_CCI_NOC_0_wstrb;
  wire [16:0]FPD_CCI_NOC_0_wuser;
  wire FPD_CCI_NOC_0_wvalid;
  wire [63:0]FPD_CCI_NOC_1_araddr;
  wire [1:0]FPD_CCI_NOC_1_arburst;
  wire [3:0]FPD_CCI_NOC_1_arcache;
  wire [15:0]FPD_CCI_NOC_1_arid;
  wire [7:0]FPD_CCI_NOC_1_arlen;
  wire FPD_CCI_NOC_1_arlock;
  wire [2:0]FPD_CCI_NOC_1_arprot;
  wire [3:0]FPD_CCI_NOC_1_arqos;
  wire FPD_CCI_NOC_1_arready;
  wire [2:0]FPD_CCI_NOC_1_arsize;
  wire [17:0]FPD_CCI_NOC_1_aruser;
  wire FPD_CCI_NOC_1_arvalid;
  wire [63:0]FPD_CCI_NOC_1_awaddr;
  wire [1:0]FPD_CCI_NOC_1_awburst;
  wire [3:0]FPD_CCI_NOC_1_awcache;
  wire [15:0]FPD_CCI_NOC_1_awid;
  wire [7:0]FPD_CCI_NOC_1_awlen;
  wire FPD_CCI_NOC_1_awlock;
  wire [2:0]FPD_CCI_NOC_1_awprot;
  wire [3:0]FPD_CCI_NOC_1_awqos;
  wire FPD_CCI_NOC_1_awready;
  wire [2:0]FPD_CCI_NOC_1_awsize;
  wire [17:0]FPD_CCI_NOC_1_awuser;
  wire FPD_CCI_NOC_1_awvalid;
  wire [15:0]FPD_CCI_NOC_1_bid;
  wire FPD_CCI_NOC_1_bready;
  wire [1:0]FPD_CCI_NOC_1_bresp;
  wire FPD_CCI_NOC_1_bvalid;
  wire [127:0]FPD_CCI_NOC_1_rdata;
  wire [15:0]FPD_CCI_NOC_1_rid;
  wire FPD_CCI_NOC_1_rlast;
  wire FPD_CCI_NOC_1_rready;
  wire [1:0]FPD_CCI_NOC_1_rresp;
  wire FPD_CCI_NOC_1_rvalid;
  wire [127:0]FPD_CCI_NOC_1_wdata;
  wire FPD_CCI_NOC_1_wlast;
  wire FPD_CCI_NOC_1_wready;
  wire [15:0]FPD_CCI_NOC_1_wstrb;
  wire [16:0]FPD_CCI_NOC_1_wuser;
  wire FPD_CCI_NOC_1_wvalid;
  wire [63:0]FPD_CCI_NOC_2_araddr;
  wire [1:0]FPD_CCI_NOC_2_arburst;
  wire [3:0]FPD_CCI_NOC_2_arcache;
  wire [15:0]FPD_CCI_NOC_2_arid;
  wire [7:0]FPD_CCI_NOC_2_arlen;
  wire FPD_CCI_NOC_2_arlock;
  wire [2:0]FPD_CCI_NOC_2_arprot;
  wire [3:0]FPD_CCI_NOC_2_arqos;
  wire FPD_CCI_NOC_2_arready;
  wire [2:0]FPD_CCI_NOC_2_arsize;
  wire [17:0]FPD_CCI_NOC_2_aruser;
  wire FPD_CCI_NOC_2_arvalid;
  wire [63:0]FPD_CCI_NOC_2_awaddr;
  wire [1:0]FPD_CCI_NOC_2_awburst;
  wire [3:0]FPD_CCI_NOC_2_awcache;
  wire [15:0]FPD_CCI_NOC_2_awid;
  wire [7:0]FPD_CCI_NOC_2_awlen;
  wire FPD_CCI_NOC_2_awlock;
  wire [2:0]FPD_CCI_NOC_2_awprot;
  wire [3:0]FPD_CCI_NOC_2_awqos;
  wire FPD_CCI_NOC_2_awready;
  wire [2:0]FPD_CCI_NOC_2_awsize;
  wire [17:0]FPD_CCI_NOC_2_awuser;
  wire FPD_CCI_NOC_2_awvalid;
  wire [15:0]FPD_CCI_NOC_2_bid;
  wire FPD_CCI_NOC_2_bready;
  wire [1:0]FPD_CCI_NOC_2_bresp;
  wire FPD_CCI_NOC_2_bvalid;
  wire [127:0]FPD_CCI_NOC_2_rdata;
  wire [15:0]FPD_CCI_NOC_2_rid;
  wire FPD_CCI_NOC_2_rlast;
  wire FPD_CCI_NOC_2_rready;
  wire [1:0]FPD_CCI_NOC_2_rresp;
  wire FPD_CCI_NOC_2_rvalid;
  wire [127:0]FPD_CCI_NOC_2_wdata;
  wire FPD_CCI_NOC_2_wlast;
  wire FPD_CCI_NOC_2_wready;
  wire [15:0]FPD_CCI_NOC_2_wstrb;
  wire [16:0]FPD_CCI_NOC_2_wuser;
  wire FPD_CCI_NOC_2_wvalid;
  wire [63:0]FPD_CCI_NOC_3_araddr;
  wire [1:0]FPD_CCI_NOC_3_arburst;
  wire [3:0]FPD_CCI_NOC_3_arcache;
  wire [15:0]FPD_CCI_NOC_3_arid;
  wire [7:0]FPD_CCI_NOC_3_arlen;
  wire FPD_CCI_NOC_3_arlock;
  wire [2:0]FPD_CCI_NOC_3_arprot;
  wire [3:0]FPD_CCI_NOC_3_arqos;
  wire FPD_CCI_NOC_3_arready;
  wire [2:0]FPD_CCI_NOC_3_arsize;
  wire [17:0]FPD_CCI_NOC_3_aruser;
  wire FPD_CCI_NOC_3_arvalid;
  wire [63:0]FPD_CCI_NOC_3_awaddr;
  wire [1:0]FPD_CCI_NOC_3_awburst;
  wire [3:0]FPD_CCI_NOC_3_awcache;
  wire [15:0]FPD_CCI_NOC_3_awid;
  wire [7:0]FPD_CCI_NOC_3_awlen;
  wire FPD_CCI_NOC_3_awlock;
  wire [2:0]FPD_CCI_NOC_3_awprot;
  wire [3:0]FPD_CCI_NOC_3_awqos;
  wire FPD_CCI_NOC_3_awready;
  wire [2:0]FPD_CCI_NOC_3_awsize;
  wire [17:0]FPD_CCI_NOC_3_awuser;
  wire FPD_CCI_NOC_3_awvalid;
  wire [15:0]FPD_CCI_NOC_3_bid;
  wire FPD_CCI_NOC_3_bready;
  wire [1:0]FPD_CCI_NOC_3_bresp;
  wire FPD_CCI_NOC_3_bvalid;
  wire [127:0]FPD_CCI_NOC_3_rdata;
  wire [15:0]FPD_CCI_NOC_3_rid;
  wire FPD_CCI_NOC_3_rlast;
  wire FPD_CCI_NOC_3_rready;
  wire [1:0]FPD_CCI_NOC_3_rresp;
  wire FPD_CCI_NOC_3_rvalid;
  wire [127:0]FPD_CCI_NOC_3_wdata;
  wire FPD_CCI_NOC_3_wlast;
  wire FPD_CCI_NOC_3_wready;
  wire [15:0]FPD_CCI_NOC_3_wstrb;
  wire [16:0]FPD_CCI_NOC_3_wuser;
  wire FPD_CCI_NOC_3_wvalid;
  wire [63:0]LPD_AXI_NOC_0_araddr;
  wire [1:0]LPD_AXI_NOC_0_arburst;
  wire [3:0]LPD_AXI_NOC_0_arcache;
  wire [15:0]LPD_AXI_NOC_0_arid;
  wire [7:0]LPD_AXI_NOC_0_arlen;
  wire LPD_AXI_NOC_0_arlock;
  wire [2:0]LPD_AXI_NOC_0_arprot;
  wire [3:0]LPD_AXI_NOC_0_arqos;
  wire LPD_AXI_NOC_0_arready;
  wire [2:0]LPD_AXI_NOC_0_arsize;
  wire [17:0]LPD_AXI_NOC_0_aruser;
  wire LPD_AXI_NOC_0_arvalid;
  wire [63:0]LPD_AXI_NOC_0_awaddr;
  wire [1:0]LPD_AXI_NOC_0_awburst;
  wire [3:0]LPD_AXI_NOC_0_awcache;
  wire [15:0]LPD_AXI_NOC_0_awid;
  wire [7:0]LPD_AXI_NOC_0_awlen;
  wire LPD_AXI_NOC_0_awlock;
  wire [2:0]LPD_AXI_NOC_0_awprot;
  wire [3:0]LPD_AXI_NOC_0_awqos;
  wire LPD_AXI_NOC_0_awready;
  wire [2:0]LPD_AXI_NOC_0_awsize;
  wire [17:0]LPD_AXI_NOC_0_awuser;
  wire LPD_AXI_NOC_0_awvalid;
  wire [15:0]LPD_AXI_NOC_0_bid;
  wire LPD_AXI_NOC_0_bready;
  wire [1:0]LPD_AXI_NOC_0_bresp;
  wire LPD_AXI_NOC_0_bvalid;
  wire [127:0]LPD_AXI_NOC_0_rdata;
  wire [15:0]LPD_AXI_NOC_0_rid;
  wire LPD_AXI_NOC_0_rlast;
  wire LPD_AXI_NOC_0_rready;
  wire [1:0]LPD_AXI_NOC_0_rresp;
  wire LPD_AXI_NOC_0_rvalid;
  wire [127:0]LPD_AXI_NOC_0_wdata;
  wire LPD_AXI_NOC_0_wlast;
  wire LPD_AXI_NOC_0_wready;
  wire [15:0]LPD_AXI_NOC_0_wstrb;
  wire LPD_AXI_NOC_0_wvalid;
  wire [63:0]PMC_NOC_AXI_0_araddr;
  wire [1:0]PMC_NOC_AXI_0_arburst;
  wire [3:0]PMC_NOC_AXI_0_arcache;
  wire [15:0]PMC_NOC_AXI_0_arid;
  wire [7:0]PMC_NOC_AXI_0_arlen;
  wire PMC_NOC_AXI_0_arlock;
  wire [2:0]PMC_NOC_AXI_0_arprot;
  wire [3:0]PMC_NOC_AXI_0_arqos;
  wire PMC_NOC_AXI_0_arready;
  wire [3:0]PMC_NOC_AXI_0_arregion;
  wire [2:0]PMC_NOC_AXI_0_arsize;
  wire [17:0]PMC_NOC_AXI_0_aruser;
  wire PMC_NOC_AXI_0_arvalid;
  wire [63:0]PMC_NOC_AXI_0_awaddr;
  wire [1:0]PMC_NOC_AXI_0_awburst;
  wire [3:0]PMC_NOC_AXI_0_awcache;
  wire [15:0]PMC_NOC_AXI_0_awid;
  wire [7:0]PMC_NOC_AXI_0_awlen;
  wire PMC_NOC_AXI_0_awlock;
  wire [2:0]PMC_NOC_AXI_0_awprot;
  wire [3:0]PMC_NOC_AXI_0_awqos;
  wire PMC_NOC_AXI_0_awready;
  wire [3:0]PMC_NOC_AXI_0_awregion;
  wire [2:0]PMC_NOC_AXI_0_awsize;
  wire [17:0]PMC_NOC_AXI_0_awuser;
  wire PMC_NOC_AXI_0_awvalid;
  wire [15:0]PMC_NOC_AXI_0_bid;
  wire PMC_NOC_AXI_0_bready;
  wire [1:0]PMC_NOC_AXI_0_bresp;
  wire [15:0]PMC_NOC_AXI_0_buser;
  wire PMC_NOC_AXI_0_bvalid;
  wire [127:0]PMC_NOC_AXI_0_rdata;
  wire [15:0]PMC_NOC_AXI_0_rid;
  wire PMC_NOC_AXI_0_rlast;
  wire PMC_NOC_AXI_0_rready;
  wire [1:0]PMC_NOC_AXI_0_rresp;
  wire [16:0]PMC_NOC_AXI_0_ruser;
  wire PMC_NOC_AXI_0_rvalid;
  wire [127:0]PMC_NOC_AXI_0_wdata;
  wire [15:0]PMC_NOC_AXI_0_wid;
  wire PMC_NOC_AXI_0_wlast;
  wire PMC_NOC_AXI_0_wready;
  wire [15:0]PMC_NOC_AXI_0_wstrb;
  wire [16:0]PMC_NOC_AXI_0_wuser;
  wire PMC_NOC_AXI_0_wvalid;
  wire fpd_cci_noc_axi0_clk;
  wire fpd_cci_noc_axi1_clk;
  wire fpd_cci_noc_axi2_clk;
  wire fpd_cci_noc_axi3_clk;
  wire [93:0]gem0_tsu_timer_cnt;
  wire lpd_axi_noc_clk;
  wire pl0_ref_clk;
  wire pl0_resetn;
  wire pmc_axi_noc_axi0_clk;

  bd_b77e bd_b77e_i
       (.FPD_CCI_NOC_0_araddr(FPD_CCI_NOC_0_araddr),
        .FPD_CCI_NOC_0_arburst(FPD_CCI_NOC_0_arburst),
        .FPD_CCI_NOC_0_arcache(FPD_CCI_NOC_0_arcache),
        .FPD_CCI_NOC_0_arid(FPD_CCI_NOC_0_arid),
        .FPD_CCI_NOC_0_arlen(FPD_CCI_NOC_0_arlen),
        .FPD_CCI_NOC_0_arlock(FPD_CCI_NOC_0_arlock),
        .FPD_CCI_NOC_0_arprot(FPD_CCI_NOC_0_arprot),
        .FPD_CCI_NOC_0_arqos(FPD_CCI_NOC_0_arqos),
        .FPD_CCI_NOC_0_arready(FPD_CCI_NOC_0_arready),
        .FPD_CCI_NOC_0_arsize(FPD_CCI_NOC_0_arsize),
        .FPD_CCI_NOC_0_aruser(FPD_CCI_NOC_0_aruser),
        .FPD_CCI_NOC_0_arvalid(FPD_CCI_NOC_0_arvalid),
        .FPD_CCI_NOC_0_awaddr(FPD_CCI_NOC_0_awaddr),
        .FPD_CCI_NOC_0_awburst(FPD_CCI_NOC_0_awburst),
        .FPD_CCI_NOC_0_awcache(FPD_CCI_NOC_0_awcache),
        .FPD_CCI_NOC_0_awid(FPD_CCI_NOC_0_awid),
        .FPD_CCI_NOC_0_awlen(FPD_CCI_NOC_0_awlen),
        .FPD_CCI_NOC_0_awlock(FPD_CCI_NOC_0_awlock),
        .FPD_CCI_NOC_0_awprot(FPD_CCI_NOC_0_awprot),
        .FPD_CCI_NOC_0_awqos(FPD_CCI_NOC_0_awqos),
        .FPD_CCI_NOC_0_awready(FPD_CCI_NOC_0_awready),
        .FPD_CCI_NOC_0_awsize(FPD_CCI_NOC_0_awsize),
        .FPD_CCI_NOC_0_awuser(FPD_CCI_NOC_0_awuser),
        .FPD_CCI_NOC_0_awvalid(FPD_CCI_NOC_0_awvalid),
        .FPD_CCI_NOC_0_bid(FPD_CCI_NOC_0_bid),
        .FPD_CCI_NOC_0_bready(FPD_CCI_NOC_0_bready),
        .FPD_CCI_NOC_0_bresp(FPD_CCI_NOC_0_bresp),
        .FPD_CCI_NOC_0_bvalid(FPD_CCI_NOC_0_bvalid),
        .FPD_CCI_NOC_0_rdata(FPD_CCI_NOC_0_rdata),
        .FPD_CCI_NOC_0_rid(FPD_CCI_NOC_0_rid),
        .FPD_CCI_NOC_0_rlast(FPD_CCI_NOC_0_rlast),
        .FPD_CCI_NOC_0_rready(FPD_CCI_NOC_0_rready),
        .FPD_CCI_NOC_0_rresp(FPD_CCI_NOC_0_rresp),
        .FPD_CCI_NOC_0_rvalid(FPD_CCI_NOC_0_rvalid),
        .FPD_CCI_NOC_0_wdata(FPD_CCI_NOC_0_wdata),
        .FPD_CCI_NOC_0_wlast(FPD_CCI_NOC_0_wlast),
        .FPD_CCI_NOC_0_wready(FPD_CCI_NOC_0_wready),
        .FPD_CCI_NOC_0_wstrb(FPD_CCI_NOC_0_wstrb),
        .FPD_CCI_NOC_0_wuser(FPD_CCI_NOC_0_wuser),
        .FPD_CCI_NOC_0_wvalid(FPD_CCI_NOC_0_wvalid),
        .FPD_CCI_NOC_1_araddr(FPD_CCI_NOC_1_araddr),
        .FPD_CCI_NOC_1_arburst(FPD_CCI_NOC_1_arburst),
        .FPD_CCI_NOC_1_arcache(FPD_CCI_NOC_1_arcache),
        .FPD_CCI_NOC_1_arid(FPD_CCI_NOC_1_arid),
        .FPD_CCI_NOC_1_arlen(FPD_CCI_NOC_1_arlen),
        .FPD_CCI_NOC_1_arlock(FPD_CCI_NOC_1_arlock),
        .FPD_CCI_NOC_1_arprot(FPD_CCI_NOC_1_arprot),
        .FPD_CCI_NOC_1_arqos(FPD_CCI_NOC_1_arqos),
        .FPD_CCI_NOC_1_arready(FPD_CCI_NOC_1_arready),
        .FPD_CCI_NOC_1_arsize(FPD_CCI_NOC_1_arsize),
        .FPD_CCI_NOC_1_aruser(FPD_CCI_NOC_1_aruser),
        .FPD_CCI_NOC_1_arvalid(FPD_CCI_NOC_1_arvalid),
        .FPD_CCI_NOC_1_awaddr(FPD_CCI_NOC_1_awaddr),
        .FPD_CCI_NOC_1_awburst(FPD_CCI_NOC_1_awburst),
        .FPD_CCI_NOC_1_awcache(FPD_CCI_NOC_1_awcache),
        .FPD_CCI_NOC_1_awid(FPD_CCI_NOC_1_awid),
        .FPD_CCI_NOC_1_awlen(FPD_CCI_NOC_1_awlen),
        .FPD_CCI_NOC_1_awlock(FPD_CCI_NOC_1_awlock),
        .FPD_CCI_NOC_1_awprot(FPD_CCI_NOC_1_awprot),
        .FPD_CCI_NOC_1_awqos(FPD_CCI_NOC_1_awqos),
        .FPD_CCI_NOC_1_awready(FPD_CCI_NOC_1_awready),
        .FPD_CCI_NOC_1_awsize(FPD_CCI_NOC_1_awsize),
        .FPD_CCI_NOC_1_awuser(FPD_CCI_NOC_1_awuser),
        .FPD_CCI_NOC_1_awvalid(FPD_CCI_NOC_1_awvalid),
        .FPD_CCI_NOC_1_bid(FPD_CCI_NOC_1_bid),
        .FPD_CCI_NOC_1_bready(FPD_CCI_NOC_1_bready),
        .FPD_CCI_NOC_1_bresp(FPD_CCI_NOC_1_bresp),
        .FPD_CCI_NOC_1_bvalid(FPD_CCI_NOC_1_bvalid),
        .FPD_CCI_NOC_1_rdata(FPD_CCI_NOC_1_rdata),
        .FPD_CCI_NOC_1_rid(FPD_CCI_NOC_1_rid),
        .FPD_CCI_NOC_1_rlast(FPD_CCI_NOC_1_rlast),
        .FPD_CCI_NOC_1_rready(FPD_CCI_NOC_1_rready),
        .FPD_CCI_NOC_1_rresp(FPD_CCI_NOC_1_rresp),
        .FPD_CCI_NOC_1_rvalid(FPD_CCI_NOC_1_rvalid),
        .FPD_CCI_NOC_1_wdata(FPD_CCI_NOC_1_wdata),
        .FPD_CCI_NOC_1_wlast(FPD_CCI_NOC_1_wlast),
        .FPD_CCI_NOC_1_wready(FPD_CCI_NOC_1_wready),
        .FPD_CCI_NOC_1_wstrb(FPD_CCI_NOC_1_wstrb),
        .FPD_CCI_NOC_1_wuser(FPD_CCI_NOC_1_wuser),
        .FPD_CCI_NOC_1_wvalid(FPD_CCI_NOC_1_wvalid),
        .FPD_CCI_NOC_2_araddr(FPD_CCI_NOC_2_araddr),
        .FPD_CCI_NOC_2_arburst(FPD_CCI_NOC_2_arburst),
        .FPD_CCI_NOC_2_arcache(FPD_CCI_NOC_2_arcache),
        .FPD_CCI_NOC_2_arid(FPD_CCI_NOC_2_arid),
        .FPD_CCI_NOC_2_arlen(FPD_CCI_NOC_2_arlen),
        .FPD_CCI_NOC_2_arlock(FPD_CCI_NOC_2_arlock),
        .FPD_CCI_NOC_2_arprot(FPD_CCI_NOC_2_arprot),
        .FPD_CCI_NOC_2_arqos(FPD_CCI_NOC_2_arqos),
        .FPD_CCI_NOC_2_arready(FPD_CCI_NOC_2_arready),
        .FPD_CCI_NOC_2_arsize(FPD_CCI_NOC_2_arsize),
        .FPD_CCI_NOC_2_aruser(FPD_CCI_NOC_2_aruser),
        .FPD_CCI_NOC_2_arvalid(FPD_CCI_NOC_2_arvalid),
        .FPD_CCI_NOC_2_awaddr(FPD_CCI_NOC_2_awaddr),
        .FPD_CCI_NOC_2_awburst(FPD_CCI_NOC_2_awburst),
        .FPD_CCI_NOC_2_awcache(FPD_CCI_NOC_2_awcache),
        .FPD_CCI_NOC_2_awid(FPD_CCI_NOC_2_awid),
        .FPD_CCI_NOC_2_awlen(FPD_CCI_NOC_2_awlen),
        .FPD_CCI_NOC_2_awlock(FPD_CCI_NOC_2_awlock),
        .FPD_CCI_NOC_2_awprot(FPD_CCI_NOC_2_awprot),
        .FPD_CCI_NOC_2_awqos(FPD_CCI_NOC_2_awqos),
        .FPD_CCI_NOC_2_awready(FPD_CCI_NOC_2_awready),
        .FPD_CCI_NOC_2_awsize(FPD_CCI_NOC_2_awsize),
        .FPD_CCI_NOC_2_awuser(FPD_CCI_NOC_2_awuser),
        .FPD_CCI_NOC_2_awvalid(FPD_CCI_NOC_2_awvalid),
        .FPD_CCI_NOC_2_bid(FPD_CCI_NOC_2_bid),
        .FPD_CCI_NOC_2_bready(FPD_CCI_NOC_2_bready),
        .FPD_CCI_NOC_2_bresp(FPD_CCI_NOC_2_bresp),
        .FPD_CCI_NOC_2_bvalid(FPD_CCI_NOC_2_bvalid),
        .FPD_CCI_NOC_2_rdata(FPD_CCI_NOC_2_rdata),
        .FPD_CCI_NOC_2_rid(FPD_CCI_NOC_2_rid),
        .FPD_CCI_NOC_2_rlast(FPD_CCI_NOC_2_rlast),
        .FPD_CCI_NOC_2_rready(FPD_CCI_NOC_2_rready),
        .FPD_CCI_NOC_2_rresp(FPD_CCI_NOC_2_rresp),
        .FPD_CCI_NOC_2_rvalid(FPD_CCI_NOC_2_rvalid),
        .FPD_CCI_NOC_2_wdata(FPD_CCI_NOC_2_wdata),
        .FPD_CCI_NOC_2_wlast(FPD_CCI_NOC_2_wlast),
        .FPD_CCI_NOC_2_wready(FPD_CCI_NOC_2_wready),
        .FPD_CCI_NOC_2_wstrb(FPD_CCI_NOC_2_wstrb),
        .FPD_CCI_NOC_2_wuser(FPD_CCI_NOC_2_wuser),
        .FPD_CCI_NOC_2_wvalid(FPD_CCI_NOC_2_wvalid),
        .FPD_CCI_NOC_3_araddr(FPD_CCI_NOC_3_araddr),
        .FPD_CCI_NOC_3_arburst(FPD_CCI_NOC_3_arburst),
        .FPD_CCI_NOC_3_arcache(FPD_CCI_NOC_3_arcache),
        .FPD_CCI_NOC_3_arid(FPD_CCI_NOC_3_arid),
        .FPD_CCI_NOC_3_arlen(FPD_CCI_NOC_3_arlen),
        .FPD_CCI_NOC_3_arlock(FPD_CCI_NOC_3_arlock),
        .FPD_CCI_NOC_3_arprot(FPD_CCI_NOC_3_arprot),
        .FPD_CCI_NOC_3_arqos(FPD_CCI_NOC_3_arqos),
        .FPD_CCI_NOC_3_arready(FPD_CCI_NOC_3_arready),
        .FPD_CCI_NOC_3_arsize(FPD_CCI_NOC_3_arsize),
        .FPD_CCI_NOC_3_aruser(FPD_CCI_NOC_3_aruser),
        .FPD_CCI_NOC_3_arvalid(FPD_CCI_NOC_3_arvalid),
        .FPD_CCI_NOC_3_awaddr(FPD_CCI_NOC_3_awaddr),
        .FPD_CCI_NOC_3_awburst(FPD_CCI_NOC_3_awburst),
        .FPD_CCI_NOC_3_awcache(FPD_CCI_NOC_3_awcache),
        .FPD_CCI_NOC_3_awid(FPD_CCI_NOC_3_awid),
        .FPD_CCI_NOC_3_awlen(FPD_CCI_NOC_3_awlen),
        .FPD_CCI_NOC_3_awlock(FPD_CCI_NOC_3_awlock),
        .FPD_CCI_NOC_3_awprot(FPD_CCI_NOC_3_awprot),
        .FPD_CCI_NOC_3_awqos(FPD_CCI_NOC_3_awqos),
        .FPD_CCI_NOC_3_awready(FPD_CCI_NOC_3_awready),
        .FPD_CCI_NOC_3_awsize(FPD_CCI_NOC_3_awsize),
        .FPD_CCI_NOC_3_awuser(FPD_CCI_NOC_3_awuser),
        .FPD_CCI_NOC_3_awvalid(FPD_CCI_NOC_3_awvalid),
        .FPD_CCI_NOC_3_bid(FPD_CCI_NOC_3_bid),
        .FPD_CCI_NOC_3_bready(FPD_CCI_NOC_3_bready),
        .FPD_CCI_NOC_3_bresp(FPD_CCI_NOC_3_bresp),
        .FPD_CCI_NOC_3_bvalid(FPD_CCI_NOC_3_bvalid),
        .FPD_CCI_NOC_3_rdata(FPD_CCI_NOC_3_rdata),
        .FPD_CCI_NOC_3_rid(FPD_CCI_NOC_3_rid),
        .FPD_CCI_NOC_3_rlast(FPD_CCI_NOC_3_rlast),
        .FPD_CCI_NOC_3_rready(FPD_CCI_NOC_3_rready),
        .FPD_CCI_NOC_3_rresp(FPD_CCI_NOC_3_rresp),
        .FPD_CCI_NOC_3_rvalid(FPD_CCI_NOC_3_rvalid),
        .FPD_CCI_NOC_3_wdata(FPD_CCI_NOC_3_wdata),
        .FPD_CCI_NOC_3_wlast(FPD_CCI_NOC_3_wlast),
        .FPD_CCI_NOC_3_wready(FPD_CCI_NOC_3_wready),
        .FPD_CCI_NOC_3_wstrb(FPD_CCI_NOC_3_wstrb),
        .FPD_CCI_NOC_3_wuser(FPD_CCI_NOC_3_wuser),
        .FPD_CCI_NOC_3_wvalid(FPD_CCI_NOC_3_wvalid),
        .LPD_AXI_NOC_0_araddr(LPD_AXI_NOC_0_araddr),
        .LPD_AXI_NOC_0_arburst(LPD_AXI_NOC_0_arburst),
        .LPD_AXI_NOC_0_arcache(LPD_AXI_NOC_0_arcache),
        .LPD_AXI_NOC_0_arid(LPD_AXI_NOC_0_arid),
        .LPD_AXI_NOC_0_arlen(LPD_AXI_NOC_0_arlen),
        .LPD_AXI_NOC_0_arlock(LPD_AXI_NOC_0_arlock),
        .LPD_AXI_NOC_0_arprot(LPD_AXI_NOC_0_arprot),
        .LPD_AXI_NOC_0_arqos(LPD_AXI_NOC_0_arqos),
        .LPD_AXI_NOC_0_arready(LPD_AXI_NOC_0_arready),
        .LPD_AXI_NOC_0_arsize(LPD_AXI_NOC_0_arsize),
        .LPD_AXI_NOC_0_aruser(LPD_AXI_NOC_0_aruser),
        .LPD_AXI_NOC_0_arvalid(LPD_AXI_NOC_0_arvalid),
        .LPD_AXI_NOC_0_awaddr(LPD_AXI_NOC_0_awaddr),
        .LPD_AXI_NOC_0_awburst(LPD_AXI_NOC_0_awburst),
        .LPD_AXI_NOC_0_awcache(LPD_AXI_NOC_0_awcache),
        .LPD_AXI_NOC_0_awid(LPD_AXI_NOC_0_awid),
        .LPD_AXI_NOC_0_awlen(LPD_AXI_NOC_0_awlen),
        .LPD_AXI_NOC_0_awlock(LPD_AXI_NOC_0_awlock),
        .LPD_AXI_NOC_0_awprot(LPD_AXI_NOC_0_awprot),
        .LPD_AXI_NOC_0_awqos(LPD_AXI_NOC_0_awqos),
        .LPD_AXI_NOC_0_awready(LPD_AXI_NOC_0_awready),
        .LPD_AXI_NOC_0_awsize(LPD_AXI_NOC_0_awsize),
        .LPD_AXI_NOC_0_awuser(LPD_AXI_NOC_0_awuser),
        .LPD_AXI_NOC_0_awvalid(LPD_AXI_NOC_0_awvalid),
        .LPD_AXI_NOC_0_bid(LPD_AXI_NOC_0_bid),
        .LPD_AXI_NOC_0_bready(LPD_AXI_NOC_0_bready),
        .LPD_AXI_NOC_0_bresp(LPD_AXI_NOC_0_bresp),
        .LPD_AXI_NOC_0_bvalid(LPD_AXI_NOC_0_bvalid),
        .LPD_AXI_NOC_0_rdata(LPD_AXI_NOC_0_rdata),
        .LPD_AXI_NOC_0_rid(LPD_AXI_NOC_0_rid),
        .LPD_AXI_NOC_0_rlast(LPD_AXI_NOC_0_rlast),
        .LPD_AXI_NOC_0_rready(LPD_AXI_NOC_0_rready),
        .LPD_AXI_NOC_0_rresp(LPD_AXI_NOC_0_rresp),
        .LPD_AXI_NOC_0_rvalid(LPD_AXI_NOC_0_rvalid),
        .LPD_AXI_NOC_0_wdata(LPD_AXI_NOC_0_wdata),
        .LPD_AXI_NOC_0_wlast(LPD_AXI_NOC_0_wlast),
        .LPD_AXI_NOC_0_wready(LPD_AXI_NOC_0_wready),
        .LPD_AXI_NOC_0_wstrb(LPD_AXI_NOC_0_wstrb),
        .LPD_AXI_NOC_0_wvalid(LPD_AXI_NOC_0_wvalid),
        .PMC_NOC_AXI_0_araddr(PMC_NOC_AXI_0_araddr),
        .PMC_NOC_AXI_0_arburst(PMC_NOC_AXI_0_arburst),
        .PMC_NOC_AXI_0_arcache(PMC_NOC_AXI_0_arcache),
        .PMC_NOC_AXI_0_arid(PMC_NOC_AXI_0_arid),
        .PMC_NOC_AXI_0_arlen(PMC_NOC_AXI_0_arlen),
        .PMC_NOC_AXI_0_arlock(PMC_NOC_AXI_0_arlock),
        .PMC_NOC_AXI_0_arprot(PMC_NOC_AXI_0_arprot),
        .PMC_NOC_AXI_0_arqos(PMC_NOC_AXI_0_arqos),
        .PMC_NOC_AXI_0_arready(PMC_NOC_AXI_0_arready),
        .PMC_NOC_AXI_0_arregion(PMC_NOC_AXI_0_arregion),
        .PMC_NOC_AXI_0_arsize(PMC_NOC_AXI_0_arsize),
        .PMC_NOC_AXI_0_aruser(PMC_NOC_AXI_0_aruser),
        .PMC_NOC_AXI_0_arvalid(PMC_NOC_AXI_0_arvalid),
        .PMC_NOC_AXI_0_awaddr(PMC_NOC_AXI_0_awaddr),
        .PMC_NOC_AXI_0_awburst(PMC_NOC_AXI_0_awburst),
        .PMC_NOC_AXI_0_awcache(PMC_NOC_AXI_0_awcache),
        .PMC_NOC_AXI_0_awid(PMC_NOC_AXI_0_awid),
        .PMC_NOC_AXI_0_awlen(PMC_NOC_AXI_0_awlen),
        .PMC_NOC_AXI_0_awlock(PMC_NOC_AXI_0_awlock),
        .PMC_NOC_AXI_0_awprot(PMC_NOC_AXI_0_awprot),
        .PMC_NOC_AXI_0_awqos(PMC_NOC_AXI_0_awqos),
        .PMC_NOC_AXI_0_awready(PMC_NOC_AXI_0_awready),
        .PMC_NOC_AXI_0_awregion(PMC_NOC_AXI_0_awregion),
        .PMC_NOC_AXI_0_awsize(PMC_NOC_AXI_0_awsize),
        .PMC_NOC_AXI_0_awuser(PMC_NOC_AXI_0_awuser),
        .PMC_NOC_AXI_0_awvalid(PMC_NOC_AXI_0_awvalid),
        .PMC_NOC_AXI_0_bid(PMC_NOC_AXI_0_bid),
        .PMC_NOC_AXI_0_bready(PMC_NOC_AXI_0_bready),
        .PMC_NOC_AXI_0_bresp(PMC_NOC_AXI_0_bresp),
        .PMC_NOC_AXI_0_buser(PMC_NOC_AXI_0_buser),
        .PMC_NOC_AXI_0_bvalid(PMC_NOC_AXI_0_bvalid),
        .PMC_NOC_AXI_0_rdata(PMC_NOC_AXI_0_rdata),
        .PMC_NOC_AXI_0_rid(PMC_NOC_AXI_0_rid),
        .PMC_NOC_AXI_0_rlast(PMC_NOC_AXI_0_rlast),
        .PMC_NOC_AXI_0_rready(PMC_NOC_AXI_0_rready),
        .PMC_NOC_AXI_0_rresp(PMC_NOC_AXI_0_rresp),
        .PMC_NOC_AXI_0_ruser(PMC_NOC_AXI_0_ruser),
        .PMC_NOC_AXI_0_rvalid(PMC_NOC_AXI_0_rvalid),
        .PMC_NOC_AXI_0_wdata(PMC_NOC_AXI_0_wdata),
        .PMC_NOC_AXI_0_wid(PMC_NOC_AXI_0_wid),
        .PMC_NOC_AXI_0_wlast(PMC_NOC_AXI_0_wlast),
        .PMC_NOC_AXI_0_wready(PMC_NOC_AXI_0_wready),
        .PMC_NOC_AXI_0_wstrb(PMC_NOC_AXI_0_wstrb),
        .PMC_NOC_AXI_0_wuser(PMC_NOC_AXI_0_wuser),
        .PMC_NOC_AXI_0_wvalid(PMC_NOC_AXI_0_wvalid),
        .fpd_cci_noc_axi0_clk(fpd_cci_noc_axi0_clk),
        .fpd_cci_noc_axi1_clk(fpd_cci_noc_axi1_clk),
        .fpd_cci_noc_axi2_clk(fpd_cci_noc_axi2_clk),
        .fpd_cci_noc_axi3_clk(fpd_cci_noc_axi3_clk),
        .gem0_tsu_timer_cnt(gem0_tsu_timer_cnt),
        .lpd_axi_noc_clk(lpd_axi_noc_clk),
        .pl0_ref_clk(pl0_ref_clk),
        .pl0_resetn(pl0_resetn),
        .pmc_axi_noc_axi0_clk(pmc_axi_noc_axi0_clk));
endmodule
