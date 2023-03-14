module poormansALU(
	input  	[3:0] operand_A,
	input  	[3:0] operand_B,
	input 	[1:0] selector_sw,
	output	[3:0] disp_output,
	output	[3:0] disp_output2,
	output         carry_output
);
	
	wire [3:0]midl1, [3:0]midl2, midl3;
	
	poormansALU  palu(operand_A, operand_B, select_sw, midl3, carry_output);
	bcd_7segment bcdc(midl3, disp_output, disp_output2);
	
	
endmodule	