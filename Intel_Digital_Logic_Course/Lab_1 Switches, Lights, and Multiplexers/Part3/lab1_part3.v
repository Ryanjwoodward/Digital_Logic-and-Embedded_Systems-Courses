module lab1_part3(input u, v, w, x, sel0, sel1, output m);

	wire c1, c2, c3;
	
		two_one_mux mux1(u, v, sel0, c1);
		two_one_mux mux2(w, x, sel0, c2);
		two_one_mux mux3(c1, c2, sel1, c3);
		
	
		assign m = c3;
endmodule		