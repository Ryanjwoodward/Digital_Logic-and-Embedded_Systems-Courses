module lab1_part3 (
	input [1:0] u,
	input [1:0] v,
	input [1:0] w,
	input [1:0] x,
	input [1:0] s,
	output reg [1:0] m
);

always @ (s) begin
	case (s)
		2'b00:
			m <= u;
		2'b01:
			m <= v;
		2'b10:
			m <= w;
		2'b11:
			m <= x;
		default:
			m <= 2'b00;
	endcase
end

endmodule
