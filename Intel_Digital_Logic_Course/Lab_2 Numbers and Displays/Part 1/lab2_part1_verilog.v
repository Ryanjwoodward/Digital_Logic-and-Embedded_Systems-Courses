module lab2_part1_verilog(

		input 	  [3:0] SW_set_0,
		input 	  [3:0] SW_set_1,
		output reg [3:0] HX_dsp_0,
		output reg [3:0] HX_dsp_1
);

		bcd_7segment	bcd0(SW_set_0, HX_dsp_0);
		bcd_7segment	bcd1(SW_set_1, HX_dsp_1);

endmodule