module bcd_7segment(
	input [3:0] bcd, 
	output reg [6:0] seven_segment,
	output reg [6:0] seven_segment2
);

always @ (bcd)
	begin
		case (bcd)
			
			4'b0000 : //x0
			begin seven_segment  = ~ 7'b0111111;
					seven_segment2 = ~ 7'b1111111;	
			end
			
			4'b0001 : //x1
			begin seven_segment  = ~ 7'b0000110; 
					seven_segment2 = ~ 7'b1111111;
			end
			
			4'b0010 : //x2
			begin seven_segment = ~ 7'b1011011; 
					seven_segment2 = ~ 7'b1111111;
			end
			
			4'b0011 : //x3
			begin seven_segment = ~ 7'b1001111; 
					seven_segment2 = ~ 7'b1111111;
			end
			
			4'b0100 : //x4
			begin seven_segment = ~ 7'b1100110; 
					seven_segment2 = ~ 7'b1111111;
			end
			
			4'b0101 : //x5
			begin seven_segment = ~ 7'b1101101; 
					seven_segment2 = ~ 7'b1111111;
			end
			
			4'b0110 : //x6
			begin seven_segment = ~ 7'b1111101; 
					seven_segment2 = ~ 7'b1111111;
			end
			
			4'b0111 : //x7
			begin seven_segment = ~ 7'b0000111; 
					seven_segment2 = ~ 7'b1111111;
			end
			
			
			4'b1000 : //x8
			begin seven_segment = ~ 7'b1111111; 
					seven_segment2 = ~ 7'b1111111;
			end
			
			4'b1001 : //x9
			begin seven_segment = ~ 7'b1100111; 
					seven_segment2 = ~ 7'b1111111;
			end
			
			4'b1010 : //10
			begin seven_segment  = ~ 7'b0111111; 
					seven_segment2 = ~ 7'b0000110;
			end
			
			4'b1011 : //11
			begin seven_segment = ~ 7'b0000110;
					seven_segment2 = ~ 7'b0000110;
			end
			
			4'b1100 : //12
			begin seven_segment = ~ 7'b1011011; 
					seven_segment2 = ~ 7'b0000110;
			end
			
			4'b1101 : //13
			begin seven_segment = ~ 7'b1001111; 
					seven_segment2 = ~ 7'b0000110;
			end
			4'b1110 : //14
			begin seven_segment = ~ 7'b1100110; 
					seven_segment2 = ~ 7'b0000110;
			end
			
			4'b1111 : //15
			begin seven_segment = ~ 7'b110110; 
					seven_segment2 = ~ 7'b0000110;
			end
			
			default : begin seven_segment  = ~ 7'b1111111; 
								 seven_segment2 = ~ 7'b1111111;
			end
		
		endcase	
	end
endmodule	