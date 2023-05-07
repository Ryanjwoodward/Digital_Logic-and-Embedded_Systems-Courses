module lab1_part4(input [1:0] c, output reg [6:0] h);

always @ (c)
	begin
		case (c)
			
			2'b00 : begin h = ~ 7'b1011110; end
			2'b01 : begin h = ~ 7'b1111001; end
			2'b10 : begin h = ~ 7'b0000110; end
			2'b11 : begin h = ~ 7'b0111111; end
	
			default : begin h = ~ 7'b1111111; end
		
		endcase	
	end
endmodule	