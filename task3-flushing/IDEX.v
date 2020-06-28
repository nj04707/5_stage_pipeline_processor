module IDEX(
input clk,
input reset,
input [63:0] PC_inidex,
input [63:0] ReadData1In,
input [63:0] ReadData2In,
input [63:0] imm_data,
input [4:0] rs1,
input [4:0] rs2,
input [4:0] rd,
input [3:0] inst,
input PCSrc,
input MemtoReg, 
input RegWrite,
input branch,
input MemRead,
input MemWrite,
input ALUSrc,
input [1:0] ALUOp,
output reg [63:0] PC_Outidex,
output reg [63:0] ReadData1Out,
output reg [63:0] ReadData2Out,
output reg [63:0] imm_dataOut,
output reg [3:0] funct,
output reg [4:0] rdOut,
output reg [4:0] rs1Out,
output reg [4:0] rs2Out,
output reg MemtoRegOut, RegWriteOut,branchOut,MemReadOut,MemWriteOut,ALUSrcOut, 
output reg [1:0] ALUOpOut
);

always @(posedge clk)
begin
if (PCSrc==1'b0)
begin
	if (reset==1'b0)
		begin
			PC_Outidex=PC_inidex;
			ReadData1Out=ReadData1In;
			ReadData2Out=ReadData2In;
			imm_dataOut=imm_data;
			funct=inst;
			rdOut=rd;
			rs1Out=rs1;
			rs2Out=rs2;
			MemtoRegOut=MemtoReg;
			RegWriteOut=RegWrite;
			branchOut=branch;
			MemReadOut= MemRead;
			MemWriteOut=MemWrite;
			ALUSrcOut=ALUSrc;
			ALUOpOut=ALUOp;
		end
end
else
	begin
			PC_Outidex=64'b0;
			ReadData1Out=64'b0;
			ReadData2Out=64'b0;
			imm_dataOut=64'b0;
			funct=4'b0;
			rdOut=5'b0;
			rs1Out=5'b0;
			rs2Out= 5'b0;
			MemtoRegOut=1'b0;
			RegWriteOut=1'b0;
			branchOut=1'b0;
			MemReadOut= 1'b0;
			MemWriteOut=1'b0;
			ALUSrcOut=1'b0;
			ALUOpOut=2'b0;
	end
end
always@(reset)
begin	
	if(reset==1'b1)
		begin
			PC_Outidex=64'b0;
			ReadData1Out=64'b0;
			ReadData2Out=64'b0;
			imm_dataOut=64'b0;
			funct=4'b0;
			rdOut=5'b0;
			rs1Out=5'b0;
			rs2Out= 5'b0;
			MemtoRegOut=1'b0;
			RegWriteOut=1'b0;
			branchOut=1'b0;
			MemReadOut= 1'b0;
			MemWriteOut=1'b0;
			ALUSrcOut=1'b0;
			ALUOpOut=2'b0;
			

		end
end
endmodule