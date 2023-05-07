module part5 (

		input [9:0] SW, // slide switches
		output [9:0] LEDR, // red lights
		output [0:6] HEX0, // 7-seg display
		output [0:6] HEX1,
		output [0:6] HEX2,
		output [0:6] HEX3
		
		);
		
		wire [1:0] M0, M1, M2, M3;
		
		two_bit_four_one_mux U0 (SW[9:8], SW[7:6], SW[5:4], SW[3:2], SW[1:0], M0);
		two_bit_four_one_mux U1 (SW[7:6], SW[5:4], SW[3:2], SW[9:8], SW[1:0], M1);
		two_bit_four_one_mux U2 (SW[5:4], SW[3:2], SW[9:8], SW[7:6], SW[1:0], M2);
		two_bit_four_one_mux U3 (SW[3:2], SW[9:8], SW[7:6], SW[5:4], SW[1:0], M3);
		
		bcd_decoder H0 (M0, HEX0);
		bcd_decoder H1 (M1, HEX1);
		bcd_decoder H2 (M2, HEX2);
		bcd_decoder H3 (M3, HEX3);
		
		assign LEDR = SW;

endmodule