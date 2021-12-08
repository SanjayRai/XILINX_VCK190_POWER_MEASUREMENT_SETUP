`timescale 1 ps / 1 ps

module tb_vck190_tester_top ();


reg sim_clk = 0;

vck190_tester_top UUT (
  .sim_clk(sim_clk)
);

initial begin
    sim_clk = 0;
end

always 
    #5 sim_clk = !sim_clk;

endmodule
