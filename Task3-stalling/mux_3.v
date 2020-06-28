module mux_3(
    input [1:0] sel,
    input [63:0] a,
    input [63:0] b,
    input [63:0] c,
    output reg [63:0] three_muxout
);
always @(*)
begin
    case(sel)
    2'b00: three_muxout=a;
    2'b01: three_muxout=b;
    2'b10: three_muxout=c;
    endcase
end
endmodule