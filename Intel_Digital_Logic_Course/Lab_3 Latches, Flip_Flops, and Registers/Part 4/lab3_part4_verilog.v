module lab3_part4_verilog(
  
	input D,
	input Clock,
	output wire Qa,
	output wire q_a,
	output wire Qb,
	output wire q_b,
	output wire Qc,
	output wire q_c
);
	reg gated_d_latch_output;
	reg pos_edge_d_flipflop_output;
	reg neg_edge_d_flipflop_output;

	always @(D, Clock)
		begin
			if (Clock)
				gated_d_latch_output <= D;
		end

	always @(posedge Clock)
		begin
			pos_edge_d_flipflop_output <= gated_d_latch_output;
		end

	always @(negedge Clock)
		begin
			neg_edge_d_flipflop_output <= gated_d_latch_output;
		end

	assign Qa = gated_d_latch_output;
	assign q_a = ~gated_d_latch_output;
	assign Qb = pos_edge_d_flipflop_output;
	assign q_b = ~pos_edge_d_flipflop_output;
	assign Qc = neg_edge_d_flipflop_output;
	assign q_c = ~neg_edge_d_flipflop_output;
endmodule

