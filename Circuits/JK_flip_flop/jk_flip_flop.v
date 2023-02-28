module jk_flip_flop (
	input j, k, clk, set, reset,
	output reg q, qb
);


always @ (posedge clk) begin
	if (set == 1'b1) begin
		q  <= 1;
		qb <= 0;
	end

		else if (reset == 1'b1) begin
			q <= 0;
			qb <= 1;
		end
	
		else begin
			case ({j, k})
				2'b00 : begin q <= q; qb <= qb; end
				2'b01 : begin q <= 0; qb <= 1; end
				2'b10 : begin q <= 1; qb <= 0; end
				2'b11 : begin q <= ~q; qb <= ~qb; end
			endcase
		end
	end
endmodule	