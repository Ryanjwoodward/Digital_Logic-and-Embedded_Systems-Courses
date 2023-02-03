
module nor_and (input a, b, c, output d);
	assign d = (!((!a) || b)) && c;
endmodule
