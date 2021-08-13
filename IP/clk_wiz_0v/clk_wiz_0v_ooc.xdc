# file: clk_wiz_0v_ooc.xdc

################
#DEFAULT CLOCK CONSTRAINTS

############################################################
# Clock Period Constraints                                 #
############################################################
create_clock -period 10.00000 [get_ports clk_in1]
#create_clock -period 10 [get_ports psclk]
