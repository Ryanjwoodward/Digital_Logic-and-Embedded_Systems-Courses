module full_adder (input x, y, cin, output sum, cout);

	assign sum = (x ^ y) ^ cin;
	assign cout = (x & (y | cin)) | (cin & y);
	
endmodule	