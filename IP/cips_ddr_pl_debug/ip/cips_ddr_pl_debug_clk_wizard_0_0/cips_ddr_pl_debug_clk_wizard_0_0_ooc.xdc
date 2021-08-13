# file: cips_ddr_pl_debug_clk_wizard_0_0_ooc.xdc

################
#DEFAULT CLOCK CONSTRAINTS

############################################################
# Clock Period Constraints                                 #
############################################################
create_clock -period 3.00000 [get_ports clk_in1]
#create_clock -period 10 [get_ports psclk]
