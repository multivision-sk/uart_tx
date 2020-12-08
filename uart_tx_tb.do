

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
