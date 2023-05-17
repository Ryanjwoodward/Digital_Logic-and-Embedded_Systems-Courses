module full_adder_verilog(
	input a,
	input b,
	input cin,
	output reg sum,
	output reg cout
);

	always @(*)
	begin
		sum  = a ^ b ^ cin;
		cout = (a & b) | (cin & a) | (cin & b);
	end

endmodule