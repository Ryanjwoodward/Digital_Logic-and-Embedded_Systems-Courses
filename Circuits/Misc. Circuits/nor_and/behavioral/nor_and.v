

module nor_and (input a, b, c, output reg d);
	
	always @ (a or b or c) begin
		if 
			(a == 1'b1 & b == 1'b0 & c == 1'b1) 
			begin
				d = 1'b1;
		end
		else
			d = 1'b0;
		end
endmodule		