module part5 (

		input	 [2:0] SEL,
		output [0:6] HEX0, // 7-seg display
		output [0:6] HEX1,
		output [0:6] HEX2,
		output [0:6] HEX3,
		output [0:6] HEX4,
		output [0:6] HEX5
		
		);
		
		wire [1:0] M0, M1, M2, M3, M4, M5;
		
		two_bit_four_one_mux U0 ("000", "001", "010", "011", "100", "101", SEL[2:0], M0);
		two_bit_four_one_mux U1 ("001", "010", "011", "100", "101", "000", SEL[2:0], M1);
		two_bit_four_one_mux U2 ("010", "011", "100", "101", "000", "001", SEL[2:0], M2);
		two_bit_four_one_mux U3 ("011", "100", "101", "000", "001", "010", SEL[2:0], M3);
		two_bit_four_one_mux U4 ("100", "101", "000", "001", "010", "011", SEL[2:0], M4);
		two_bit_four_one_mux U5 ("101", "000", "001", "010", "011", "100", SEL[2:0], M5);
		
		bcd_decoder H0 (M0, HEX0);
		bcd_decoder H1 (M1, HEX1);
		bcd_decoder H2 (M2, HEX2);
		bcd_decoder H3 (M3, HEX3);
		bcd_decoder H4 (M4, HEX3);
		bcd_decoder H5 (M5, HEX3);
		
endmodule