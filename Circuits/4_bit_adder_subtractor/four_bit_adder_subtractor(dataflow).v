module four_bit_adder_subtractor
(
		input cin, 
		input [3:0] a, 
		input [3:0] b,
		output cout,
		output [3:0] sum
);

	wire i1, i2, i3;

	assign sum[0] = (cin ^ (a[0] ^ (b[0] ^ cin)));
	assign i1 	  = (a[0] & (b[0] ^ cin)) | (cin & (a[0] ^ (b[0] ^ cin)));
	
	assign sum[1] = (i1 ^ (a[1] ^ (b[1] ^ cin)));
	assign i2 	  = (a[1] & (b[1] ^ cin)) | (i1 & (a[1] ^ (b[1] ^ cin)));
	
	assign sum[2] = (i2 ^ (a[2] ^ (b[2] ^ cin)));
	assign i3 	  = (a[2] & (b[2] ^ cin)) | (i2 & (a[2] ^ (b[2] ^ cin)));
	
	assign sum[3] = (i3 ^ (a[3] ^ (b[3] ^ cin)));
	assign cout	  = (a[3] & (b[3] ^ cin)) | (i3 & (a[3] ^ (b[3] ^ cin)));
	
endmodule