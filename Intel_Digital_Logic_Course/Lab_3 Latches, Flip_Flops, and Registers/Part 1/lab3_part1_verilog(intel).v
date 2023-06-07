module lab3_part1_verilog(

		input clk, R, S, 
		output Q
		
		);

		wire R_g, S_g, Qa, Qb /* synthesis keep */;
		
		and (R_g, R, clk);
		and (S_g, S, clk);
		nor (Qa, R_g, Qb);
		not (Qb, S_g, Qa);
		
		assign Q = Qa;
		
endmodule

