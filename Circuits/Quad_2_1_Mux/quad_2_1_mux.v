module quad_2_1_mux(input [3:0] a, input [3:0] b, input enb, sel, output [3:0] f);
 
	assign f[0] = (a[0] & !enb & !sel) | (b[0] & !enb & sel);
	assign f[1] = (a[1] & !enb & !sel) | (b[1] & !enb & sel);
	assign f[2] = (a[2] & !enb & !sel) | (b[2] & !enb & sel);
	assign f[3] = (a[3] & !enb & !sel) | (b[3] & !enb & sel);

endmodule