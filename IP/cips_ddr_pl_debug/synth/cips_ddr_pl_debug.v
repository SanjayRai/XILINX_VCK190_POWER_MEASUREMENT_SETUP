//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Tue Aug 24 13:09:56 2021
//Host        : mcxlnx running 64-bit CentOS Linux release 7.7.1908 (Core)
//Command     : generate_target cips_ddr_pl_debug.bd
//Design      : cips_ddr_pl_debug
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "cips_ddr_pl_debug,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=cips_ddr_pl_debug,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_board_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "cips_ddr_pl_debug.hwdef" *) 
module cips_ddr_pl_debug
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CIPS_CLOCK_OUT_100M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CIPS_CLOCK_OUT_100M, CLK_DOMAIN cips_ddr_pl_debug_clk_wizard_0_0_clk_out1, FREQ_HZ 99999900, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output CIPS_CLOCK_OUT_100M;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 ACT_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr4_dimm1, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) output ddr4_dimm1_act_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 ADR" *) output [16:0]ddr4_dimm1_adr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 BA" *) output [1:0]ddr4_dimm1_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 BG" *) output [1:0]ddr4_dimm1_bg;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 CK_C" *) output ddr4_dimm1_ck_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 CK_T" *) output ddr4_dimm1_ck_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 CKE" *) output ddr4_dimm1_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 CS_N" *) output ddr4_dimm1_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 DM_N" *) inout [7:0]ddr4_dimm1_dm_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 DQ" *) inout [63:0]ddr4_dimm1_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 DQS_C" *) inout [7:0]ddr4_dimm1_dqs_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 DQS_T" *) inout [7:0]ddr4_dimm1_dqs_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 ODT" *) output ddr4_dimm1_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 ddr4_dimm1 RESET_N" *) output ddr4_dimm1_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 ddr4_dimm1_sma_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ddr4_dimm1_sma_clk, CAN_DEBUG false, FREQ_HZ 200000000" *) input ddr4_dimm1_sma_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 ddr4_dimm1_sma_clk CLK_P" *) input ddr4_dimm1_sma_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gpio:1.0 gpio_rtl TRI_O" *) output [3:0]gpio_rtl_tri_o;

  wire [12:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire [12:0]axi_bram_ctrl_0_BRAM_PORTB_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTB_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTB_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTB_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTB_EN;
  wire axi_bram_ctrl_0_BRAM_PORTB_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTB_WE;
  wire [3:0]axi_gpio_0_GPIO_TRI_O;
  wire [8:0]axi_gpio_0_smc_M00_AXI_ARADDR;
  wire axi_gpio_0_smc_M00_AXI_ARREADY;
  wire axi_gpio_0_smc_M00_AXI_ARVALID;
  wire [8:0]axi_gpio_0_smc_M00_AXI_AWADDR;
  wire axi_gpio_0_smc_M00_AXI_AWREADY;
  wire axi_gpio_0_smc_M00_AXI_AWVALID;
  wire axi_gpio_0_smc_M00_AXI_BREADY;
  wire [1:0]axi_gpio_0_smc_M00_AXI_BRESP;
  wire axi_gpio_0_smc_M00_AXI_BVALID;
  wire [31:0]axi_gpio_0_smc_M00_AXI_RDATA;
  wire axi_gpio_0_smc_M00_AXI_RREADY;
  wire [1:0]axi_gpio_0_smc_M00_AXI_RRESP;
  wire axi_gpio_0_smc_M00_AXI_RVALID;
  wire [31:0]axi_gpio_0_smc_M00_AXI_WDATA;
  wire axi_gpio_0_smc_M00_AXI_WREADY;
  wire [3:0]axi_gpio_0_smc_M00_AXI_WSTRB;
  wire axi_gpio_0_smc_M00_AXI_WVALID;
  wire [0:0]axi_noc_0_CH0_DDR4_0_ACT_N;
  wire [16:0]axi_noc_0_CH0_DDR4_0_ADR;
  wire [1:0]axi_noc_0_CH0_DDR4_0_BA;
  wire [1:0]axi_noc_0_CH0_DDR4_0_BG;
  wire [0:0]axi_noc_0_CH0_DDR4_0_CKE;
  wire [0:0]axi_noc_0_CH0_DDR4_0_CK_C;
  wire [0:0]axi_noc_0_CH0_DDR4_0_CK_T;
  wire [0:0]axi_noc_0_CH0_DDR4_0_CS_N;
  wire [7:0]axi_noc_0_CH0_DDR4_0_DM_N;
  wire [63:0]axi_noc_0_CH0_DDR4_0_DQ;
  wire [7:0]axi_noc_0_CH0_DDR4_0_DQS_C;
  wire [7:0]axi_noc_0_CH0_DDR4_0_DQS_T;
  wire [0:0]axi_noc_0_CH0_DDR4_0_ODT;
  wire [0:0]axi_noc_0_CH0_DDR4_0_RESET_N;
  wire [63:0]axi_noc_0_M00_AXI_ARADDR;
  wire [1:0]axi_noc_0_M00_AXI_ARBURST;
  wire [3:0]axi_noc_0_M00_AXI_ARCACHE;
  wire [1:0]axi_noc_0_M00_AXI_ARID;
  wire [7:0]axi_noc_0_M00_AXI_ARLEN;
  wire [0:0]axi_noc_0_M00_AXI_ARLOCK;
  wire [2:0]axi_noc_0_M00_AXI_ARPROT;
  wire [3:0]axi_noc_0_M00_AXI_ARQOS;
  wire axi_noc_0_M00_AXI_ARREADY;
  wire [3:0]axi_noc_0_M00_AXI_ARREGION;
  wire [2:0]axi_noc_0_M00_AXI_ARSIZE;
  wire [0:0]axi_noc_0_M00_AXI_ARVALID;
  wire [63:0]axi_noc_0_M00_AXI_AWADDR;
  wire [1:0]axi_noc_0_M00_AXI_AWBURST;
  wire [3:0]axi_noc_0_M00_AXI_AWCACHE;
  wire [1:0]axi_noc_0_M00_AXI_AWID;
  wire [7:0]axi_noc_0_M00_AXI_AWLEN;
  wire [0:0]axi_noc_0_M00_AXI_AWLOCK;
  wire [2:0]axi_noc_0_M00_AXI_AWPROT;
  wire [3:0]axi_noc_0_M00_AXI_AWQOS;
  wire axi_noc_0_M00_AXI_AWREADY;
  wire [3:0]axi_noc_0_M00_AXI_AWREGION;
  wire [2:0]axi_noc_0_M00_AXI_AWSIZE;
  wire [0:0]axi_noc_0_M00_AXI_AWVALID;
  wire [1:0]axi_noc_0_M00_AXI_BID;
  wire [0:0]axi_noc_0_M00_AXI_BREADY;
  wire [1:0]axi_noc_0_M00_AXI_BRESP;
  wire axi_noc_0_M00_AXI_BVALID;
  wire [127:0]axi_noc_0_M00_AXI_RDATA;
  wire [1:0]axi_noc_0_M00_AXI_RID;
  wire axi_noc_0_M00_AXI_RLAST;
  wire [0:0]axi_noc_0_M00_AXI_RREADY;
  wire [1:0]axi_noc_0_M00_AXI_RRESP;
  wire axi_noc_0_M00_AXI_RVALID;
  wire [127:0]axi_noc_0_M00_AXI_WDATA;
  wire [0:0]axi_noc_0_M00_AXI_WLAST;
  wire axi_noc_0_M00_AXI_WREADY;
  wire [15:0]axi_noc_0_M00_AXI_WSTRB;
  wire [0:0]axi_noc_0_M00_AXI_WVALID;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARADDR" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]axi_noc_0_M01_AXI_ARADDR;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARBURST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_noc_0_M01_AXI_ARBURST;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARCACHE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_noc_0_M01_AXI_ARCACHE;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_noc_0_M01_AXI_ARID;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLEN" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]axi_noc_0_M01_AXI_ARLEN;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLOCK" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axi_noc_0_M01_AXI_ARLOCK;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARPROT" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_noc_0_M01_AXI_ARPROT;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARQOS" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_noc_0_M01_AXI_ARQOS;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_noc_0_M01_AXI_ARREADY;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARREGION" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_noc_0_M01_AXI_ARREGION;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARSIZE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_noc_0_M01_AXI_ARSIZE;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARUSER" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [17:0]axi_noc_0_M01_AXI_ARUSER;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 ARVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axi_noc_0_M01_AXI_ARVALID;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWADDR" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]axi_noc_0_M01_AXI_AWADDR;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWBURST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_noc_0_M01_AXI_AWBURST;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWCACHE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_noc_0_M01_AXI_AWCACHE;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_noc_0_M01_AXI_AWID;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLEN" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]axi_noc_0_M01_AXI_AWLEN;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLOCK" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axi_noc_0_M01_AXI_AWLOCK;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWPROT" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_noc_0_M01_AXI_AWPROT;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWQOS" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_noc_0_M01_AXI_AWQOS;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_noc_0_M01_AXI_AWREADY;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWREGION" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_noc_0_M01_AXI_AWREGION;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWSIZE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_noc_0_M01_AXI_AWSIZE;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWUSER" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [17:0]axi_noc_0_M01_AXI_AWUSER;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 AWVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axi_noc_0_M01_AXI_AWVALID;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 BID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_noc_0_M01_AXI_BID;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 BREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axi_noc_0_M01_AXI_BREADY;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 BRESP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_noc_0_M01_AXI_BRESP;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 BVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_noc_0_M01_AXI_BVALID;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 RDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axi_noc_0_M01_AXI_RDATA;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 RID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_noc_0_M01_AXI_RID;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 RLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_noc_0_M01_AXI_RLAST;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 RREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axi_noc_0_M01_AXI_RREADY;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 RRESP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_noc_0_M01_AXI_RRESP;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 RVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_noc_0_M01_AXI_RVALID;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 WDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axi_noc_0_M01_AXI_WDATA;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 WLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axi_noc_0_M01_AXI_WLAST;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 WREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_noc_0_M01_AXI_WREADY;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 WSTRB" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_noc_0_M01_AXI_WSTRB;
  (* CONN_BUS_INFO = "axi_noc_0_M01_AXI xilinx.com:interface:aximm:1.0 AXI4 WVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axi_noc_0_M01_AXI_WVALID;
  wire [63:0]axi_noc_0_M02_AXI_ARADDR;
  wire [1:0]axi_noc_0_M02_AXI_ARBURST;
  wire [3:0]axi_noc_0_M02_AXI_ARCACHE;
  wire [1:0]axi_noc_0_M02_AXI_ARID;
  wire [7:0]axi_noc_0_M02_AXI_ARLEN;
  wire [0:0]axi_noc_0_M02_AXI_ARLOCK;
  wire [2:0]axi_noc_0_M02_AXI_ARPROT;
  wire [3:0]axi_noc_0_M02_AXI_ARQOS;
  wire axi_noc_0_M02_AXI_ARREADY;
  wire [2:0]axi_noc_0_M02_AXI_ARSIZE;
  wire [17:0]axi_noc_0_M02_AXI_ARUSER;
  wire [0:0]axi_noc_0_M02_AXI_ARVALID;
  wire [63:0]axi_noc_0_M02_AXI_AWADDR;
  wire [1:0]axi_noc_0_M02_AXI_AWBURST;
  wire [3:0]axi_noc_0_M02_AXI_AWCACHE;
  wire [1:0]axi_noc_0_M02_AXI_AWID;
  wire [7:0]axi_noc_0_M02_AXI_AWLEN;
  wire [0:0]axi_noc_0_M02_AXI_AWLOCK;
  wire [2:0]axi_noc_0_M02_AXI_AWPROT;
  wire [3:0]axi_noc_0_M02_AXI_AWQOS;
  wire axi_noc_0_M02_AXI_AWREADY;
  wire [2:0]axi_noc_0_M02_AXI_AWSIZE;
  wire [17:0]axi_noc_0_M02_AXI_AWUSER;
  wire [0:0]axi_noc_0_M02_AXI_AWVALID;
  wire [1:0]axi_noc_0_M02_AXI_BID;
  wire [0:0]axi_noc_0_M02_AXI_BREADY;
  wire [1:0]axi_noc_0_M02_AXI_BRESP;
  wire axi_noc_0_M02_AXI_BVALID;
  wire [31:0]axi_noc_0_M02_AXI_RDATA;
  wire [1:0]axi_noc_0_M02_AXI_RID;
  wire axi_noc_0_M02_AXI_RLAST;
  wire [0:0]axi_noc_0_M02_AXI_RREADY;
  wire [1:0]axi_noc_0_M02_AXI_RRESP;
  wire axi_noc_0_M02_AXI_RVALID;
  wire [31:0]axi_noc_0_M02_AXI_WDATA;
  wire [0:0]axi_noc_0_M02_AXI_WLAST;
  wire axi_noc_0_M02_AXI_WREADY;
  wire [3:0]axi_noc_0_M02_AXI_WSTRB;
  wire [0:0]axi_noc_0_M02_AXI_WVALID;
  wire [0:0]axis_vio_0_probe_out0;
  wire [0:0]axis_vio_0_probe_out1;
  wire [15:0]axis_vio_0_probe_out2;
  wire [15:0]c_counter_binary_0_Q;
  wire clk_wizard_0_clk_out1;
  wire ddr4_dimm1_sma_clk_1_CLK_N;
  wire ddr4_dimm1_sma_clk_1_CLK_P;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_0_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_0_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_0_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_0_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_0_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_0_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_0_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_0_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_0_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_0_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_0_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_0_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_0_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_0_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_0_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_0_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_0_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_0_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_0_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_0_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_0_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_0_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_0_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_0_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_0_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_0_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_FPD_CCI_NOC_0_WUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_0_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_1_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_1_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_1_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_1_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_1_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_1_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_1_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_1_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_1_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_1_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_1_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_1_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_1_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_1_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_1_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_1_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_1_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_1_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_1_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_1_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_1_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_1_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_1_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_1_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_1_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_1_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_FPD_CCI_NOC_1_WUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_1_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_2_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_2_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_2_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_2_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_2_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_2_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_2_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_2_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_2_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_2_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_2_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_2_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_2_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_2_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_2_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_2_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_2_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_2_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_2_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_2_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_2_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_2_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_2_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_2_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_2_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_2_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_FPD_CCI_NOC_2_WUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_2_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_3_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_3_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_3_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_3_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_3_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_3_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_3_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_3_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_3_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_FPD_CCI_NOC_3_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_3_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_3_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_3_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_FPD_CCI_NOC_3_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_3_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_FPD_CCI_NOC_3_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_FPD_CCI_NOC_3_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_FPD_CCI_NOC_3_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_3_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_3_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_3_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_3_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_FPD_CCI_NOC_3_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_FPD_CCI_NOC_3_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_FPD_CCI_NOC_3_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_FPD_CCI_NOC_3_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_FPD_CCI_NOC_3_WUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_FPD_CCI_NOC_3_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_LPD_AXI_NOC_0_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_LPD_AXI_NOC_0_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_LPD_AXI_NOC_0_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_LPD_AXI_NOC_0_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_LPD_AXI_NOC_0_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_LPD_AXI_NOC_0_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_LPD_AXI_NOC_0_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_ARREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_LPD_AXI_NOC_0_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_LPD_AXI_NOC_0_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_LPD_AXI_NOC_0_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_LPD_AXI_NOC_0_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_LPD_AXI_NOC_0_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_LPD_AXI_NOC_0_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_LPD_AXI_NOC_0_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_LPD_AXI_NOC_0_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_LPD_AXI_NOC_0_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_AWREADY;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_LPD_AXI_NOC_0_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_LPD_AXI_NOC_0_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_LPD_AXI_NOC_0_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_LPD_AXI_NOC_0_BRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_LPD_AXI_NOC_0_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_LPD_AXI_NOC_0_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_LPD_AXI_NOC_0_RRESP;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_LPD_AXI_NOC_0_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_LPD_AXI_NOC_0_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_LPD_AXI_NOC_0_WSTRB;
  (* HARD_CONN = "true" *) wire versal_cips_0_LPD_AXI_NOC_0_WVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_PMC_NOC_AXI_0_ARADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_PMC_NOC_AXI_0_ARBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_ARCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_ARID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_PMC_NOC_AXI_0_ARLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_ARLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_PMC_NOC_AXI_0_ARPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_ARQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_ARREADY;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_ARREGION;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_PMC_NOC_AXI_0_ARSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_PMC_NOC_AXI_0_ARUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_ARVALID;
  (* HARD_CONN = "true" *) wire [63:0]versal_cips_0_PMC_NOC_AXI_0_AWADDR;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_PMC_NOC_AXI_0_AWBURST;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_AWCACHE;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_AWID;
  (* HARD_CONN = "true" *) wire [7:0]versal_cips_0_PMC_NOC_AXI_0_AWLEN;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_AWLOCK;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_PMC_NOC_AXI_0_AWPROT;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_AWQOS;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_AWREADY;
  (* HARD_CONN = "true" *) wire [3:0]versal_cips_0_PMC_NOC_AXI_0_AWREGION;
  (* HARD_CONN = "true" *) wire [2:0]versal_cips_0_PMC_NOC_AXI_0_AWSIZE;
  (* HARD_CONN = "true" *) wire [17:0]versal_cips_0_PMC_NOC_AXI_0_AWUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_AWVALID;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_BID;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_BREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_PMC_NOC_AXI_0_BRESP;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_BUSER;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_BVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_PMC_NOC_AXI_0_RDATA;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_RID;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_RLAST;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_RREADY;
  (* HARD_CONN = "true" *) wire [1:0]versal_cips_0_PMC_NOC_AXI_0_RRESP;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_PMC_NOC_AXI_0_RUSER;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_RVALID;
  (* HARD_CONN = "true" *) wire [127:0]versal_cips_0_PMC_NOC_AXI_0_WDATA;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_WLAST;
  (* HARD_CONN = "true" *) wire [0:0]versal_cips_0_PMC_NOC_AXI_0_WREADY;
  (* HARD_CONN = "true" *) wire [15:0]versal_cips_0_PMC_NOC_AXI_0_WSTRB;
  (* HARD_CONN = "true" *) wire [16:0]versal_cips_0_PMC_NOC_AXI_0_WUSER;
  (* HARD_CONN = "true" *) wire versal_cips_0_PMC_NOC_AXI_0_WVALID;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi0_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi1_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi2_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_fpd_cci_noc_axi3_clk;
  (* HARD_CONN = "true" *) wire versal_cips_0_lpd_axi_noc_clk;
  wire versal_cips_0_pl0_ref_clk;
  wire versal_cips_0_pl0_resetn;
  (* HARD_CONN = "true" *) wire versal_cips_0_pmc_axi_noc_axi0_clk;

  assign CIPS_CLOCK_OUT_100M = clk_wizard_0_clk_out1;
  assign ddr4_dimm1_act_n = axi_noc_0_CH0_DDR4_0_ACT_N;
  assign ddr4_dimm1_adr[16:0] = axi_noc_0_CH0_DDR4_0_ADR;
  assign ddr4_dimm1_ba[1:0] = axi_noc_0_CH0_DDR4_0_BA;
  assign ddr4_dimm1_bg[1:0] = axi_noc_0_CH0_DDR4_0_BG;
  assign ddr4_dimm1_ck_c = axi_noc_0_CH0_DDR4_0_CK_C;
  assign ddr4_dimm1_ck_t = axi_noc_0_CH0_DDR4_0_CK_T;
  assign ddr4_dimm1_cke = axi_noc_0_CH0_DDR4_0_CKE;
  assign ddr4_dimm1_cs_n = axi_noc_0_CH0_DDR4_0_CS_N;
  assign ddr4_dimm1_odt = axi_noc_0_CH0_DDR4_0_ODT;
  assign ddr4_dimm1_reset_n = axi_noc_0_CH0_DDR4_0_RESET_N;
  assign ddr4_dimm1_sma_clk_1_CLK_N = ddr4_dimm1_sma_clk_clk_n;
  assign ddr4_dimm1_sma_clk_1_CLK_P = ddr4_dimm1_sma_clk_clk_p;
  assign gpio_rtl_tri_o[3:0] = axi_gpio_0_GPIO_TRI_O;
  cips_ddr_pl_debug_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_addr_b(axi_bram_ctrl_0_BRAM_PORTB_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_clk_b(axi_bram_ctrl_0_BRAM_PORTB_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_en_b(axi_bram_ctrl_0_BRAM_PORTB_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rddata_b(axi_bram_ctrl_0_BRAM_PORTB_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_rst_b(axi_bram_ctrl_0_BRAM_PORTB_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_we_b(axi_bram_ctrl_0_BRAM_PORTB_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .bram_wrdata_b(axi_bram_ctrl_0_BRAM_PORTB_DIN),
        .s_axi_aclk(clk_wizard_0_clk_out1),
        .s_axi_araddr(axi_noc_0_M01_AXI_ARADDR[12:0]),
        .s_axi_arburst(axi_noc_0_M01_AXI_ARBURST),
        .s_axi_arcache(axi_noc_0_M01_AXI_ARCACHE),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arid(axi_noc_0_M01_AXI_ARID),
        .s_axi_arlen(axi_noc_0_M01_AXI_ARLEN),
        .s_axi_arlock(axi_noc_0_M01_AXI_ARLOCK),
        .s_axi_arprot(axi_noc_0_M01_AXI_ARPROT),
        .s_axi_arready(axi_noc_0_M01_AXI_ARREADY),
        .s_axi_arsize(axi_noc_0_M01_AXI_ARSIZE),
        .s_axi_arvalid(axi_noc_0_M01_AXI_ARVALID),
        .s_axi_awaddr(axi_noc_0_M01_AXI_AWADDR[12:0]),
        .s_axi_awburst(axi_noc_0_M01_AXI_AWBURST),
        .s_axi_awcache(axi_noc_0_M01_AXI_AWCACHE),
        .s_axi_awid(axi_noc_0_M01_AXI_AWID),
        .s_axi_awlen(axi_noc_0_M01_AXI_AWLEN),
        .s_axi_awlock(axi_noc_0_M01_AXI_AWLOCK),
        .s_axi_awprot(axi_noc_0_M01_AXI_AWPROT),
        .s_axi_awready(axi_noc_0_M01_AXI_AWREADY),
        .s_axi_awsize(axi_noc_0_M01_AXI_AWSIZE),
        .s_axi_awvalid(axi_noc_0_M01_AXI_AWVALID),
        .s_axi_bid(axi_noc_0_M01_AXI_BID),
        .s_axi_bready(axi_noc_0_M01_AXI_BREADY),
        .s_axi_bresp(axi_noc_0_M01_AXI_BRESP),
        .s_axi_bvalid(axi_noc_0_M01_AXI_BVALID),
        .s_axi_rdata(axi_noc_0_M01_AXI_RDATA),
        .s_axi_rid(axi_noc_0_M01_AXI_RID),
        .s_axi_rlast(axi_noc_0_M01_AXI_RLAST),
        .s_axi_rready(axi_noc_0_M01_AXI_RREADY),
        .s_axi_rresp(axi_noc_0_M01_AXI_RRESP),
        .s_axi_rvalid(axi_noc_0_M01_AXI_RVALID),
        .s_axi_wdata(axi_noc_0_M01_AXI_WDATA),
        .s_axi_wlast(axi_noc_0_M01_AXI_WLAST),
        .s_axi_wready(axi_noc_0_M01_AXI_WREADY),
        .s_axi_wstrb(axi_noc_0_M01_AXI_WSTRB),
        .s_axi_wvalid(axi_noc_0_M01_AXI_WVALID));
  cips_ddr_pl_debug_axi_bram_ctrl_0_bram_0 axi_bram_ctrl_0_bram
       (.addra(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .addrb(axi_bram_ctrl_0_BRAM_PORTB_ADDR),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .clkb(axi_bram_ctrl_0_BRAM_PORTB_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .dinb(axi_bram_ctrl_0_BRAM_PORTB_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .doutb(axi_bram_ctrl_0_BRAM_PORTB_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .enb(axi_bram_ctrl_0_BRAM_PORTB_EN),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .rstb(axi_bram_ctrl_0_BRAM_PORTB_RST),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .web(axi_bram_ctrl_0_BRAM_PORTB_WE));
  cips_ddr_pl_debug_axi_dbg_hub_0_0 axi_dbg_hub_0
       (.aclk(clk_wizard_0_clk_out1),
        .aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_araddr(axi_noc_0_M00_AXI_ARADDR),
        .s_axi_arburst(axi_noc_0_M00_AXI_ARBURST),
        .s_axi_arcache(axi_noc_0_M00_AXI_ARCACHE),
        .s_axi_arid(axi_noc_0_M00_AXI_ARID),
        .s_axi_arlen(axi_noc_0_M00_AXI_ARLEN),
        .s_axi_arlock(axi_noc_0_M00_AXI_ARLOCK),
        .s_axi_arprot(axi_noc_0_M00_AXI_ARPROT),
        .s_axi_arqos(axi_noc_0_M00_AXI_ARQOS),
        .s_axi_arready(axi_noc_0_M00_AXI_ARREADY),
        .s_axi_arregion(axi_noc_0_M00_AXI_ARREGION),
        .s_axi_arsize(axi_noc_0_M00_AXI_ARSIZE),
        .s_axi_arvalid(axi_noc_0_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_noc_0_M00_AXI_AWADDR),
        .s_axi_awburst(axi_noc_0_M00_AXI_AWBURST),
        .s_axi_awcache(axi_noc_0_M00_AXI_AWCACHE),
        .s_axi_awid(axi_noc_0_M00_AXI_AWID),
        .s_axi_awlen(axi_noc_0_M00_AXI_AWLEN),
        .s_axi_awlock(axi_noc_0_M00_AXI_AWLOCK),
        .s_axi_awprot(axi_noc_0_M00_AXI_AWPROT),
        .s_axi_awqos(axi_noc_0_M00_AXI_AWQOS),
        .s_axi_awready(axi_noc_0_M00_AXI_AWREADY),
        .s_axi_awregion(axi_noc_0_M00_AXI_AWREGION),
        .s_axi_awsize(axi_noc_0_M00_AXI_AWSIZE),
        .s_axi_awvalid(axi_noc_0_M00_AXI_AWVALID),
        .s_axi_bid(axi_noc_0_M00_AXI_BID),
        .s_axi_bready(axi_noc_0_M00_AXI_BREADY),
        .s_axi_bresp(axi_noc_0_M00_AXI_BRESP),
        .s_axi_bvalid(axi_noc_0_M00_AXI_BVALID),
        .s_axi_rdata(axi_noc_0_M00_AXI_RDATA),
        .s_axi_rid(axi_noc_0_M00_AXI_RID),
        .s_axi_rlast(axi_noc_0_M00_AXI_RLAST),
        .s_axi_rready(axi_noc_0_M00_AXI_RREADY),
        .s_axi_rresp(axi_noc_0_M00_AXI_RRESP),
        .s_axi_rvalid(axi_noc_0_M00_AXI_RVALID),
        .s_axi_wdata(axi_noc_0_M00_AXI_WDATA),
        .s_axi_wlast(axi_noc_0_M00_AXI_WLAST),
        .s_axi_wready(axi_noc_0_M00_AXI_WREADY),
        .s_axi_wstrb(axi_noc_0_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_noc_0_M00_AXI_WVALID));
  cips_ddr_pl_debug_axi_gpio_0_0 axi_gpio_0
       (.gpio_io_o(axi_gpio_0_GPIO_TRI_O),
        .s_axi_aclk(clk_wizard_0_clk_out1),
        .s_axi_araddr(axi_gpio_0_smc_M00_AXI_ARADDR),
        .s_axi_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s_axi_arready(axi_gpio_0_smc_M00_AXI_ARREADY),
        .s_axi_arvalid(axi_gpio_0_smc_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_gpio_0_smc_M00_AXI_AWADDR),
        .s_axi_awready(axi_gpio_0_smc_M00_AXI_AWREADY),
        .s_axi_awvalid(axi_gpio_0_smc_M00_AXI_AWVALID),
        .s_axi_bready(axi_gpio_0_smc_M00_AXI_BREADY),
        .s_axi_bresp(axi_gpio_0_smc_M00_AXI_BRESP),
        .s_axi_bvalid(axi_gpio_0_smc_M00_AXI_BVALID),
        .s_axi_rdata(axi_gpio_0_smc_M00_AXI_RDATA),
        .s_axi_rready(axi_gpio_0_smc_M00_AXI_RREADY),
        .s_axi_rresp(axi_gpio_0_smc_M00_AXI_RRESP),
        .s_axi_rvalid(axi_gpio_0_smc_M00_AXI_RVALID),
        .s_axi_wdata(axi_gpio_0_smc_M00_AXI_WDATA),
        .s_axi_wready(axi_gpio_0_smc_M00_AXI_WREADY),
        .s_axi_wstrb(axi_gpio_0_smc_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_gpio_0_smc_M00_AXI_WVALID));
  cips_ddr_pl_debug_axi_gpio_0_smc_0 axi_gpio_0_smc
       (.M00_AXI_araddr(axi_gpio_0_smc_M00_AXI_ARADDR),
        .M00_AXI_arready(axi_gpio_0_smc_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_gpio_0_smc_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_gpio_0_smc_M00_AXI_AWADDR),
        .M00_AXI_awready(axi_gpio_0_smc_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_gpio_0_smc_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_gpio_0_smc_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_gpio_0_smc_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_gpio_0_smc_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_gpio_0_smc_M00_AXI_RDATA),
        .M00_AXI_rready(axi_gpio_0_smc_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_gpio_0_smc_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_gpio_0_smc_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_gpio_0_smc_M00_AXI_WDATA),
        .M00_AXI_wready(axi_gpio_0_smc_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_gpio_0_smc_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_gpio_0_smc_M00_AXI_WVALID),
        .S00_AXI_araddr(axi_noc_0_M02_AXI_ARADDR),
        .S00_AXI_arburst(axi_noc_0_M02_AXI_ARBURST),
        .S00_AXI_arcache(axi_noc_0_M02_AXI_ARCACHE),
        .S00_AXI_arid(axi_noc_0_M02_AXI_ARID),
        .S00_AXI_arlen(axi_noc_0_M02_AXI_ARLEN),
        .S00_AXI_arlock(axi_noc_0_M02_AXI_ARLOCK),
        .S00_AXI_arprot(axi_noc_0_M02_AXI_ARPROT),
        .S00_AXI_arqos(axi_noc_0_M02_AXI_ARQOS),
        .S00_AXI_arready(axi_noc_0_M02_AXI_ARREADY),
        .S00_AXI_arsize(axi_noc_0_M02_AXI_ARSIZE),
        .S00_AXI_aruser(axi_noc_0_M02_AXI_ARUSER),
        .S00_AXI_arvalid(axi_noc_0_M02_AXI_ARVALID),
        .S00_AXI_awaddr(axi_noc_0_M02_AXI_AWADDR),
        .S00_AXI_awburst(axi_noc_0_M02_AXI_AWBURST),
        .S00_AXI_awcache(axi_noc_0_M02_AXI_AWCACHE),
        .S00_AXI_awid(axi_noc_0_M02_AXI_AWID),
        .S00_AXI_awlen(axi_noc_0_M02_AXI_AWLEN),
        .S00_AXI_awlock(axi_noc_0_M02_AXI_AWLOCK),
        .S00_AXI_awprot(axi_noc_0_M02_AXI_AWPROT),
        .S00_AXI_awqos(axi_noc_0_M02_AXI_AWQOS),
        .S00_AXI_awready(axi_noc_0_M02_AXI_AWREADY),
        .S00_AXI_awsize(axi_noc_0_M02_AXI_AWSIZE),
        .S00_AXI_awuser(axi_noc_0_M02_AXI_AWUSER),
        .S00_AXI_awvalid(axi_noc_0_M02_AXI_AWVALID),
        .S00_AXI_bid(axi_noc_0_M02_AXI_BID),
        .S00_AXI_bready(axi_noc_0_M02_AXI_BREADY),
        .S00_AXI_bresp(axi_noc_0_M02_AXI_BRESP),
        .S00_AXI_bvalid(axi_noc_0_M02_AXI_BVALID),
        .S00_AXI_rdata(axi_noc_0_M02_AXI_RDATA),
        .S00_AXI_rid(axi_noc_0_M02_AXI_RID),
        .S00_AXI_rlast(axi_noc_0_M02_AXI_RLAST),
        .S00_AXI_rready(axi_noc_0_M02_AXI_RREADY),
        .S00_AXI_rresp(axi_noc_0_M02_AXI_RRESP),
        .S00_AXI_rvalid(axi_noc_0_M02_AXI_RVALID),
        .S00_AXI_wdata(axi_noc_0_M02_AXI_WDATA),
        .S00_AXI_wlast(axi_noc_0_M02_AXI_WLAST),
        .S00_AXI_wready(axi_noc_0_M02_AXI_WREADY),
        .S00_AXI_wstrb(axi_noc_0_M02_AXI_WSTRB),
        .S00_AXI_wvalid(axi_noc_0_M02_AXI_WVALID),
        .aclk(clk_wizard_0_clk_out1),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
  cips_ddr_pl_debug_axi_noc_0_0 axi_noc_0
       (.CH0_DDR4_0_act_n(axi_noc_0_CH0_DDR4_0_ACT_N),
        .CH0_DDR4_0_adr(axi_noc_0_CH0_DDR4_0_ADR),
        .CH0_DDR4_0_ba(axi_noc_0_CH0_DDR4_0_BA),
        .CH0_DDR4_0_bg(axi_noc_0_CH0_DDR4_0_BG),
        .CH0_DDR4_0_ck_c(axi_noc_0_CH0_DDR4_0_CK_C),
        .CH0_DDR4_0_ck_t(axi_noc_0_CH0_DDR4_0_CK_T),
        .CH0_DDR4_0_cke(axi_noc_0_CH0_DDR4_0_CKE),
        .CH0_DDR4_0_cs_n(axi_noc_0_CH0_DDR4_0_CS_N),
        .CH0_DDR4_0_dm_n(ddr4_dimm1_dm_n[7:0]),
        .CH0_DDR4_0_dq(ddr4_dimm1_dq[63:0]),
        .CH0_DDR4_0_dqs_c(ddr4_dimm1_dqs_c[7:0]),
        .CH0_DDR4_0_dqs_t(ddr4_dimm1_dqs_t[7:0]),
        .CH0_DDR4_0_odt(axi_noc_0_CH0_DDR4_0_ODT),
        .CH0_DDR4_0_reset_n(axi_noc_0_CH0_DDR4_0_RESET_N),
        .M00_AXI_araddr(axi_noc_0_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_noc_0_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_noc_0_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_noc_0_M00_AXI_ARID),
        .M00_AXI_arlen(axi_noc_0_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_noc_0_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_noc_0_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_noc_0_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_noc_0_M00_AXI_ARREADY),
        .M00_AXI_arregion(axi_noc_0_M00_AXI_ARREGION),
        .M00_AXI_arsize(axi_noc_0_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_noc_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_noc_0_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_noc_0_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_noc_0_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_noc_0_M00_AXI_AWID),
        .M00_AXI_awlen(axi_noc_0_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_noc_0_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_noc_0_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_noc_0_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_noc_0_M00_AXI_AWREADY),
        .M00_AXI_awregion(axi_noc_0_M00_AXI_AWREGION),
        .M00_AXI_awsize(axi_noc_0_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_noc_0_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_noc_0_M00_AXI_BID),
        .M00_AXI_bready(axi_noc_0_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_noc_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_noc_0_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_noc_0_M00_AXI_RDATA),
        .M00_AXI_rid(axi_noc_0_M00_AXI_RID),
        .M00_AXI_rlast(axi_noc_0_M00_AXI_RLAST),
        .M00_AXI_rready(axi_noc_0_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_noc_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_noc_0_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_noc_0_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_noc_0_M00_AXI_WLAST),
        .M00_AXI_wready(axi_noc_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_noc_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_noc_0_M00_AXI_WVALID),
        .M01_AXI_araddr(axi_noc_0_M01_AXI_ARADDR),
        .M01_AXI_arburst(axi_noc_0_M01_AXI_ARBURST),
        .M01_AXI_arcache(axi_noc_0_M01_AXI_ARCACHE),
        .M01_AXI_arid(axi_noc_0_M01_AXI_ARID),
        .M01_AXI_arlen(axi_noc_0_M01_AXI_ARLEN),
        .M01_AXI_arlock(axi_noc_0_M01_AXI_ARLOCK),
        .M01_AXI_arprot(axi_noc_0_M01_AXI_ARPROT),
        .M01_AXI_arqos(axi_noc_0_M01_AXI_ARQOS),
        .M01_AXI_arready(axi_noc_0_M01_AXI_ARREADY),
        .M01_AXI_arregion(axi_noc_0_M01_AXI_ARREGION),
        .M01_AXI_arsize(axi_noc_0_M01_AXI_ARSIZE),
        .M01_AXI_aruser(axi_noc_0_M01_AXI_ARUSER),
        .M01_AXI_arvalid(axi_noc_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_noc_0_M01_AXI_AWADDR),
        .M01_AXI_awburst(axi_noc_0_M01_AXI_AWBURST),
        .M01_AXI_awcache(axi_noc_0_M01_AXI_AWCACHE),
        .M01_AXI_awid(axi_noc_0_M01_AXI_AWID),
        .M01_AXI_awlen(axi_noc_0_M01_AXI_AWLEN),
        .M01_AXI_awlock(axi_noc_0_M01_AXI_AWLOCK),
        .M01_AXI_awprot(axi_noc_0_M01_AXI_AWPROT),
        .M01_AXI_awqos(axi_noc_0_M01_AXI_AWQOS),
        .M01_AXI_awready(axi_noc_0_M01_AXI_AWREADY),
        .M01_AXI_awregion(axi_noc_0_M01_AXI_AWREGION),
        .M01_AXI_awsize(axi_noc_0_M01_AXI_AWSIZE),
        .M01_AXI_awuser(axi_noc_0_M01_AXI_AWUSER),
        .M01_AXI_awvalid(axi_noc_0_M01_AXI_AWVALID),
        .M01_AXI_bid(axi_noc_0_M01_AXI_BID),
        .M01_AXI_bready(axi_noc_0_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_noc_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_noc_0_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_noc_0_M01_AXI_RDATA),
        .M01_AXI_rid(axi_noc_0_M01_AXI_RID),
        .M01_AXI_rlast(axi_noc_0_M01_AXI_RLAST),
        .M01_AXI_rready(axi_noc_0_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_noc_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_noc_0_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_noc_0_M01_AXI_WDATA),
        .M01_AXI_wlast(axi_noc_0_M01_AXI_WLAST),
        .M01_AXI_wready(axi_noc_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_noc_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_noc_0_M01_AXI_WVALID),
        .M02_AXI_araddr(axi_noc_0_M02_AXI_ARADDR),
        .M02_AXI_arburst(axi_noc_0_M02_AXI_ARBURST),
        .M02_AXI_arcache(axi_noc_0_M02_AXI_ARCACHE),
        .M02_AXI_arid(axi_noc_0_M02_AXI_ARID),
        .M02_AXI_arlen(axi_noc_0_M02_AXI_ARLEN),
        .M02_AXI_arlock(axi_noc_0_M02_AXI_ARLOCK),
        .M02_AXI_arprot(axi_noc_0_M02_AXI_ARPROT),
        .M02_AXI_arqos(axi_noc_0_M02_AXI_ARQOS),
        .M02_AXI_arready(axi_noc_0_M02_AXI_ARREADY),
        .M02_AXI_arsize(axi_noc_0_M02_AXI_ARSIZE),
        .M02_AXI_aruser(axi_noc_0_M02_AXI_ARUSER),
        .M02_AXI_arvalid(axi_noc_0_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi_noc_0_M02_AXI_AWADDR),
        .M02_AXI_awburst(axi_noc_0_M02_AXI_AWBURST),
        .M02_AXI_awcache(axi_noc_0_M02_AXI_AWCACHE),
        .M02_AXI_awid(axi_noc_0_M02_AXI_AWID),
        .M02_AXI_awlen(axi_noc_0_M02_AXI_AWLEN),
        .M02_AXI_awlock(axi_noc_0_M02_AXI_AWLOCK),
        .M02_AXI_awprot(axi_noc_0_M02_AXI_AWPROT),
        .M02_AXI_awqos(axi_noc_0_M02_AXI_AWQOS),
        .M02_AXI_awready(axi_noc_0_M02_AXI_AWREADY),
        .M02_AXI_awsize(axi_noc_0_M02_AXI_AWSIZE),
        .M02_AXI_awuser(axi_noc_0_M02_AXI_AWUSER),
        .M02_AXI_awvalid(axi_noc_0_M02_AXI_AWVALID),
        .M02_AXI_bid(axi_noc_0_M02_AXI_BID),
        .M02_AXI_bready(axi_noc_0_M02_AXI_BREADY),
        .M02_AXI_bresp(axi_noc_0_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi_noc_0_M02_AXI_BVALID),
        .M02_AXI_rdata(axi_noc_0_M02_AXI_RDATA),
        .M02_AXI_rid(axi_noc_0_M02_AXI_RID),
        .M02_AXI_rlast(axi_noc_0_M02_AXI_RLAST),
        .M02_AXI_rready(axi_noc_0_M02_AXI_RREADY),
        .M02_AXI_rresp(axi_noc_0_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi_noc_0_M02_AXI_RVALID),
        .M02_AXI_wdata(axi_noc_0_M02_AXI_WDATA),
        .M02_AXI_wlast(axi_noc_0_M02_AXI_WLAST),
        .M02_AXI_wready(axi_noc_0_M02_AXI_WREADY),
        .M02_AXI_wstrb(axi_noc_0_M02_AXI_WSTRB),
        .M02_AXI_wvalid(axi_noc_0_M02_AXI_WVALID),
        .S00_AXI_araddr(versal_cips_0_PMC_NOC_AXI_0_ARADDR),
        .S00_AXI_arburst(versal_cips_0_PMC_NOC_AXI_0_ARBURST),
        .S00_AXI_arcache(versal_cips_0_PMC_NOC_AXI_0_ARCACHE),
        .S00_AXI_arid(versal_cips_0_PMC_NOC_AXI_0_ARID),
        .S00_AXI_arlen(versal_cips_0_PMC_NOC_AXI_0_ARLEN),
        .S00_AXI_arlock(versal_cips_0_PMC_NOC_AXI_0_ARLOCK),
        .S00_AXI_arprot(versal_cips_0_PMC_NOC_AXI_0_ARPROT),
        .S00_AXI_arqos(versal_cips_0_PMC_NOC_AXI_0_ARQOS),
        .S00_AXI_arready(versal_cips_0_PMC_NOC_AXI_0_ARREADY),
        .S00_AXI_arregion(versal_cips_0_PMC_NOC_AXI_0_ARREGION),
        .S00_AXI_arsize(versal_cips_0_PMC_NOC_AXI_0_ARSIZE),
        .S00_AXI_aruser(versal_cips_0_PMC_NOC_AXI_0_ARUSER),
        .S00_AXI_arvalid(versal_cips_0_PMC_NOC_AXI_0_ARVALID),
        .S00_AXI_awaddr(versal_cips_0_PMC_NOC_AXI_0_AWADDR),
        .S00_AXI_awburst(versal_cips_0_PMC_NOC_AXI_0_AWBURST),
        .S00_AXI_awcache(versal_cips_0_PMC_NOC_AXI_0_AWCACHE),
        .S00_AXI_awid(versal_cips_0_PMC_NOC_AXI_0_AWID),
        .S00_AXI_awlen(versal_cips_0_PMC_NOC_AXI_0_AWLEN),
        .S00_AXI_awlock(versal_cips_0_PMC_NOC_AXI_0_AWLOCK),
        .S00_AXI_awprot(versal_cips_0_PMC_NOC_AXI_0_AWPROT),
        .S00_AXI_awqos(versal_cips_0_PMC_NOC_AXI_0_AWQOS),
        .S00_AXI_awready(versal_cips_0_PMC_NOC_AXI_0_AWREADY),
        .S00_AXI_awregion(versal_cips_0_PMC_NOC_AXI_0_AWREGION),
        .S00_AXI_awsize(versal_cips_0_PMC_NOC_AXI_0_AWSIZE),
        .S00_AXI_awuser(versal_cips_0_PMC_NOC_AXI_0_AWUSER),
        .S00_AXI_awvalid(versal_cips_0_PMC_NOC_AXI_0_AWVALID),
        .S00_AXI_bid(versal_cips_0_PMC_NOC_AXI_0_BID),
        .S00_AXI_bready(versal_cips_0_PMC_NOC_AXI_0_BREADY),
        .S00_AXI_bresp(versal_cips_0_PMC_NOC_AXI_0_BRESP),
        .S00_AXI_buser(versal_cips_0_PMC_NOC_AXI_0_BUSER),
        .S00_AXI_bvalid(versal_cips_0_PMC_NOC_AXI_0_BVALID),
        .S00_AXI_rdata(versal_cips_0_PMC_NOC_AXI_0_RDATA),
        .S00_AXI_rid(versal_cips_0_PMC_NOC_AXI_0_RID),
        .S00_AXI_rlast(versal_cips_0_PMC_NOC_AXI_0_RLAST),
        .S00_AXI_rready(versal_cips_0_PMC_NOC_AXI_0_RREADY),
        .S00_AXI_rresp(versal_cips_0_PMC_NOC_AXI_0_RRESP),
        .S00_AXI_ruser(versal_cips_0_PMC_NOC_AXI_0_RUSER),
        .S00_AXI_rvalid(versal_cips_0_PMC_NOC_AXI_0_RVALID),
        .S00_AXI_wdata(versal_cips_0_PMC_NOC_AXI_0_WDATA),
        .S00_AXI_wlast(versal_cips_0_PMC_NOC_AXI_0_WLAST),
        .S00_AXI_wready(versal_cips_0_PMC_NOC_AXI_0_WREADY),
        .S00_AXI_wstrb(versal_cips_0_PMC_NOC_AXI_0_WSTRB),
        .S00_AXI_wuser(versal_cips_0_PMC_NOC_AXI_0_WUSER),
        .S00_AXI_wvalid(versal_cips_0_PMC_NOC_AXI_0_WVALID),
        .S01_AXI_araddr(versal_cips_0_LPD_AXI_NOC_0_ARADDR),
        .S01_AXI_arburst(versal_cips_0_LPD_AXI_NOC_0_ARBURST),
        .S01_AXI_arcache(versal_cips_0_LPD_AXI_NOC_0_ARCACHE),
        .S01_AXI_arid(versal_cips_0_LPD_AXI_NOC_0_ARID),
        .S01_AXI_arlen(versal_cips_0_LPD_AXI_NOC_0_ARLEN),
        .S01_AXI_arlock(versal_cips_0_LPD_AXI_NOC_0_ARLOCK),
        .S01_AXI_arprot(versal_cips_0_LPD_AXI_NOC_0_ARPROT),
        .S01_AXI_arqos(versal_cips_0_LPD_AXI_NOC_0_ARQOS),
        .S01_AXI_arready(versal_cips_0_LPD_AXI_NOC_0_ARREADY),
        .S01_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_arsize(versal_cips_0_LPD_AXI_NOC_0_ARSIZE),
        .S01_AXI_aruser(versal_cips_0_LPD_AXI_NOC_0_ARUSER),
        .S01_AXI_arvalid(versal_cips_0_LPD_AXI_NOC_0_ARVALID),
        .S01_AXI_awaddr(versal_cips_0_LPD_AXI_NOC_0_AWADDR),
        .S01_AXI_awburst(versal_cips_0_LPD_AXI_NOC_0_AWBURST),
        .S01_AXI_awcache(versal_cips_0_LPD_AXI_NOC_0_AWCACHE),
        .S01_AXI_awid(versal_cips_0_LPD_AXI_NOC_0_AWID),
        .S01_AXI_awlen(versal_cips_0_LPD_AXI_NOC_0_AWLEN),
        .S01_AXI_awlock(versal_cips_0_LPD_AXI_NOC_0_AWLOCK),
        .S01_AXI_awprot(versal_cips_0_LPD_AXI_NOC_0_AWPROT),
        .S01_AXI_awqos(versal_cips_0_LPD_AXI_NOC_0_AWQOS),
        .S01_AXI_awready(versal_cips_0_LPD_AXI_NOC_0_AWREADY),
        .S01_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awsize(versal_cips_0_LPD_AXI_NOC_0_AWSIZE),
        .S01_AXI_awuser(versal_cips_0_LPD_AXI_NOC_0_AWUSER),
        .S01_AXI_awvalid(versal_cips_0_LPD_AXI_NOC_0_AWVALID),
        .S01_AXI_bid(versal_cips_0_LPD_AXI_NOC_0_BID),
        .S01_AXI_bready(versal_cips_0_LPD_AXI_NOC_0_BREADY),
        .S01_AXI_bresp(versal_cips_0_LPD_AXI_NOC_0_BRESP),
        .S01_AXI_bvalid(versal_cips_0_LPD_AXI_NOC_0_BVALID),
        .S01_AXI_rdata(versal_cips_0_LPD_AXI_NOC_0_RDATA),
        .S01_AXI_rid(versal_cips_0_LPD_AXI_NOC_0_RID),
        .S01_AXI_rlast(versal_cips_0_LPD_AXI_NOC_0_RLAST),
        .S01_AXI_rready(versal_cips_0_LPD_AXI_NOC_0_RREADY),
        .S01_AXI_rresp(versal_cips_0_LPD_AXI_NOC_0_RRESP),
        .S01_AXI_rvalid(versal_cips_0_LPD_AXI_NOC_0_RVALID),
        .S01_AXI_wdata(versal_cips_0_LPD_AXI_NOC_0_WDATA),
        .S01_AXI_wlast(versal_cips_0_LPD_AXI_NOC_0_WLAST),
        .S01_AXI_wready(versal_cips_0_LPD_AXI_NOC_0_WREADY),
        .S01_AXI_wstrb(versal_cips_0_LPD_AXI_NOC_0_WSTRB),
        .S01_AXI_wuser({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_wvalid(versal_cips_0_LPD_AXI_NOC_0_WVALID),
        .S02_AXI_araddr(versal_cips_0_FPD_CCI_NOC_0_ARADDR),
        .S02_AXI_arburst(versal_cips_0_FPD_CCI_NOC_0_ARBURST),
        .S02_AXI_arcache(versal_cips_0_FPD_CCI_NOC_0_ARCACHE),
        .S02_AXI_arid(versal_cips_0_FPD_CCI_NOC_0_ARID),
        .S02_AXI_arlen(versal_cips_0_FPD_CCI_NOC_0_ARLEN),
        .S02_AXI_arlock(versal_cips_0_FPD_CCI_NOC_0_ARLOCK),
        .S02_AXI_arprot(versal_cips_0_FPD_CCI_NOC_0_ARPROT),
        .S02_AXI_arqos(versal_cips_0_FPD_CCI_NOC_0_ARQOS),
        .S02_AXI_arready(versal_cips_0_FPD_CCI_NOC_0_ARREADY),
        .S02_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_arsize(versal_cips_0_FPD_CCI_NOC_0_ARSIZE),
        .S02_AXI_aruser(versal_cips_0_FPD_CCI_NOC_0_ARUSER),
        .S02_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_0_ARVALID),
        .S02_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_0_AWADDR),
        .S02_AXI_awburst(versal_cips_0_FPD_CCI_NOC_0_AWBURST),
        .S02_AXI_awcache(versal_cips_0_FPD_CCI_NOC_0_AWCACHE),
        .S02_AXI_awid(versal_cips_0_FPD_CCI_NOC_0_AWID),
        .S02_AXI_awlen(versal_cips_0_FPD_CCI_NOC_0_AWLEN),
        .S02_AXI_awlock(versal_cips_0_FPD_CCI_NOC_0_AWLOCK),
        .S02_AXI_awprot(versal_cips_0_FPD_CCI_NOC_0_AWPROT),
        .S02_AXI_awqos(versal_cips_0_FPD_CCI_NOC_0_AWQOS),
        .S02_AXI_awready(versal_cips_0_FPD_CCI_NOC_0_AWREADY),
        .S02_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_awsize(versal_cips_0_FPD_CCI_NOC_0_AWSIZE),
        .S02_AXI_awuser(versal_cips_0_FPD_CCI_NOC_0_AWUSER),
        .S02_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_0_AWVALID),
        .S02_AXI_bid(versal_cips_0_FPD_CCI_NOC_0_BID),
        .S02_AXI_bready(versal_cips_0_FPD_CCI_NOC_0_BREADY),
        .S02_AXI_bresp(versal_cips_0_FPD_CCI_NOC_0_BRESP),
        .S02_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_0_BVALID),
        .S02_AXI_rdata(versal_cips_0_FPD_CCI_NOC_0_RDATA),
        .S02_AXI_rid(versal_cips_0_FPD_CCI_NOC_0_RID),
        .S02_AXI_rlast(versal_cips_0_FPD_CCI_NOC_0_RLAST),
        .S02_AXI_rready(versal_cips_0_FPD_CCI_NOC_0_RREADY),
        .S02_AXI_rresp(versal_cips_0_FPD_CCI_NOC_0_RRESP),
        .S02_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_0_RVALID),
        .S02_AXI_wdata(versal_cips_0_FPD_CCI_NOC_0_WDATA),
        .S02_AXI_wlast(versal_cips_0_FPD_CCI_NOC_0_WLAST),
        .S02_AXI_wready(versal_cips_0_FPD_CCI_NOC_0_WREADY),
        .S02_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_0_WSTRB),
        .S02_AXI_wuser(versal_cips_0_FPD_CCI_NOC_0_WUSER),
        .S02_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_0_WVALID),
        .S03_AXI_araddr(versal_cips_0_FPD_CCI_NOC_1_ARADDR),
        .S03_AXI_arburst(versal_cips_0_FPD_CCI_NOC_1_ARBURST),
        .S03_AXI_arcache(versal_cips_0_FPD_CCI_NOC_1_ARCACHE),
        .S03_AXI_arid(versal_cips_0_FPD_CCI_NOC_1_ARID),
        .S03_AXI_arlen(versal_cips_0_FPD_CCI_NOC_1_ARLEN),
        .S03_AXI_arlock(versal_cips_0_FPD_CCI_NOC_1_ARLOCK),
        .S03_AXI_arprot(versal_cips_0_FPD_CCI_NOC_1_ARPROT),
        .S03_AXI_arqos(versal_cips_0_FPD_CCI_NOC_1_ARQOS),
        .S03_AXI_arready(versal_cips_0_FPD_CCI_NOC_1_ARREADY),
        .S03_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_arsize(versal_cips_0_FPD_CCI_NOC_1_ARSIZE),
        .S03_AXI_aruser(versal_cips_0_FPD_CCI_NOC_1_ARUSER),
        .S03_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_1_ARVALID),
        .S03_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_1_AWADDR),
        .S03_AXI_awburst(versal_cips_0_FPD_CCI_NOC_1_AWBURST),
        .S03_AXI_awcache(versal_cips_0_FPD_CCI_NOC_1_AWCACHE),
        .S03_AXI_awid(versal_cips_0_FPD_CCI_NOC_1_AWID),
        .S03_AXI_awlen(versal_cips_0_FPD_CCI_NOC_1_AWLEN),
        .S03_AXI_awlock(versal_cips_0_FPD_CCI_NOC_1_AWLOCK),
        .S03_AXI_awprot(versal_cips_0_FPD_CCI_NOC_1_AWPROT),
        .S03_AXI_awqos(versal_cips_0_FPD_CCI_NOC_1_AWQOS),
        .S03_AXI_awready(versal_cips_0_FPD_CCI_NOC_1_AWREADY),
        .S03_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S03_AXI_awsize(versal_cips_0_FPD_CCI_NOC_1_AWSIZE),
        .S03_AXI_awuser(versal_cips_0_FPD_CCI_NOC_1_AWUSER),
        .S03_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_1_AWVALID),
        .S03_AXI_bid(versal_cips_0_FPD_CCI_NOC_1_BID),
        .S03_AXI_bready(versal_cips_0_FPD_CCI_NOC_1_BREADY),
        .S03_AXI_bresp(versal_cips_0_FPD_CCI_NOC_1_BRESP),
        .S03_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_1_BVALID),
        .S03_AXI_rdata(versal_cips_0_FPD_CCI_NOC_1_RDATA),
        .S03_AXI_rid(versal_cips_0_FPD_CCI_NOC_1_RID),
        .S03_AXI_rlast(versal_cips_0_FPD_CCI_NOC_1_RLAST),
        .S03_AXI_rready(versal_cips_0_FPD_CCI_NOC_1_RREADY),
        .S03_AXI_rresp(versal_cips_0_FPD_CCI_NOC_1_RRESP),
        .S03_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_1_RVALID),
        .S03_AXI_wdata(versal_cips_0_FPD_CCI_NOC_1_WDATA),
        .S03_AXI_wlast(versal_cips_0_FPD_CCI_NOC_1_WLAST),
        .S03_AXI_wready(versal_cips_0_FPD_CCI_NOC_1_WREADY),
        .S03_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_1_WSTRB),
        .S03_AXI_wuser(versal_cips_0_FPD_CCI_NOC_1_WUSER),
        .S03_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_1_WVALID),
        .S04_AXI_araddr(versal_cips_0_FPD_CCI_NOC_2_ARADDR),
        .S04_AXI_arburst(versal_cips_0_FPD_CCI_NOC_2_ARBURST),
        .S04_AXI_arcache(versal_cips_0_FPD_CCI_NOC_2_ARCACHE),
        .S04_AXI_arid(versal_cips_0_FPD_CCI_NOC_2_ARID),
        .S04_AXI_arlen(versal_cips_0_FPD_CCI_NOC_2_ARLEN),
        .S04_AXI_arlock(versal_cips_0_FPD_CCI_NOC_2_ARLOCK),
        .S04_AXI_arprot(versal_cips_0_FPD_CCI_NOC_2_ARPROT),
        .S04_AXI_arqos(versal_cips_0_FPD_CCI_NOC_2_ARQOS),
        .S04_AXI_arready(versal_cips_0_FPD_CCI_NOC_2_ARREADY),
        .S04_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S04_AXI_arsize(versal_cips_0_FPD_CCI_NOC_2_ARSIZE),
        .S04_AXI_aruser(versal_cips_0_FPD_CCI_NOC_2_ARUSER),
        .S04_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_2_ARVALID),
        .S04_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_2_AWADDR),
        .S04_AXI_awburst(versal_cips_0_FPD_CCI_NOC_2_AWBURST),
        .S04_AXI_awcache(versal_cips_0_FPD_CCI_NOC_2_AWCACHE),
        .S04_AXI_awid(versal_cips_0_FPD_CCI_NOC_2_AWID),
        .S04_AXI_awlen(versal_cips_0_FPD_CCI_NOC_2_AWLEN),
        .S04_AXI_awlock(versal_cips_0_FPD_CCI_NOC_2_AWLOCK),
        .S04_AXI_awprot(versal_cips_0_FPD_CCI_NOC_2_AWPROT),
        .S04_AXI_awqos(versal_cips_0_FPD_CCI_NOC_2_AWQOS),
        .S04_AXI_awready(versal_cips_0_FPD_CCI_NOC_2_AWREADY),
        .S04_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S04_AXI_awsize(versal_cips_0_FPD_CCI_NOC_2_AWSIZE),
        .S04_AXI_awuser(versal_cips_0_FPD_CCI_NOC_2_AWUSER),
        .S04_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_2_AWVALID),
        .S04_AXI_bid(versal_cips_0_FPD_CCI_NOC_2_BID),
        .S04_AXI_bready(versal_cips_0_FPD_CCI_NOC_2_BREADY),
        .S04_AXI_bresp(versal_cips_0_FPD_CCI_NOC_2_BRESP),
        .S04_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_2_BVALID),
        .S04_AXI_rdata(versal_cips_0_FPD_CCI_NOC_2_RDATA),
        .S04_AXI_rid(versal_cips_0_FPD_CCI_NOC_2_RID),
        .S04_AXI_rlast(versal_cips_0_FPD_CCI_NOC_2_RLAST),
        .S04_AXI_rready(versal_cips_0_FPD_CCI_NOC_2_RREADY),
        .S04_AXI_rresp(versal_cips_0_FPD_CCI_NOC_2_RRESP),
        .S04_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_2_RVALID),
        .S04_AXI_wdata(versal_cips_0_FPD_CCI_NOC_2_WDATA),
        .S04_AXI_wlast(versal_cips_0_FPD_CCI_NOC_2_WLAST),
        .S04_AXI_wready(versal_cips_0_FPD_CCI_NOC_2_WREADY),
        .S04_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_2_WSTRB),
        .S04_AXI_wuser(versal_cips_0_FPD_CCI_NOC_2_WUSER),
        .S04_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_2_WVALID),
        .S05_AXI_araddr(versal_cips_0_FPD_CCI_NOC_3_ARADDR),
        .S05_AXI_arburst(versal_cips_0_FPD_CCI_NOC_3_ARBURST),
        .S05_AXI_arcache(versal_cips_0_FPD_CCI_NOC_3_ARCACHE),
        .S05_AXI_arid(versal_cips_0_FPD_CCI_NOC_3_ARID),
        .S05_AXI_arlen(versal_cips_0_FPD_CCI_NOC_3_ARLEN),
        .S05_AXI_arlock(versal_cips_0_FPD_CCI_NOC_3_ARLOCK),
        .S05_AXI_arprot(versal_cips_0_FPD_CCI_NOC_3_ARPROT),
        .S05_AXI_arqos(versal_cips_0_FPD_CCI_NOC_3_ARQOS),
        .S05_AXI_arready(versal_cips_0_FPD_CCI_NOC_3_ARREADY),
        .S05_AXI_arregion({1'b0,1'b0,1'b0,1'b0}),
        .S05_AXI_arsize(versal_cips_0_FPD_CCI_NOC_3_ARSIZE),
        .S05_AXI_aruser(versal_cips_0_FPD_CCI_NOC_3_ARUSER),
        .S05_AXI_arvalid(versal_cips_0_FPD_CCI_NOC_3_ARVALID),
        .S05_AXI_awaddr(versal_cips_0_FPD_CCI_NOC_3_AWADDR),
        .S05_AXI_awburst(versal_cips_0_FPD_CCI_NOC_3_AWBURST),
        .S05_AXI_awcache(versal_cips_0_FPD_CCI_NOC_3_AWCACHE),
        .S05_AXI_awid(versal_cips_0_FPD_CCI_NOC_3_AWID),
        .S05_AXI_awlen(versal_cips_0_FPD_CCI_NOC_3_AWLEN),
        .S05_AXI_awlock(versal_cips_0_FPD_CCI_NOC_3_AWLOCK),
        .S05_AXI_awprot(versal_cips_0_FPD_CCI_NOC_3_AWPROT),
        .S05_AXI_awqos(versal_cips_0_FPD_CCI_NOC_3_AWQOS),
        .S05_AXI_awready(versal_cips_0_FPD_CCI_NOC_3_AWREADY),
        .S05_AXI_awregion({1'b0,1'b0,1'b0,1'b0}),
        .S05_AXI_awsize(versal_cips_0_FPD_CCI_NOC_3_AWSIZE),
        .S05_AXI_awuser(versal_cips_0_FPD_CCI_NOC_3_AWUSER),
        .S05_AXI_awvalid(versal_cips_0_FPD_CCI_NOC_3_AWVALID),
        .S05_AXI_bid(versal_cips_0_FPD_CCI_NOC_3_BID),
        .S05_AXI_bready(versal_cips_0_FPD_CCI_NOC_3_BREADY),
        .S05_AXI_bresp(versal_cips_0_FPD_CCI_NOC_3_BRESP),
        .S05_AXI_bvalid(versal_cips_0_FPD_CCI_NOC_3_BVALID),
        .S05_AXI_rdata(versal_cips_0_FPD_CCI_NOC_3_RDATA),
        .S05_AXI_rid(versal_cips_0_FPD_CCI_NOC_3_RID),
        .S05_AXI_rlast(versal_cips_0_FPD_CCI_NOC_3_RLAST),
        .S05_AXI_rready(versal_cips_0_FPD_CCI_NOC_3_RREADY),
        .S05_AXI_rresp(versal_cips_0_FPD_CCI_NOC_3_RRESP),
        .S05_AXI_rvalid(versal_cips_0_FPD_CCI_NOC_3_RVALID),
        .S05_AXI_wdata(versal_cips_0_FPD_CCI_NOC_3_WDATA),
        .S05_AXI_wlast(versal_cips_0_FPD_CCI_NOC_3_WLAST),
        .S05_AXI_wready(versal_cips_0_FPD_CCI_NOC_3_WREADY),
        .S05_AXI_wstrb(versal_cips_0_FPD_CCI_NOC_3_WSTRB),
        .S05_AXI_wuser(versal_cips_0_FPD_CCI_NOC_3_WUSER),
        .S05_AXI_wvalid(versal_cips_0_FPD_CCI_NOC_3_WVALID),
        .aclk0(versal_cips_0_pmc_axi_noc_axi0_clk),
        .aclk1(versal_cips_0_lpd_axi_noc_clk),
        .aclk2(versal_cips_0_fpd_cci_noc_axi0_clk),
        .aclk3(versal_cips_0_fpd_cci_noc_axi1_clk),
        .aclk4(versal_cips_0_fpd_cci_noc_axi2_clk),
        .aclk5(versal_cips_0_fpd_cci_noc_axi3_clk),
        .aclk6(clk_wizard_0_clk_out1),
        .sys_clk0_clk_n(ddr4_dimm1_sma_clk_1_CLK_N),
        .sys_clk0_clk_p(ddr4_dimm1_sma_clk_1_CLK_P));
  cips_ddr_pl_debug_axis_ila_0_0 axis_ila_0
       (.SLOT_0_AXI_araddr(axi_noc_0_M01_AXI_ARADDR),
        .SLOT_0_AXI_arburst(axi_noc_0_M01_AXI_ARBURST),
        .SLOT_0_AXI_arcache(axi_noc_0_M01_AXI_ARCACHE),
        .SLOT_0_AXI_arid(axi_noc_0_M01_AXI_ARID),
        .SLOT_0_AXI_arlen(axi_noc_0_M01_AXI_ARLEN),
        .SLOT_0_AXI_arlock(axi_noc_0_M01_AXI_ARLOCK),
        .SLOT_0_AXI_arprot(axi_noc_0_M01_AXI_ARPROT),
        .SLOT_0_AXI_arqos(axi_noc_0_M01_AXI_ARQOS),
        .SLOT_0_AXI_arready(axi_noc_0_M01_AXI_ARREADY),
        .SLOT_0_AXI_arregion(axi_noc_0_M01_AXI_ARREGION),
        .SLOT_0_AXI_arsize(axi_noc_0_M01_AXI_ARSIZE),
        .SLOT_0_AXI_aruser(axi_noc_0_M01_AXI_ARUSER),
        .SLOT_0_AXI_arvalid(axi_noc_0_M01_AXI_ARVALID),
        .SLOT_0_AXI_awaddr(axi_noc_0_M01_AXI_AWADDR),
        .SLOT_0_AXI_awburst(axi_noc_0_M01_AXI_AWBURST),
        .SLOT_0_AXI_awcache(axi_noc_0_M01_AXI_AWCACHE),
        .SLOT_0_AXI_awid(axi_noc_0_M01_AXI_AWID),
        .SLOT_0_AXI_awlen(axi_noc_0_M01_AXI_AWLEN),
        .SLOT_0_AXI_awlock(axi_noc_0_M01_AXI_AWLOCK),
        .SLOT_0_AXI_awprot(axi_noc_0_M01_AXI_AWPROT),
        .SLOT_0_AXI_awqos(axi_noc_0_M01_AXI_AWQOS),
        .SLOT_0_AXI_awready(axi_noc_0_M01_AXI_AWREADY),
        .SLOT_0_AXI_awregion(axi_noc_0_M01_AXI_AWREGION),
        .SLOT_0_AXI_awsize(axi_noc_0_M01_AXI_AWSIZE),
        .SLOT_0_AXI_awuser(axi_noc_0_M01_AXI_AWUSER),
        .SLOT_0_AXI_awvalid(axi_noc_0_M01_AXI_AWVALID),
        .SLOT_0_AXI_bid(axi_noc_0_M01_AXI_BID),
        .SLOT_0_AXI_bready(axi_noc_0_M01_AXI_BREADY),
        .SLOT_0_AXI_bresp(axi_noc_0_M01_AXI_BRESP),
        .SLOT_0_AXI_bvalid(axi_noc_0_M01_AXI_BVALID),
        .SLOT_0_AXI_rdata(axi_noc_0_M01_AXI_RDATA),
        .SLOT_0_AXI_rid(axi_noc_0_M01_AXI_RID),
        .SLOT_0_AXI_rlast(axi_noc_0_M01_AXI_RLAST),
        .SLOT_0_AXI_rready(axi_noc_0_M01_AXI_RREADY),
        .SLOT_0_AXI_rresp(axi_noc_0_M01_AXI_RRESP),
        .SLOT_0_AXI_rvalid(axi_noc_0_M01_AXI_RVALID),
        .SLOT_0_AXI_wdata(axi_noc_0_M01_AXI_WDATA),
        .SLOT_0_AXI_wlast(axi_noc_0_M01_AXI_WLAST),
        .SLOT_0_AXI_wready(axi_noc_0_M01_AXI_WREADY),
        .SLOT_0_AXI_wstrb(axi_noc_0_M01_AXI_WSTRB),
        .SLOT_0_AXI_wvalid(axi_noc_0_M01_AXI_WVALID),
        .clk(clk_wizard_0_clk_out1),
        .resetn(proc_sys_reset_0_peripheral_aresetn));
  cips_ddr_pl_debug_axis_vio_0_0 axis_vio_0
       (.clk(clk_wizard_0_clk_out1),
        .probe_in0(c_counter_binary_0_Q),
        .probe_out0(axis_vio_0_probe_out0),
        .probe_out1(axis_vio_0_probe_out1),
        .probe_out2(axis_vio_0_probe_out2));
  cips_ddr_pl_debug_c_counter_binary_0_0 c_counter_binary_0
       (.CLK(clk_wizard_0_clk_out1),
        .L(axis_vio_0_probe_out2),
        .LOAD(axis_vio_0_probe_out1),
        .Q(c_counter_binary_0_Q),
        .SSET(axis_vio_0_probe_out0));
  cips_ddr_pl_debug_clk_wizard_0_0 clk_wizard_0
       (.clk_in1(versal_cips_0_pl0_ref_clk),
        .clk_out1(clk_wizard_0_clk_out1));
  cips_ddr_pl_debug_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(versal_cips_0_pl0_resetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(clk_wizard_0_clk_out1));
  cips_ddr_pl_debug_versal_cips_0_0 versal_cips_0
       (.FPD_CCI_NOC_0_araddr(versal_cips_0_FPD_CCI_NOC_0_ARADDR),
        .FPD_CCI_NOC_0_arburst(versal_cips_0_FPD_CCI_NOC_0_ARBURST),
        .FPD_CCI_NOC_0_arcache(versal_cips_0_FPD_CCI_NOC_0_ARCACHE),
        .FPD_CCI_NOC_0_arid(versal_cips_0_FPD_CCI_NOC_0_ARID),
        .FPD_CCI_NOC_0_arlen(versal_cips_0_FPD_CCI_NOC_0_ARLEN),
        .FPD_CCI_NOC_0_arlock(versal_cips_0_FPD_CCI_NOC_0_ARLOCK),
        .FPD_CCI_NOC_0_arprot(versal_cips_0_FPD_CCI_NOC_0_ARPROT),
        .FPD_CCI_NOC_0_arqos(versal_cips_0_FPD_CCI_NOC_0_ARQOS),
        .FPD_CCI_NOC_0_arready(versal_cips_0_FPD_CCI_NOC_0_ARREADY),
        .FPD_CCI_NOC_0_arsize(versal_cips_0_FPD_CCI_NOC_0_ARSIZE),
        .FPD_CCI_NOC_0_aruser(versal_cips_0_FPD_CCI_NOC_0_ARUSER),
        .FPD_CCI_NOC_0_arvalid(versal_cips_0_FPD_CCI_NOC_0_ARVALID),
        .FPD_CCI_NOC_0_awaddr(versal_cips_0_FPD_CCI_NOC_0_AWADDR),
        .FPD_CCI_NOC_0_awburst(versal_cips_0_FPD_CCI_NOC_0_AWBURST),
        .FPD_CCI_NOC_0_awcache(versal_cips_0_FPD_CCI_NOC_0_AWCACHE),
        .FPD_CCI_NOC_0_awid(versal_cips_0_FPD_CCI_NOC_0_AWID),
        .FPD_CCI_NOC_0_awlen(versal_cips_0_FPD_CCI_NOC_0_AWLEN),
        .FPD_CCI_NOC_0_awlock(versal_cips_0_FPD_CCI_NOC_0_AWLOCK),
        .FPD_CCI_NOC_0_awprot(versal_cips_0_FPD_CCI_NOC_0_AWPROT),
        .FPD_CCI_NOC_0_awqos(versal_cips_0_FPD_CCI_NOC_0_AWQOS),
        .FPD_CCI_NOC_0_awready(versal_cips_0_FPD_CCI_NOC_0_AWREADY),
        .FPD_CCI_NOC_0_awsize(versal_cips_0_FPD_CCI_NOC_0_AWSIZE),
        .FPD_CCI_NOC_0_awuser(versal_cips_0_FPD_CCI_NOC_0_AWUSER),
        .FPD_CCI_NOC_0_awvalid(versal_cips_0_FPD_CCI_NOC_0_AWVALID),
        .FPD_CCI_NOC_0_bid(versal_cips_0_FPD_CCI_NOC_0_BID),
        .FPD_CCI_NOC_0_bready(versal_cips_0_FPD_CCI_NOC_0_BREADY),
        .FPD_CCI_NOC_0_bresp(versal_cips_0_FPD_CCI_NOC_0_BRESP),
        .FPD_CCI_NOC_0_bvalid(versal_cips_0_FPD_CCI_NOC_0_BVALID),
        .FPD_CCI_NOC_0_rdata(versal_cips_0_FPD_CCI_NOC_0_RDATA),
        .FPD_CCI_NOC_0_rid(versal_cips_0_FPD_CCI_NOC_0_RID),
        .FPD_CCI_NOC_0_rlast(versal_cips_0_FPD_CCI_NOC_0_RLAST),
        .FPD_CCI_NOC_0_rready(versal_cips_0_FPD_CCI_NOC_0_RREADY),
        .FPD_CCI_NOC_0_rresp(versal_cips_0_FPD_CCI_NOC_0_RRESP),
        .FPD_CCI_NOC_0_rvalid(versal_cips_0_FPD_CCI_NOC_0_RVALID),
        .FPD_CCI_NOC_0_wdata(versal_cips_0_FPD_CCI_NOC_0_WDATA),
        .FPD_CCI_NOC_0_wlast(versal_cips_0_FPD_CCI_NOC_0_WLAST),
        .FPD_CCI_NOC_0_wready(versal_cips_0_FPD_CCI_NOC_0_WREADY),
        .FPD_CCI_NOC_0_wstrb(versal_cips_0_FPD_CCI_NOC_0_WSTRB),
        .FPD_CCI_NOC_0_wuser(versal_cips_0_FPD_CCI_NOC_0_WUSER),
        .FPD_CCI_NOC_0_wvalid(versal_cips_0_FPD_CCI_NOC_0_WVALID),
        .FPD_CCI_NOC_1_araddr(versal_cips_0_FPD_CCI_NOC_1_ARADDR),
        .FPD_CCI_NOC_1_arburst(versal_cips_0_FPD_CCI_NOC_1_ARBURST),
        .FPD_CCI_NOC_1_arcache(versal_cips_0_FPD_CCI_NOC_1_ARCACHE),
        .FPD_CCI_NOC_1_arid(versal_cips_0_FPD_CCI_NOC_1_ARID),
        .FPD_CCI_NOC_1_arlen(versal_cips_0_FPD_CCI_NOC_1_ARLEN),
        .FPD_CCI_NOC_1_arlock(versal_cips_0_FPD_CCI_NOC_1_ARLOCK),
        .FPD_CCI_NOC_1_arprot(versal_cips_0_FPD_CCI_NOC_1_ARPROT),
        .FPD_CCI_NOC_1_arqos(versal_cips_0_FPD_CCI_NOC_1_ARQOS),
        .FPD_CCI_NOC_1_arready(versal_cips_0_FPD_CCI_NOC_1_ARREADY),
        .FPD_CCI_NOC_1_arsize(versal_cips_0_FPD_CCI_NOC_1_ARSIZE),
        .FPD_CCI_NOC_1_aruser(versal_cips_0_FPD_CCI_NOC_1_ARUSER),
        .FPD_CCI_NOC_1_arvalid(versal_cips_0_FPD_CCI_NOC_1_ARVALID),
        .FPD_CCI_NOC_1_awaddr(versal_cips_0_FPD_CCI_NOC_1_AWADDR),
        .FPD_CCI_NOC_1_awburst(versal_cips_0_FPD_CCI_NOC_1_AWBURST),
        .FPD_CCI_NOC_1_awcache(versal_cips_0_FPD_CCI_NOC_1_AWCACHE),
        .FPD_CCI_NOC_1_awid(versal_cips_0_FPD_CCI_NOC_1_AWID),
        .FPD_CCI_NOC_1_awlen(versal_cips_0_FPD_CCI_NOC_1_AWLEN),
        .FPD_CCI_NOC_1_awlock(versal_cips_0_FPD_CCI_NOC_1_AWLOCK),
        .FPD_CCI_NOC_1_awprot(versal_cips_0_FPD_CCI_NOC_1_AWPROT),
        .FPD_CCI_NOC_1_awqos(versal_cips_0_FPD_CCI_NOC_1_AWQOS),
        .FPD_CCI_NOC_1_awready(versal_cips_0_FPD_CCI_NOC_1_AWREADY),
        .FPD_CCI_NOC_1_awsize(versal_cips_0_FPD_CCI_NOC_1_AWSIZE),
        .FPD_CCI_NOC_1_awuser(versal_cips_0_FPD_CCI_NOC_1_AWUSER),
        .FPD_CCI_NOC_1_awvalid(versal_cips_0_FPD_CCI_NOC_1_AWVALID),
        .FPD_CCI_NOC_1_bid(versal_cips_0_FPD_CCI_NOC_1_BID),
        .FPD_CCI_NOC_1_bready(versal_cips_0_FPD_CCI_NOC_1_BREADY),
        .FPD_CCI_NOC_1_bresp(versal_cips_0_FPD_CCI_NOC_1_BRESP),
        .FPD_CCI_NOC_1_bvalid(versal_cips_0_FPD_CCI_NOC_1_BVALID),
        .FPD_CCI_NOC_1_rdata(versal_cips_0_FPD_CCI_NOC_1_RDATA),
        .FPD_CCI_NOC_1_rid(versal_cips_0_FPD_CCI_NOC_1_RID),
        .FPD_CCI_NOC_1_rlast(versal_cips_0_FPD_CCI_NOC_1_RLAST),
        .FPD_CCI_NOC_1_rready(versal_cips_0_FPD_CCI_NOC_1_RREADY),
        .FPD_CCI_NOC_1_rresp(versal_cips_0_FPD_CCI_NOC_1_RRESP),
        .FPD_CCI_NOC_1_rvalid(versal_cips_0_FPD_CCI_NOC_1_RVALID),
        .FPD_CCI_NOC_1_wdata(versal_cips_0_FPD_CCI_NOC_1_WDATA),
        .FPD_CCI_NOC_1_wlast(versal_cips_0_FPD_CCI_NOC_1_WLAST),
        .FPD_CCI_NOC_1_wready(versal_cips_0_FPD_CCI_NOC_1_WREADY),
        .FPD_CCI_NOC_1_wstrb(versal_cips_0_FPD_CCI_NOC_1_WSTRB),
        .FPD_CCI_NOC_1_wuser(versal_cips_0_FPD_CCI_NOC_1_WUSER),
        .FPD_CCI_NOC_1_wvalid(versal_cips_0_FPD_CCI_NOC_1_WVALID),
        .FPD_CCI_NOC_2_araddr(versal_cips_0_FPD_CCI_NOC_2_ARADDR),
        .FPD_CCI_NOC_2_arburst(versal_cips_0_FPD_CCI_NOC_2_ARBURST),
        .FPD_CCI_NOC_2_arcache(versal_cips_0_FPD_CCI_NOC_2_ARCACHE),
        .FPD_CCI_NOC_2_arid(versal_cips_0_FPD_CCI_NOC_2_ARID),
        .FPD_CCI_NOC_2_arlen(versal_cips_0_FPD_CCI_NOC_2_ARLEN),
        .FPD_CCI_NOC_2_arlock(versal_cips_0_FPD_CCI_NOC_2_ARLOCK),
        .FPD_CCI_NOC_2_arprot(versal_cips_0_FPD_CCI_NOC_2_ARPROT),
        .FPD_CCI_NOC_2_arqos(versal_cips_0_FPD_CCI_NOC_2_ARQOS),
        .FPD_CCI_NOC_2_arready(versal_cips_0_FPD_CCI_NOC_2_ARREADY),
        .FPD_CCI_NOC_2_arsize(versal_cips_0_FPD_CCI_NOC_2_ARSIZE),
        .FPD_CCI_NOC_2_aruser(versal_cips_0_FPD_CCI_NOC_2_ARUSER),
        .FPD_CCI_NOC_2_arvalid(versal_cips_0_FPD_CCI_NOC_2_ARVALID),
        .FPD_CCI_NOC_2_awaddr(versal_cips_0_FPD_CCI_NOC_2_AWADDR),
        .FPD_CCI_NOC_2_awburst(versal_cips_0_FPD_CCI_NOC_2_AWBURST),
        .FPD_CCI_NOC_2_awcache(versal_cips_0_FPD_CCI_NOC_2_AWCACHE),
        .FPD_CCI_NOC_2_awid(versal_cips_0_FPD_CCI_NOC_2_AWID),
        .FPD_CCI_NOC_2_awlen(versal_cips_0_FPD_CCI_NOC_2_AWLEN),
        .FPD_CCI_NOC_2_awlock(versal_cips_0_FPD_CCI_NOC_2_AWLOCK),
        .FPD_CCI_NOC_2_awprot(versal_cips_0_FPD_CCI_NOC_2_AWPROT),
        .FPD_CCI_NOC_2_awqos(versal_cips_0_FPD_CCI_NOC_2_AWQOS),
        .FPD_CCI_NOC_2_awready(versal_cips_0_FPD_CCI_NOC_2_AWREADY),
        .FPD_CCI_NOC_2_awsize(versal_cips_0_FPD_CCI_NOC_2_AWSIZE),
        .FPD_CCI_NOC_2_awuser(versal_cips_0_FPD_CCI_NOC_2_AWUSER),
        .FPD_CCI_NOC_2_awvalid(versal_cips_0_FPD_CCI_NOC_2_AWVALID),
        .FPD_CCI_NOC_2_bid(versal_cips_0_FPD_CCI_NOC_2_BID),
        .FPD_CCI_NOC_2_bready(versal_cips_0_FPD_CCI_NOC_2_BREADY),
        .FPD_CCI_NOC_2_bresp(versal_cips_0_FPD_CCI_NOC_2_BRESP),
        .FPD_CCI_NOC_2_bvalid(versal_cips_0_FPD_CCI_NOC_2_BVALID),
        .FPD_CCI_NOC_2_rdata(versal_cips_0_FPD_CCI_NOC_2_RDATA),
        .FPD_CCI_NOC_2_rid(versal_cips_0_FPD_CCI_NOC_2_RID),
        .FPD_CCI_NOC_2_rlast(versal_cips_0_FPD_CCI_NOC_2_RLAST),
        .FPD_CCI_NOC_2_rready(versal_cips_0_FPD_CCI_NOC_2_RREADY),
        .FPD_CCI_NOC_2_rresp(versal_cips_0_FPD_CCI_NOC_2_RRESP),
        .FPD_CCI_NOC_2_rvalid(versal_cips_0_FPD_CCI_NOC_2_RVALID),
        .FPD_CCI_NOC_2_wdata(versal_cips_0_FPD_CCI_NOC_2_WDATA),
        .FPD_CCI_NOC_2_wlast(versal_cips_0_FPD_CCI_NOC_2_WLAST),
        .FPD_CCI_NOC_2_wready(versal_cips_0_FPD_CCI_NOC_2_WREADY),
        .FPD_CCI_NOC_2_wstrb(versal_cips_0_FPD_CCI_NOC_2_WSTRB),
        .FPD_CCI_NOC_2_wuser(versal_cips_0_FPD_CCI_NOC_2_WUSER),
        .FPD_CCI_NOC_2_wvalid(versal_cips_0_FPD_CCI_NOC_2_WVALID),
        .FPD_CCI_NOC_3_araddr(versal_cips_0_FPD_CCI_NOC_3_ARADDR),
        .FPD_CCI_NOC_3_arburst(versal_cips_0_FPD_CCI_NOC_3_ARBURST),
        .FPD_CCI_NOC_3_arcache(versal_cips_0_FPD_CCI_NOC_3_ARCACHE),
        .FPD_CCI_NOC_3_arid(versal_cips_0_FPD_CCI_NOC_3_ARID),
        .FPD_CCI_NOC_3_arlen(versal_cips_0_FPD_CCI_NOC_3_ARLEN),
        .FPD_CCI_NOC_3_arlock(versal_cips_0_FPD_CCI_NOC_3_ARLOCK),
        .FPD_CCI_NOC_3_arprot(versal_cips_0_FPD_CCI_NOC_3_ARPROT),
        .FPD_CCI_NOC_3_arqos(versal_cips_0_FPD_CCI_NOC_3_ARQOS),
        .FPD_CCI_NOC_3_arready(versal_cips_0_FPD_CCI_NOC_3_ARREADY),
        .FPD_CCI_NOC_3_arsize(versal_cips_0_FPD_CCI_NOC_3_ARSIZE),
        .FPD_CCI_NOC_3_aruser(versal_cips_0_FPD_CCI_NOC_3_ARUSER),
        .FPD_CCI_NOC_3_arvalid(versal_cips_0_FPD_CCI_NOC_3_ARVALID),
        .FPD_CCI_NOC_3_awaddr(versal_cips_0_FPD_CCI_NOC_3_AWADDR),
        .FPD_CCI_NOC_3_awburst(versal_cips_0_FPD_CCI_NOC_3_AWBURST),
        .FPD_CCI_NOC_3_awcache(versal_cips_0_FPD_CCI_NOC_3_AWCACHE),
        .FPD_CCI_NOC_3_awid(versal_cips_0_FPD_CCI_NOC_3_AWID),
        .FPD_CCI_NOC_3_awlen(versal_cips_0_FPD_CCI_NOC_3_AWLEN),
        .FPD_CCI_NOC_3_awlock(versal_cips_0_FPD_CCI_NOC_3_AWLOCK),
        .FPD_CCI_NOC_3_awprot(versal_cips_0_FPD_CCI_NOC_3_AWPROT),
        .FPD_CCI_NOC_3_awqos(versal_cips_0_FPD_CCI_NOC_3_AWQOS),
        .FPD_CCI_NOC_3_awready(versal_cips_0_FPD_CCI_NOC_3_AWREADY),
        .FPD_CCI_NOC_3_awsize(versal_cips_0_FPD_CCI_NOC_3_AWSIZE),
        .FPD_CCI_NOC_3_awuser(versal_cips_0_FPD_CCI_NOC_3_AWUSER),
        .FPD_CCI_NOC_3_awvalid(versal_cips_0_FPD_CCI_NOC_3_AWVALID),
        .FPD_CCI_NOC_3_bid(versal_cips_0_FPD_CCI_NOC_3_BID),
        .FPD_CCI_NOC_3_bready(versal_cips_0_FPD_CCI_NOC_3_BREADY),
        .FPD_CCI_NOC_3_bresp(versal_cips_0_FPD_CCI_NOC_3_BRESP),
        .FPD_CCI_NOC_3_bvalid(versal_cips_0_FPD_CCI_NOC_3_BVALID),
        .FPD_CCI_NOC_3_rdata(versal_cips_0_FPD_CCI_NOC_3_RDATA),
        .FPD_CCI_NOC_3_rid(versal_cips_0_FPD_CCI_NOC_3_RID),
        .FPD_CCI_NOC_3_rlast(versal_cips_0_FPD_CCI_NOC_3_RLAST),
        .FPD_CCI_NOC_3_rready(versal_cips_0_FPD_CCI_NOC_3_RREADY),
        .FPD_CCI_NOC_3_rresp(versal_cips_0_FPD_CCI_NOC_3_RRESP),
        .FPD_CCI_NOC_3_rvalid(versal_cips_0_FPD_CCI_NOC_3_RVALID),
        .FPD_CCI_NOC_3_wdata(versal_cips_0_FPD_CCI_NOC_3_WDATA),
        .FPD_CCI_NOC_3_wlast(versal_cips_0_FPD_CCI_NOC_3_WLAST),
        .FPD_CCI_NOC_3_wready(versal_cips_0_FPD_CCI_NOC_3_WREADY),
        .FPD_CCI_NOC_3_wstrb(versal_cips_0_FPD_CCI_NOC_3_WSTRB),
        .FPD_CCI_NOC_3_wuser(versal_cips_0_FPD_CCI_NOC_3_WUSER),
        .FPD_CCI_NOC_3_wvalid(versal_cips_0_FPD_CCI_NOC_3_WVALID),
        .LPD_AXI_NOC_0_araddr(versal_cips_0_LPD_AXI_NOC_0_ARADDR),
        .LPD_AXI_NOC_0_arburst(versal_cips_0_LPD_AXI_NOC_0_ARBURST),
        .LPD_AXI_NOC_0_arcache(versal_cips_0_LPD_AXI_NOC_0_ARCACHE),
        .LPD_AXI_NOC_0_arid(versal_cips_0_LPD_AXI_NOC_0_ARID),
        .LPD_AXI_NOC_0_arlen(versal_cips_0_LPD_AXI_NOC_0_ARLEN),
        .LPD_AXI_NOC_0_arlock(versal_cips_0_LPD_AXI_NOC_0_ARLOCK),
        .LPD_AXI_NOC_0_arprot(versal_cips_0_LPD_AXI_NOC_0_ARPROT),
        .LPD_AXI_NOC_0_arqos(versal_cips_0_LPD_AXI_NOC_0_ARQOS),
        .LPD_AXI_NOC_0_arready(versal_cips_0_LPD_AXI_NOC_0_ARREADY),
        .LPD_AXI_NOC_0_arsize(versal_cips_0_LPD_AXI_NOC_0_ARSIZE),
        .LPD_AXI_NOC_0_aruser(versal_cips_0_LPD_AXI_NOC_0_ARUSER),
        .LPD_AXI_NOC_0_arvalid(versal_cips_0_LPD_AXI_NOC_0_ARVALID),
        .LPD_AXI_NOC_0_awaddr(versal_cips_0_LPD_AXI_NOC_0_AWADDR),
        .LPD_AXI_NOC_0_awburst(versal_cips_0_LPD_AXI_NOC_0_AWBURST),
        .LPD_AXI_NOC_0_awcache(versal_cips_0_LPD_AXI_NOC_0_AWCACHE),
        .LPD_AXI_NOC_0_awid(versal_cips_0_LPD_AXI_NOC_0_AWID),
        .LPD_AXI_NOC_0_awlen(versal_cips_0_LPD_AXI_NOC_0_AWLEN),
        .LPD_AXI_NOC_0_awlock(versal_cips_0_LPD_AXI_NOC_0_AWLOCK),
        .LPD_AXI_NOC_0_awprot(versal_cips_0_LPD_AXI_NOC_0_AWPROT),
        .LPD_AXI_NOC_0_awqos(versal_cips_0_LPD_AXI_NOC_0_AWQOS),
        .LPD_AXI_NOC_0_awready(versal_cips_0_LPD_AXI_NOC_0_AWREADY),
        .LPD_AXI_NOC_0_awsize(versal_cips_0_LPD_AXI_NOC_0_AWSIZE),
        .LPD_AXI_NOC_0_awuser(versal_cips_0_LPD_AXI_NOC_0_AWUSER),
        .LPD_AXI_NOC_0_awvalid(versal_cips_0_LPD_AXI_NOC_0_AWVALID),
        .LPD_AXI_NOC_0_bid(versal_cips_0_LPD_AXI_NOC_0_BID),
        .LPD_AXI_NOC_0_bready(versal_cips_0_LPD_AXI_NOC_0_BREADY),
        .LPD_AXI_NOC_0_bresp(versal_cips_0_LPD_AXI_NOC_0_BRESP),
        .LPD_AXI_NOC_0_bvalid(versal_cips_0_LPD_AXI_NOC_0_BVALID),
        .LPD_AXI_NOC_0_rdata(versal_cips_0_LPD_AXI_NOC_0_RDATA),
        .LPD_AXI_NOC_0_rid(versal_cips_0_LPD_AXI_NOC_0_RID),
        .LPD_AXI_NOC_0_rlast(versal_cips_0_LPD_AXI_NOC_0_RLAST),
        .LPD_AXI_NOC_0_rready(versal_cips_0_LPD_AXI_NOC_0_RREADY),
        .LPD_AXI_NOC_0_rresp(versal_cips_0_LPD_AXI_NOC_0_RRESP),
        .LPD_AXI_NOC_0_rvalid(versal_cips_0_LPD_AXI_NOC_0_RVALID),
        .LPD_AXI_NOC_0_wdata(versal_cips_0_LPD_AXI_NOC_0_WDATA),
        .LPD_AXI_NOC_0_wlast(versal_cips_0_LPD_AXI_NOC_0_WLAST),
        .LPD_AXI_NOC_0_wready(versal_cips_0_LPD_AXI_NOC_0_WREADY),
        .LPD_AXI_NOC_0_wstrb(versal_cips_0_LPD_AXI_NOC_0_WSTRB),
        .LPD_AXI_NOC_0_wvalid(versal_cips_0_LPD_AXI_NOC_0_WVALID),
        .PMC_NOC_AXI_0_araddr(versal_cips_0_PMC_NOC_AXI_0_ARADDR),
        .PMC_NOC_AXI_0_arburst(versal_cips_0_PMC_NOC_AXI_0_ARBURST),
        .PMC_NOC_AXI_0_arcache(versal_cips_0_PMC_NOC_AXI_0_ARCACHE),
        .PMC_NOC_AXI_0_arid(versal_cips_0_PMC_NOC_AXI_0_ARID),
        .PMC_NOC_AXI_0_arlen(versal_cips_0_PMC_NOC_AXI_0_ARLEN),
        .PMC_NOC_AXI_0_arlock(versal_cips_0_PMC_NOC_AXI_0_ARLOCK),
        .PMC_NOC_AXI_0_arprot(versal_cips_0_PMC_NOC_AXI_0_ARPROT),
        .PMC_NOC_AXI_0_arqos(versal_cips_0_PMC_NOC_AXI_0_ARQOS),
        .PMC_NOC_AXI_0_arready(versal_cips_0_PMC_NOC_AXI_0_ARREADY),
        .PMC_NOC_AXI_0_arregion(versal_cips_0_PMC_NOC_AXI_0_ARREGION),
        .PMC_NOC_AXI_0_arsize(versal_cips_0_PMC_NOC_AXI_0_ARSIZE),
        .PMC_NOC_AXI_0_aruser(versal_cips_0_PMC_NOC_AXI_0_ARUSER),
        .PMC_NOC_AXI_0_arvalid(versal_cips_0_PMC_NOC_AXI_0_ARVALID),
        .PMC_NOC_AXI_0_awaddr(versal_cips_0_PMC_NOC_AXI_0_AWADDR),
        .PMC_NOC_AXI_0_awburst(versal_cips_0_PMC_NOC_AXI_0_AWBURST),
        .PMC_NOC_AXI_0_awcache(versal_cips_0_PMC_NOC_AXI_0_AWCACHE),
        .PMC_NOC_AXI_0_awid(versal_cips_0_PMC_NOC_AXI_0_AWID),
        .PMC_NOC_AXI_0_awlen(versal_cips_0_PMC_NOC_AXI_0_AWLEN),
        .PMC_NOC_AXI_0_awlock(versal_cips_0_PMC_NOC_AXI_0_AWLOCK),
        .PMC_NOC_AXI_0_awprot(versal_cips_0_PMC_NOC_AXI_0_AWPROT),
        .PMC_NOC_AXI_0_awqos(versal_cips_0_PMC_NOC_AXI_0_AWQOS),
        .PMC_NOC_AXI_0_awready(versal_cips_0_PMC_NOC_AXI_0_AWREADY),
        .PMC_NOC_AXI_0_awregion(versal_cips_0_PMC_NOC_AXI_0_AWREGION),
        .PMC_NOC_AXI_0_awsize(versal_cips_0_PMC_NOC_AXI_0_AWSIZE),
        .PMC_NOC_AXI_0_awuser(versal_cips_0_PMC_NOC_AXI_0_AWUSER),
        .PMC_NOC_AXI_0_awvalid(versal_cips_0_PMC_NOC_AXI_0_AWVALID),
        .PMC_NOC_AXI_0_bid(versal_cips_0_PMC_NOC_AXI_0_BID),
        .PMC_NOC_AXI_0_bready(versal_cips_0_PMC_NOC_AXI_0_BREADY),
        .PMC_NOC_AXI_0_bresp(versal_cips_0_PMC_NOC_AXI_0_BRESP),
        .PMC_NOC_AXI_0_buser(versal_cips_0_PMC_NOC_AXI_0_BUSER),
        .PMC_NOC_AXI_0_bvalid(versal_cips_0_PMC_NOC_AXI_0_BVALID),
        .PMC_NOC_AXI_0_rdata(versal_cips_0_PMC_NOC_AXI_0_RDATA),
        .PMC_NOC_AXI_0_rid(versal_cips_0_PMC_NOC_AXI_0_RID),
        .PMC_NOC_AXI_0_rlast(versal_cips_0_PMC_NOC_AXI_0_RLAST),
        .PMC_NOC_AXI_0_rready(versal_cips_0_PMC_NOC_AXI_0_RREADY),
        .PMC_NOC_AXI_0_rresp(versal_cips_0_PMC_NOC_AXI_0_RRESP),
        .PMC_NOC_AXI_0_ruser(versal_cips_0_PMC_NOC_AXI_0_RUSER),
        .PMC_NOC_AXI_0_rvalid(versal_cips_0_PMC_NOC_AXI_0_RVALID),
        .PMC_NOC_AXI_0_wdata(versal_cips_0_PMC_NOC_AXI_0_WDATA),
        .PMC_NOC_AXI_0_wlast(versal_cips_0_PMC_NOC_AXI_0_WLAST),
        .PMC_NOC_AXI_0_wready(versal_cips_0_PMC_NOC_AXI_0_WREADY),
        .PMC_NOC_AXI_0_wstrb(versal_cips_0_PMC_NOC_AXI_0_WSTRB),
        .PMC_NOC_AXI_0_wuser(versal_cips_0_PMC_NOC_AXI_0_WUSER),
        .PMC_NOC_AXI_0_wvalid(versal_cips_0_PMC_NOC_AXI_0_WVALID),
        .fpd_cci_noc_axi0_clk(versal_cips_0_fpd_cci_noc_axi0_clk),
        .fpd_cci_noc_axi1_clk(versal_cips_0_fpd_cci_noc_axi1_clk),
        .fpd_cci_noc_axi2_clk(versal_cips_0_fpd_cci_noc_axi2_clk),
        .fpd_cci_noc_axi3_clk(versal_cips_0_fpd_cci_noc_axi3_clk),
        .lpd_axi_noc_clk(versal_cips_0_lpd_axi_noc_clk),
        .pl0_ref_clk(versal_cips_0_pl0_ref_clk),
        .pl0_resetn(versal_cips_0_pl0_resetn),
        .pmc_axi_noc_axi0_clk(versal_cips_0_pmc_axi_noc_axi0_clk));
endmodule
