#******************************************************************************
#                                                                             *
#                  Copyright (C) 2009 Altera Corporation                      *
#                                                                             *
# ALTERA, ARRIA, CYCLONE, HARDCOPY, MAX, MEGACORE, NIOS, QUARTUS & STRATIX    *
# are Reg. U.S. Pat. & Tm. Off. and Altera marks in and outside the U.S.      *
#                                                                             *
# All information provided herein is provided on an "as is" basis,            *
# without warranty of any kind.                                               *
#                                                                             *
# File Name: counter_tb.do                                                    *
#                                                                             *
# Function: Script file for Introduction to Verilog exercise 4b               *
#                                                                             *
# REVISION HISTORY:                                                           *
#  Revision 1.0    12/15/2009 - Initial Revision  for QII 9.1                 *
#******************************************************************************

vlib work
vlog uart_tx.v uart_tx_tb.v
vsim -t ns work.uart_tx_tb
view wave
add wave -radix binary /tx_clk
add wave -radix binary /tx_output
add wave -radix unsigned /clk_count
add wave -radix binary /nRST  
add wave -radix binary /tx_data 
add wave -radix binary /tx_busy

run  1ms