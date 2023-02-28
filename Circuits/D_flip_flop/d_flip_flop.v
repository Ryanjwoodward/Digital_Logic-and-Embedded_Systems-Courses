module d_flip_flop (input d, clk, set, reset, output reg q, qb);
	initial begin
		q <= 0;
		qb <= 1;
	end

	always @ (posedge clk) begin
		if (set == 1'b1) begin
			q <= 0;
			qb <= 1;
		end
			
		else if (reset == 1'b1) begin
			q <= 1;
			qb <= 0;
		end
			
		else begin
			case(d)
				1'b1 : begin q <= 1; qb <= 0; end
				1'b0 : begin q <= 0; qb <= 1; end
			endcase
		end
	end	
endmodule