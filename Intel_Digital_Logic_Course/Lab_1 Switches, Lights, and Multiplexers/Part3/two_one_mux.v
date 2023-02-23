module two_one_mux (input a, b, select, output y);

	assign y = select ? b : a;

endmodule	