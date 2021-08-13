// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:axi_dbg_hub:2.0
// IP Revision: 1

(* X_CORE_INFO = "cips_ddr_pl_debug_axi_dbg_hub_0_0_axi_dbg_hub,Vivado 2021.1" *)
(* CHECK_LICENSE_TYPE = "cips_ddr_pl_debug_axi_dbg_hub_0_0,cips_ddr_pl_debug_axi_dbg_hub_0_0_axi_dbg_hub,{}" *)
(* CORE_GENERATION_INFO = "cips_ddr_pl_debug_axi_dbg_hub_0_0,cips_ddr_pl_debug_axi_dbg_hub_0_0_axi_dbg_hub,{x_ipProduct=Vivado 2021.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axi_dbg_hub,x_ipVersion=2.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,x_ipIsDebugCore=true,C_NUM_DEBUG_CORES=0,C_AXI_ID_WIDTH=2,C_AXI_DATA_WIDTH=128,C_AXI_ADDR_WIDTH=64,C_NUM_WR_OUTSTANDING_TXN=1,C_NUM_RD_OUTSTANDING_TXN=1,C_AXIS_TDATA_WIDTH=32,C_ADDR_OFFSET=0x20100000000,C_ADDR_RANGE=0x00200000}" *)
(* DEBUG_CORE_INFO  = "cips_ddr_pl_debug_axi_dbg_hub_0_0,cips_ddr_pl_debug_axi_dbg_hub_0_0_axi_dbg_hub,{x_ipProduct=Vivado 2021.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axi_dbg_hub,x_ipVersion=2.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,x_ipIsDebugCore=true,C_NUM_DEBUG_CORES=0,C_AXI_ID_WIDTH=2,C_AXI_DATA_WIDTH=128,C_AXI_ADDR_WIDTH=64,C_NUM_WR_OUTSTANDING_TXN=1,C_NUM_RD_OUTSTANDING_TXN=1,C_AXIS_TDATA_WIDTH=32,C_ADDR_OFFSET=0x20100000000,C_ADDR_RANGE=0x00200000}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module cips_ddr_pl_debug_axi_dbg_hub_0_0 (
  aclk,
  aresetn,
  s_axi_awid,
  s_axi_awaddr,
  s_axi_awlen,
  s_axi_awsize,
  s_axi_awburst,
  s_axi_awlock,
  s_axi_awcache,
  s_axi_awprot,
  s_axi_awqos,
  s_axi_awregion,
  s_axi_awvalid,
  s_axi_awready,
  s_axi_wdata,
  s_axi_wstrb,
  s_axi_wlast,
  s_axi_wvalid,
  s_axi_wready,
  s_axi_bid,
  s_axi_bresp,
  s_axi_bvalid,
  s_axi_bready,
  s_axi_arid,
  s_axi_araddr,
  s_axi_arlen,
  s_axi_arsize,
  s_axi_arburst,
  s_axi_arlock,
  s_axi_arcache,
  s_axi_arprot,
  s_axi_arqos,
  s_axi_arregion,
  s_axi_arvalid,
  s_axi_arready,
  s_axi_rid,
  s_axi_rdata,
  s_axi_rresp,
  s_axi_rlast,
  s_axi_rvalid,
  s_axi_rready
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF S_AXI:S00_AXIS:S01_AXIS:S02_AXIS:S03_AXIS:S04_AXIS:S05_AXIS:S06_AXIS:S07_AXIS:S08_AXIS:S09_AXIS:S10_AXIS:S11_AXIS:S12_AXIS:S13_AXIS:S14_AXIS:S15_AXIS:S16_AXIS:S17_AXIS:S18_AXIS:S19_AXIS:S20_AXIS:S21_AXIS:S22_AXIS:S23_AXIS:S24_AXIS:S25_AXIS:S26_AXIS:S27_AXIS:S28_AXIS:S29_AXIS:S30_AXIS:S31_AXIS:S32_AXIS:S33_AXIS:S34_AXIS:S35_AXIS:S36_AXIS:S37_AXIS:S38_AXIS:S39_AXIS:S40_AXIS:S41_AXIS:S42_AXIS:S43_AXIS:S44_AXIS:S45_AXIS:S46_AXIS:S47_AXIS:S48_AXIS:S49_AXIS:S50\
_AXIS:S51_AXIS:S52_AXIS:S53_AXIS:S54_AXIS:S55_AXIS:S56_AXIS:S57_AXIS:S58_AXIS:S59_AXIS:S60_AXIS:S61_AXIS:S62_AXIS:S63_AXIS:M00_AXIS:M01_AXIS:M02_AXIS:M03_AXIS:M04_AXIS:M05_AXIS:M06_AXIS:M07_AXIS:M08_AXIS:M09_AXIS:M10_AXIS:M11_AXIS:M12_AXIS:M13_AXIS:M14_AXIS:M15_AXIS:M16_AXIS:M17_AXIS:M18_AXIS:M19_AXIS:M20_AXIS:M21_AXIS:M22_AXIS:M23_AXIS:M24_AXIS:M25_AXIS:M26_AXIS:M27_AXIS:M28_AXIS:M29_AXIS:M30_AXIS:M31_AXIS:M32_AXIS:M33_AXIS:M34_AXIS:M35_AXIS:M36_AXIS:M37_AXIS:M38_AXIS:M39_AXIS:M40_AXIS:M41_AXIS\
:M42_AXIS:M43_AXIS:M44_AXIS:M45_AXIS:M46_AXIS:M47_AXIS:M48_AXIS:M49_AXIS:M50_AXIS:M51_AXIS:M52_AXIS:M53_AXIS:M54_AXIS:M55_AXIS:M56_AXIS:M57_AXIS:M58_AXIS:M59_AXIS:M60_AXIS:M61_AXIS:M62_AXIS:M63_AXIS, ASSOCIATED_RESET aresetn, FREQ_HZ 99999900, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN cips_ddr_pl_debug_clk_wizard_0_0_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWID" *)
input wire [1 : 0] s_axi_awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
input wire [63 : 0] s_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLEN" *)
input wire [7 : 0] s_axi_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWSIZE" *)
input wire [2 : 0] s_axi_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWBURST" *)
input wire [1 : 0] s_axi_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWLOCK" *)
input wire s_axi_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWCACHE" *)
input wire [3 : 0] s_axi_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *)
input wire [2 : 0] s_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWQOS" *)
input wire [3 : 0] s_axi_awqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREGION" *)
input wire [3 : 0] s_axi_awregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
input wire s_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
output wire s_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
input wire [127 : 0] s_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
input wire [15 : 0] s_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WLAST" *)
input wire s_axi_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
input wire s_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
output wire s_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BID" *)
output wire [1 : 0] s_axi_bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
output wire [1 : 0] s_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
output wire s_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
input wire s_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARID" *)
input wire [1 : 0] s_axi_arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
input wire [63 : 0] s_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLEN" *)
input wire [7 : 0] s_axi_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARSIZE" *)
input wire [2 : 0] s_axi_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARBURST" *)
input wire [1 : 0] s_axi_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARLOCK" *)
input wire s_axi_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARCACHE" *)
input wire [3 : 0] s_axi_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *)
input wire [2 : 0] s_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARQOS" *)
input wire [3 : 0] s_axi_arqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREGION" *)
input wire [3 : 0] s_axi_arregion;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
input wire s_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
output wire s_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RID" *)
output wire [1 : 0] s_axi_rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
output wire [127 : 0] s_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
output wire [1 : 0] s_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RLAST" *)
output wire s_axi_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
output wire s_axi_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 128, PROTOCOL AXI4, FREQ_HZ 99999900, ID_WIDTH 2, ADDR_WIDTH 64, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 32, NUM_WRITE_OUTSTANDING 32, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN cips_ddr_pl_debug_clk_wizard_0_0_clk_out1, NUM_READ_THREADS \
4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
input wire s_axi_rready;

  cips_ddr_pl_debug_axi_dbg_hub_0_0_axi_dbg_hub #(
    .C_NUM_DEBUG_CORES(0),
    .C_AXI_ID_WIDTH(2),
    .C_AXI_DATA_WIDTH(128),
    .C_AXI_ADDR_WIDTH(64),
    .C_NUM_WR_OUTSTANDING_TXN(1),
    .C_NUM_RD_OUTSTANDING_TXN(1),
    .C_AXIS_TDATA_WIDTH(32),
    .C_ADDR_OFFSET(44'H20100000000),
    .C_ADDR_RANGE(32'H00200000)
  ) inst (
    .aclk(aclk),
    .aresetn(aresetn),
    .s_axi_awid(s_axi_awid),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awlen(s_axi_awlen),
    .s_axi_awsize(s_axi_awsize),
    .s_axi_awburst(s_axi_awburst),
    .s_axi_awlock(s_axi_awlock),
    .s_axi_awcache(s_axi_awcache),
    .s_axi_awprot(s_axi_awprot),
    .s_axi_awqos(s_axi_awqos),
    .s_axi_awregion(s_axi_awregion),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wlast(s_axi_wlast),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_bid(s_axi_bid),
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    .s_axi_arid(s_axi_arid),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arlen(s_axi_arlen),
    .s_axi_arsize(s_axi_arsize),
    .s_axi_arburst(s_axi_arburst),
    .s_axi_arlock(s_axi_arlock),
    .s_axi_arcache(s_axi_arcache),
    .s_axi_arprot(s_axi_arprot),
    .s_axi_arqos(s_axi_arqos),
    .s_axi_arregion(s_axi_arregion),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_rid(s_axi_rid),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rlast(s_axi_rlast),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    .s00_axis_tready(),
    .s00_axis_tdata(32'B0),
    .s00_axis_tlast(1'B0),
    .s00_axis_tvalid(1'B0),
    .m00_axis_tvalid(),
    .m00_axis_tdata(),
    .m00_axis_tlast(),
    .m00_axis_tready(1'B1),
    .s01_axis_tready(),
    .s01_axis_tdata(32'B0),
    .s01_axis_tlast(1'B0),
    .s01_axis_tvalid(1'B0),
    .m01_axis_tvalid(),
    .m01_axis_tdata(),
    .m01_axis_tlast(),
    .m01_axis_tready(1'B1),
    .s02_axis_tready(),
    .s02_axis_tdata(32'B0),
    .s02_axis_tlast(1'B0),
    .s02_axis_tvalid(1'B0),
    .m02_axis_tvalid(),
    .m02_axis_tdata(),
    .m02_axis_tlast(),
    .m02_axis_tready(1'B1),
    .s03_axis_tready(),
    .s03_axis_tdata(32'B0),
    .s03_axis_tlast(1'B0),
    .s03_axis_tvalid(1'B0),
    .m03_axis_tvalid(),
    .m03_axis_tdata(),
    .m03_axis_tlast(),
    .m03_axis_tready(1'B1),
    .s04_axis_tready(),
    .s04_axis_tdata(32'B0),
    .s04_axis_tlast(1'B0),
    .s04_axis_tvalid(1'B0),
    .m04_axis_tvalid(),
    .m04_axis_tdata(),
    .m04_axis_tlast(),
    .m04_axis_tready(1'B1),
    .s05_axis_tready(),
    .s05_axis_tdata(32'B0),
    .s05_axis_tlast(1'B0),
    .s05_axis_tvalid(1'B0),
    .m05_axis_tvalid(),
    .m05_axis_tdata(),
    .m05_axis_tlast(),
    .m05_axis_tready(1'B1),
    .s06_axis_tready(),
    .s06_axis_tdata(32'B0),
    .s06_axis_tlast(1'B0),
    .s06_axis_tvalid(1'B0),
    .m06_axis_tvalid(),
    .m06_axis_tdata(),
    .m06_axis_tlast(),
    .m06_axis_tready(1'B1),
    .s07_axis_tready(),
    .s07_axis_tdata(32'B0),
    .s07_axis_tlast(1'B0),
    .s07_axis_tvalid(1'B0),
    .m07_axis_tvalid(),
    .m07_axis_tdata(),
    .m07_axis_tlast(),
    .m07_axis_tready(1'B1),
    .s08_axis_tready(),
    .s08_axis_tdata(32'B0),
    .s08_axis_tlast(1'B0),
    .s08_axis_tvalid(1'B0),
    .m08_axis_tvalid(),
    .m08_axis_tdata(),
    .m08_axis_tlast(),
    .m08_axis_tready(1'B1),
    .s09_axis_tready(),
    .s09_axis_tdata(32'B0),
    .s09_axis_tlast(1'B0),
    .s09_axis_tvalid(1'B0),
    .m09_axis_tvalid(),
    .m09_axis_tdata(),
    .m09_axis_tlast(),
    .m09_axis_tready(1'B1),
    .s10_axis_tready(),
    .s10_axis_tdata(32'B0),
    .s10_axis_tlast(1'B0),
    .s10_axis_tvalid(1'B0),
    .m10_axis_tvalid(),
    .m10_axis_tdata(),
    .m10_axis_tlast(),
    .m10_axis_tready(1'B1),
    .s11_axis_tready(),
    .s11_axis_tdata(32'B0),
    .s11_axis_tlast(1'B0),
    .s11_axis_tvalid(1'B0),
    .m11_axis_tvalid(),
    .m11_axis_tdata(),
    .m11_axis_tlast(),
    .m11_axis_tready(1'B1),
    .s12_axis_tready(),
    .s12_axis_tdata(32'B0),
    .s12_axis_tlast(1'B0),
    .s12_axis_tvalid(1'B0),
    .m12_axis_tvalid(),
    .m12_axis_tdata(),
    .m12_axis_tlast(),
    .m12_axis_tready(1'B1),
    .s13_axis_tready(),
    .s13_axis_tdata(32'B0),
    .s13_axis_tlast(1'B0),
    .s13_axis_tvalid(1'B0),
    .m13_axis_tvalid(),
    .m13_axis_tdata(),
    .m13_axis_tlast(),
    .m13_axis_tready(1'B1),
    .s14_axis_tready(),
    .s14_axis_tdata(32'B0),
    .s14_axis_tlast(1'B0),
    .s14_axis_tvalid(1'B0),
    .m14_axis_tvalid(),
    .m14_axis_tdata(),
    .m14_axis_tlast(),
    .m14_axis_tready(1'B1),
    .s15_axis_tready(),
    .s15_axis_tdata(32'B0),
    .s15_axis_tlast(1'B0),
    .s15_axis_tvalid(1'B0),
    .m15_axis_tvalid(),
    .m15_axis_tdata(),
    .m15_axis_tlast(),
    .m15_axis_tready(1'B1),
    .s16_axis_tready(),
    .s16_axis_tdata(32'B0),
    .s16_axis_tlast(1'B0),
    .s16_axis_tvalid(1'B0),
    .m16_axis_tvalid(),
    .m16_axis_tdata(),
    .m16_axis_tlast(),
    .m16_axis_tready(1'B1),
    .s17_axis_tready(),
    .s17_axis_tdata(32'B0),
    .s17_axis_tlast(1'B0),
    .s17_axis_tvalid(1'B0),
    .m17_axis_tvalid(),
    .m17_axis_tdata(),
    .m17_axis_tlast(),
    .m17_axis_tready(1'B1),
    .s18_axis_tready(),
    .s18_axis_tdata(32'B0),
    .s18_axis_tlast(1'B0),
    .s18_axis_tvalid(1'B0),
    .m18_axis_tvalid(),
    .m18_axis_tdata(),
    .m18_axis_tlast(),
    .m18_axis_tready(1'B1),
    .s19_axis_tready(),
    .s19_axis_tdata(32'B0),
    .s19_axis_tlast(1'B0),
    .s19_axis_tvalid(1'B0),
    .m19_axis_tvalid(),
    .m19_axis_tdata(),
    .m19_axis_tlast(),
    .m19_axis_tready(1'B1),
    .s20_axis_tready(),
    .s20_axis_tdata(32'B0),
    .s20_axis_tlast(1'B0),
    .s20_axis_tvalid(1'B0),
    .m20_axis_tvalid(),
    .m20_axis_tdata(),
    .m20_axis_tlast(),
    .m20_axis_tready(1'B1),
    .s21_axis_tready(),
    .s21_axis_tdata(32'B0),
    .s21_axis_tlast(1'B0),
    .s21_axis_tvalid(1'B0),
    .m21_axis_tvalid(),
    .m21_axis_tdata(),
    .m21_axis_tlast(),
    .m21_axis_tready(1'B1),
    .s22_axis_tready(),
    .s22_axis_tdata(32'B0),
    .s22_axis_tlast(1'B0),
    .s22_axis_tvalid(1'B0),
    .m22_axis_tvalid(),
    .m22_axis_tdata(),
    .m22_axis_tlast(),
    .m22_axis_tready(1'B1),
    .s23_axis_tready(),
    .s23_axis_tdata(32'B0),
    .s23_axis_tlast(1'B0),
    .s23_axis_tvalid(1'B0),
    .m23_axis_tvalid(),
    .m23_axis_tdata(),
    .m23_axis_tlast(),
    .m23_axis_tready(1'B1),
    .s24_axis_tready(),
    .s24_axis_tdata(32'B0),
    .s24_axis_tlast(1'B0),
    .s24_axis_tvalid(1'B0),
    .m24_axis_tvalid(),
    .m24_axis_tdata(),
    .m24_axis_tlast(),
    .m24_axis_tready(1'B1),
    .s25_axis_tready(),
    .s25_axis_tdata(32'B0),
    .s25_axis_tlast(1'B0),
    .s25_axis_tvalid(1'B0),
    .m25_axis_tvalid(),
    .m25_axis_tdata(),
    .m25_axis_tlast(),
    .m25_axis_tready(1'B1),
    .s26_axis_tready(),
    .s26_axis_tdata(32'B0),
    .s26_axis_tlast(1'B0),
    .s26_axis_tvalid(1'B0),
    .m26_axis_tvalid(),
    .m26_axis_tdata(),
    .m26_axis_tlast(),
    .m26_axis_tready(1'B1),
    .s27_axis_tready(),
    .s27_axis_tdata(32'B0),
    .s27_axis_tlast(1'B0),
    .s27_axis_tvalid(1'B0),
    .m27_axis_tvalid(),
    .m27_axis_tdata(),
    .m27_axis_tlast(),
    .m27_axis_tready(1'B1),
    .s28_axis_tready(),
    .s28_axis_tdata(32'B0),
    .s28_axis_tlast(1'B0),
    .s28_axis_tvalid(1'B0),
    .m28_axis_tvalid(),
    .m28_axis_tdata(),
    .m28_axis_tlast(),
    .m28_axis_tready(1'B1),
    .s29_axis_tready(),
    .s29_axis_tdata(32'B0),
    .s29_axis_tlast(1'B0),
    .s29_axis_tvalid(1'B0),
    .m29_axis_tvalid(),
    .m29_axis_tdata(),
    .m29_axis_tlast(),
    .m29_axis_tready(1'B1),
    .s30_axis_tready(),
    .s30_axis_tdata(32'B0),
    .s30_axis_tlast(1'B0),
    .s30_axis_tvalid(1'B0),
    .m30_axis_tvalid(),
    .m30_axis_tdata(),
    .m30_axis_tlast(),
    .m30_axis_tready(1'B1),
    .s31_axis_tready(),
    .s31_axis_tdata(32'B0),
    .s31_axis_tlast(1'B0),
    .s31_axis_tvalid(1'B0),
    .m31_axis_tvalid(),
    .m31_axis_tdata(),
    .m31_axis_tlast(),
    .m31_axis_tready(1'B1),
    .s32_axis_tready(),
    .s32_axis_tdata(32'B0),
    .s32_axis_tlast(1'B0),
    .s32_axis_tvalid(1'B0),
    .m32_axis_tvalid(),
    .m32_axis_tdata(),
    .m32_axis_tlast(),
    .m32_axis_tready(1'B1),
    .s33_axis_tready(),
    .s33_axis_tdata(32'B0),
    .s33_axis_tlast(1'B0),
    .s33_axis_tvalid(1'B0),
    .m33_axis_tvalid(),
    .m33_axis_tdata(),
    .m33_axis_tlast(),
    .m33_axis_tready(1'B1),
    .s34_axis_tready(),
    .s34_axis_tdata(32'B0),
    .s34_axis_tlast(1'B0),
    .s34_axis_tvalid(1'B0),
    .m34_axis_tvalid(),
    .m34_axis_tdata(),
    .m34_axis_tlast(),
    .m34_axis_tready(1'B1),
    .s35_axis_tready(),
    .s35_axis_tdata(32'B0),
    .s35_axis_tlast(1'B0),
    .s35_axis_tvalid(1'B0),
    .m35_axis_tvalid(),
    .m35_axis_tdata(),
    .m35_axis_tlast(),
    .m35_axis_tready(1'B1),
    .s36_axis_tready(),
    .s36_axis_tdata(32'B0),
    .s36_axis_tlast(1'B0),
    .s36_axis_tvalid(1'B0),
    .m36_axis_tvalid(),
    .m36_axis_tdata(),
    .m36_axis_tlast(),
    .m36_axis_tready(1'B1),
    .s37_axis_tready(),
    .s37_axis_tdata(32'B0),
    .s37_axis_tlast(1'B0),
    .s37_axis_tvalid(1'B0),
    .m37_axis_tvalid(),
    .m37_axis_tdata(),
    .m37_axis_tlast(),
    .m37_axis_tready(1'B1),
    .s38_axis_tready(),
    .s38_axis_tdata(32'B0),
    .s38_axis_tlast(1'B0),
    .s38_axis_tvalid(1'B0),
    .m38_axis_tvalid(),
    .m38_axis_tdata(),
    .m38_axis_tlast(),
    .m38_axis_tready(1'B1),
    .s39_axis_tready(),
    .s39_axis_tdata(32'B0),
    .s39_axis_tlast(1'B0),
    .s39_axis_tvalid(1'B0),
    .m39_axis_tvalid(),
    .m39_axis_tdata(),
    .m39_axis_tlast(),
    .m39_axis_tready(1'B1),
    .s40_axis_tready(),
    .s40_axis_tdata(32'B0),
    .s40_axis_tlast(1'B0),
    .s40_axis_tvalid(1'B0),
    .m40_axis_tvalid(),
    .m40_axis_tdata(),
    .m40_axis_tlast(),
    .m40_axis_tready(1'B1),
    .s41_axis_tready(),
    .s41_axis_tdata(32'B0),
    .s41_axis_tlast(1'B0),
    .s41_axis_tvalid(1'B0),
    .m41_axis_tvalid(),
    .m41_axis_tdata(),
    .m41_axis_tlast(),
    .m41_axis_tready(1'B1),
    .s42_axis_tready(),
    .s42_axis_tdata(32'B0),
    .s42_axis_tlast(1'B0),
    .s42_axis_tvalid(1'B0),
    .m42_axis_tvalid(),
    .m42_axis_tdata(),
    .m42_axis_tlast(),
    .m42_axis_tready(1'B1),
    .s43_axis_tready(),
    .s43_axis_tdata(32'B0),
    .s43_axis_tlast(1'B0),
    .s43_axis_tvalid(1'B0),
    .m43_axis_tvalid(),
    .m43_axis_tdata(),
    .m43_axis_tlast(),
    .m43_axis_tready(1'B1),
    .s44_axis_tready(),
    .s44_axis_tdata(32'B0),
    .s44_axis_tlast(1'B0),
    .s44_axis_tvalid(1'B0),
    .m44_axis_tvalid(),
    .m44_axis_tdata(),
    .m44_axis_tlast(),
    .m44_axis_tready(1'B1),
    .s45_axis_tready(),
    .s45_axis_tdata(32'B0),
    .s45_axis_tlast(1'B0),
    .s45_axis_tvalid(1'B0),
    .m45_axis_tvalid(),
    .m45_axis_tdata(),
    .m45_axis_tlast(),
    .m45_axis_tready(1'B1),
    .s46_axis_tready(),
    .s46_axis_tdata(32'B0),
    .s46_axis_tlast(1'B0),
    .s46_axis_tvalid(1'B0),
    .m46_axis_tvalid(),
    .m46_axis_tdata(),
    .m46_axis_tlast(),
    .m46_axis_tready(1'B1),
    .s47_axis_tready(),
    .s47_axis_tdata(32'B0),
    .s47_axis_tlast(1'B0),
    .s47_axis_tvalid(1'B0),
    .m47_axis_tvalid(),
    .m47_axis_tdata(),
    .m47_axis_tlast(),
    .m47_axis_tready(1'B1),
    .s48_axis_tready(),
    .s48_axis_tdata(32'B0),
    .s48_axis_tlast(1'B0),
    .s48_axis_tvalid(1'B0),
    .m48_axis_tvalid(),
    .m48_axis_tdata(),
    .m48_axis_tlast(),
    .m48_axis_tready(1'B1),
    .s49_axis_tready(),
    .s49_axis_tdata(32'B0),
    .s49_axis_tlast(1'B0),
    .s49_axis_tvalid(1'B0),
    .m49_axis_tvalid(),
    .m49_axis_tdata(),
    .m49_axis_tlast(),
    .m49_axis_tready(1'B1),
    .s50_axis_tready(),
    .s50_axis_tdata(32'B0),
    .s50_axis_tlast(1'B0),
    .s50_axis_tvalid(1'B0),
    .m50_axis_tvalid(),
    .m50_axis_tdata(),
    .m50_axis_tlast(),
    .m50_axis_tready(1'B1),
    .s51_axis_tready(),
    .s51_axis_tdata(32'B0),
    .s51_axis_tlast(1'B0),
    .s51_axis_tvalid(1'B0),
    .m51_axis_tvalid(),
    .m51_axis_tdata(),
    .m51_axis_tlast(),
    .m51_axis_tready(1'B1),
    .s52_axis_tready(),
    .s52_axis_tdata(32'B0),
    .s52_axis_tlast(1'B0),
    .s52_axis_tvalid(1'B0),
    .m52_axis_tvalid(),
    .m52_axis_tdata(),
    .m52_axis_tlast(),
    .m52_axis_tready(1'B1),
    .s53_axis_tready(),
    .s53_axis_tdata(32'B0),
    .s53_axis_tlast(1'B0),
    .s53_axis_tvalid(1'B0),
    .m53_axis_tvalid(),
    .m53_axis_tdata(),
    .m53_axis_tlast(),
    .m53_axis_tready(1'B1),
    .s54_axis_tready(),
    .s54_axis_tdata(32'B0),
    .s54_axis_tlast(1'B0),
    .s54_axis_tvalid(1'B0),
    .m54_axis_tvalid(),
    .m54_axis_tdata(),
    .m54_axis_tlast(),
    .m54_axis_tready(1'B1),
    .s55_axis_tready(),
    .s55_axis_tdata(32'B0),
    .s55_axis_tlast(1'B0),
    .s55_axis_tvalid(1'B0),
    .m55_axis_tvalid(),
    .m55_axis_tdata(),
    .m55_axis_tlast(),
    .m55_axis_tready(1'B1),
    .s56_axis_tready(),
    .s56_axis_tdata(32'B0),
    .s56_axis_tlast(1'B0),
    .s56_axis_tvalid(1'B0),
    .m56_axis_tvalid(),
    .m56_axis_tdata(),
    .m56_axis_tlast(),
    .m56_axis_tready(1'B1),
    .s57_axis_tready(),
    .s57_axis_tdata(32'B0),
    .s57_axis_tlast(1'B0),
    .s57_axis_tvalid(1'B0),
    .m57_axis_tvalid(),
    .m57_axis_tdata(),
    .m57_axis_tlast(),
    .m57_axis_tready(1'B1),
    .s58_axis_tready(),
    .s58_axis_tdata(32'B0),
    .s58_axis_tlast(1'B0),
    .s58_axis_tvalid(1'B0),
    .m58_axis_tvalid(),
    .m58_axis_tdata(),
    .m58_axis_tlast(),
    .m58_axis_tready(1'B1),
    .s59_axis_tready(),
    .s59_axis_tdata(32'B0),
    .s59_axis_tlast(1'B0),
    .s59_axis_tvalid(1'B0),
    .m59_axis_tvalid(),
    .m59_axis_tdata(),
    .m59_axis_tlast(),
    .m59_axis_tready(1'B1),
    .s60_axis_tready(),
    .s60_axis_tdata(32'B0),
    .s60_axis_tlast(1'B0),
    .s60_axis_tvalid(1'B0),
    .m60_axis_tvalid(),
    .m60_axis_tdata(),
    .m60_axis_tlast(),
    .m60_axis_tready(1'B1),
    .s61_axis_tready(),
    .s61_axis_tdata(32'B0),
    .s61_axis_tlast(1'B0),
    .s61_axis_tvalid(1'B0),
    .m61_axis_tvalid(),
    .m61_axis_tdata(),
    .m61_axis_tlast(),
    .m61_axis_tready(1'B1),
    .s62_axis_tready(),
    .s62_axis_tdata(32'B0),
    .s62_axis_tlast(1'B0),
    .s62_axis_tvalid(1'B0),
    .m62_axis_tvalid(),
    .m62_axis_tdata(),
    .m62_axis_tlast(),
    .m62_axis_tready(1'B1),
    .s63_axis_tready(),
    .s63_axis_tdata(32'B0),
    .s63_axis_tlast(1'B0),
    .s63_axis_tvalid(1'B0),
    .m63_axis_tvalid(),
    .m63_axis_tdata(),
    .m63_axis_tlast(),
    .m63_axis_tready(1'B1)
  );
endmodule
