module lab2_part3_verilog(
	input [3:0] A,
	input [3:0] B,
	input Cin,
	output reg [3:0] Sum,
	output reg Cout
);

	wire m0, m1, m2, m3;

	full_adder_verilog fa0 ((A[0]), (B[0]), (Cin),(Sum[0]), (m0));
	full_adder_verilog fa1 ((A[1]), (B[1]), (m0), (Sum[1]), (m1));
	full_adder_verilog fa2 ((A[2]), (B[2]), (m1), (Sum[2]), (m2));
	full_adder_verilog fa3 ((A[3]), (B[3]), (m2), (Sum[3]), (Cout));

endmodule