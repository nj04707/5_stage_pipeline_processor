module IFID(
input [63:0] PC_in,
input [31:0] instruction_in,
input clk,
input ifid_write,
input reset,
output reg [63:0] PC_out,
output reg [31:0] Instruction_out
);

always@(posedge clk)
begin
	if (ifid_write==1'b1)
	begin
	if (reset==1'b0)
		begin 
		PC_out=PC_in;
		Instruction_out=instruction_in;
		end
	end
end

always@(reset)
begin
	if (reset==1'b1)
		begin 
		PC_out=64'b0;
		Instruction_out=32'b0;
		end
end

endmodule