module poormansALU(
	input  	[3:0] operand_one,
	input  	[3:0] operand_two,
	input 	[1:0] selector,
	output	[3:0] result_out,
	output         carry_out
);
	
	wire midl1, midl2;
	
	four_bit_adder_subtractor fbas(selector[0], operand_one, operand_two, carry_out, midl1);
	palu_bool_logic_unit		  pblu(operand_one, operand_two, midl2);
	quad_2_1_mux				  qdmx(0, selector[1], midl1, midl2, result_out);
	
	
endmodule	