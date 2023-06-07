module lab3_part1_verilog(
	input S,
	input R,
	input Clk,
	output reg Q,
	output reg Qb
);

	reg mem;

	always @(posedge Clk)
	begin
		if (Clk == 1'b1)
		begin
			if (S == 1'b0 && R == 1'b0)
				mem <= mem;
			else if (S == 1'b1 && R == 1'b1)
				mem <= 1'bz;
			else if (S == 1'b0 && R == 1'b1)
				mem <= 1'b0;
			else
				mem <= 1'b1;
		end
	end

	assign Q = mem;
	assign Qb = ~mem;

endmodule

