module uart_tx(

	input 		tx_clk,
	input  		nRST,  
	input 		[7:0] tx_data, 
	output reg 	tx_output,
	output reg  [31:0] clk_count,
	output wire   tx_busy

) ; 

	parameter 	IDLE_ST = 0,
					START_ST = 1,
					D0_ST = 2,
					D1_ST = 3,
					D2_ST = 4,
					D3_ST = 5,
					D4_ST = 6,
					D5_ST = 7,
					D6_ST = 8,
					D7_ST = 9,
					STOP_ST = 10 ; 


	reg 	[3:0] tx_state = 0 ; 
			

	
	
	always@(posedge tx_clk, negedge nRST)
	if(!nRST) begin
		tx_state <= IDLE_ST;
		clk_count <= 0;
		tx_output <= 0;
	end
	else
	begin 
			case(tx_state) 
				IDLE_ST : begin 
				
					if(clk_count == 434) 
					begin 
						tx_state <= START_ST ; 
						tx_output <= 1;
						clk_count <= 0 ; 
					end
				
				else clk_count <= clk_count + 1 ;
				end
				
				START_ST : begin 
				
				if(clk_count == 434) begin 
					tx_state <= D0_ST ;
					tx_output <= 0 ; 
					clk_count <= 0 ; 
				end
				else clk_count <= clk_count + 1 ;
				end
				
				D0_ST : begin
				if(clk_count == 434) begin
				tx_state <= D1_ST ; 
				tx_output <= tx_data[0];
				clk_count <= 0 ; 
				end
				else clk_count <= clk_count + 1 ;
				end
				
				D1_ST : begin  
				if(clk_count ==434) begin 
					tx_state <= D2_ST; 
					tx_output <= tx_data[1];
					clk_count <= 0 ; 
				end
				else clk_count <= clk_count + 1 ;
				end
				
				D2_ST : begin  
				if(clk_count == 434) begin 
					tx_state <= D3_ST ; 
					tx_output <= tx_data[2];
					clk_count <= 0 ; 
				end
				else clk_count <= clk_count + 1 ;
				end
				
				D3_ST : begin 
				if(clk_count == 434) begin 
					tx_state <= D4_ST ;  
					tx_output <= tx_data[3];
					clk_count <= 0 ; 
				end
				else clk_count <= clk_count + 1 ;
				end
				
				D4_ST : begin  
				if(clk_count == 434) begin 
					tx_state <= D5_ST ; 
					tx_output <= tx_data[4];
				clk_count <= 0 ; 	
				end
				else clk_count <= clk_count + 1 ;
				end
				
				D5_ST : begin 
				if(clk_count == 434) begin 
					tx_state <= D6_ST ;
					tx_output <= tx_data[5];	
					clk_count <= 0 ; 
				end
				else clk_count <= clk_count + 1 ;
				end
				
				D6_ST : begin 
				if(clk_count == 434) begin 
					tx_state <= D7_ST ;  
					tx_output <= tx_data[6];
					clk_count <= 0 ; 
				end
				else clk_count <= clk_count + 1 ;
				end
				
				D7_ST : begin 
				if(clk_count == 434) begin 
					tx_state <= STOP_ST ; 
					tx_output <= tx_data[7];
					clk_count <= 0 ; 
					end
					else clk_count <= clk_count + 1 ;
					end
					
				STOP_ST : begin 
				if(clk_count == 434) begin 
					tx_state <= IDLE_ST ; 
					tx_output <= 1 ; 
					clk_count <= 0 ; 
					end
					else clk_count <= clk_count + 1 ;
					end
				
				
				default : begin  
				if(clk_count == 434) begin 
					tx_state <= IDLE_ST ;
					tx_output <= 1 ;
					clk_count <= 0 ; 
						end
						else clk_count <= clk_count + 1 ;
						end
						
			endcase
			

			
		end
		
					
			assign tx_busy = (tx_state != IDLE_ST) ; 
		




endmodule 