module mux(
	input[63:0] a, [63:0]b,
	input sel,
	output reg[63:0] data_out
);
always@(*)
begin
case(sel)
	1'b0: assign data_out=a;
	1'b1: assign data_out=b;
endcase
end
endmodule