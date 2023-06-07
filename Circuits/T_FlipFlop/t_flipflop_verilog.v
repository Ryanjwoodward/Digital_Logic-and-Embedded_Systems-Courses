module t_flipflop_verilog (
	input T,
	input CLK,
	input RST,
	output wire Q,
	output wire Qb
);

reg i;

always @(posedge CLK or posedge RST)
begin
	if (RST)
		i <= 1'b0; // Synchronous reset: Set the output to a known state when RST is asserted
	else if (T == 1'b0)
		i <= ~i;
end

assign Q = i;
assign Qb = ~i;

endmodule

