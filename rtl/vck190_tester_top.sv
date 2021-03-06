`timescale 1 ps / 1 ps
`include "vck190_tester_parameters.vh"

module vck190_tester_top (
`ifdef SIMULATION_ONLY
    input sim_clk
`else
    `ifndef NULL_BITSTREAM_DESIGN
      input [3:0]PCIE_grx_n,
      input [3:0]PCIE_grx_p,
      output [3:0]PCIE_gtx_n,
      output [3:0]PCIE_gtx_p,
      input PCIE_refclk_clk_n,
      input PCIE_refclk_clk_p,
      output ddr4_dimm1_act_n,
      output [16:0]ddr4_dimm1_adr,
      output [1:0]ddr4_dimm1_ba,
      output [1:0]ddr4_dimm1_bg,
      output ddr4_dimm1_ck_c,
      output ddr4_dimm1_ck_t,
      output ddr4_dimm1_cke,
      output ddr4_dimm1_cs_n,
      inout [7:0]ddr4_dimm1_dm_n,
      inout [63:0]ddr4_dimm1_dq,
      inout [7:0]ddr4_dimm1_dqs_c,
      inout [7:0]ddr4_dimm1_dqs_t,
      output ddr4_dimm1_odt,
      output ddr4_dimm1_reset_n,
      input ddr4_dimm1_sma_clk_clk_n,
      input ddr4_dimm1_sma_clk_clk_p,
    `endif
      output [3:0] USER_LED
`endif
);


`ifdef SIMULATION_ONLY
    
    top_log u_power_consumer_top (
            .clk_in(sim_clk),
            .USER_LED()
    );

`else
    `ifdef NULL_BITSTREAM_DESIGN
        assign USER_LED = 4'd0;
        cips_dbg_minimal cips_dbg_minimal_i ();
    `else
        wire CIPS_CLOCK_OUT_100M;
        wire [3:0] pl_LED;
        wire [3:0] gpio_led_out;


      cips_ddr_pl_debug cips_ddr_pl_debug_i
           (.CIPS_CLOCK_OUT_100M(CIPS_CLOCK_OUT_100M),
            .PCIE_grx_n(PCIE_grx_n),
            .PCIE_grx_p(PCIE_grx_p),
            .PCIE_gtx_n(PCIE_gtx_n),
            .PCIE_gtx_p(PCIE_gtx_p),
            .gt_refclk_clk_n(PCIE_refclk_clk_n),
            .gt_refclk_clk_p(PCIE_refclk_clk_p),
            .gpio_rtl_tri_o(gpio_led_out),
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
            .ddr4_dimm1_sma_clk_clk_p(ddr4_dimm1_sma_clk_clk_p));

            assign USER_LED = {pl_LED[1:0], gpio_led_out[1:0]};

            top_log u_power_consumer_top (
                    .clk_in(CIPS_CLOCK_OUT_100M),
                    .USER_LED(pl_LED)
            );

    `endif
`endif
endmodule
