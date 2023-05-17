module lab2_part4_verilog(
		
		input [3:0] X,
		input [3:0] Y,
		input Cin,
		output[6:0] HEX0,
		output[6:0] HEX1
);

	wire [3:0] sum0;
	wire cout0;
	
	ripple_carry_adder 	rca	(X, Y, CIN, sum0, cout0);
	bcd_7segment 			bcd	({cout0, sum0}, HEX0, HEX1);


endmodule
