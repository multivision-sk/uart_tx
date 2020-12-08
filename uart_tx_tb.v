
`timescale 1 ns/1 ns

module uart_tx_tb();

	// Wires to connect to DUT
	reg tx_clk;
	reg nRST ; 

	wire tx_output;
	wire clk_count ;
	wire tx_busy ; 
	
	parameter [7:0] tx_data = 8'h51 ; 
	
	// Instantiate unit under test (counter)
	uart_tx uart_tx1 (.tx_data(tx_data),.tx_clk(tx_clk),.nRST(nRST),.tx_output(tx_output), .clk_count(clk_count) , .tx_busy(tx_busy));

	// Process to create clock signal
	initial begin
		tx_clk = 0;
		forever tx_clk = #10 ~tx_clk;
	end
	
	
	initial begin 
		nRST = 0; 
		#300
		nRST = 1 ; 
		end
		
		



endmodule
