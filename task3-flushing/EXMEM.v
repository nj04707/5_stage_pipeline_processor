module EXMEM(
input clk,
input reset,
input [63:0] adder_in,
input ZERO_in, 
input PCSrc,
input [63:0] ALU_Result_in,
input [63:0] ReadData2In,
input [4:0] rd,
input MemtoReg,RegWrite, branch, MemRead,MemWrite,

output reg [63:0] adder_out,

output reg [63:0] ALU_Result_out,
output reg [63:0] ReadData2out,
output reg [4:0] rdOut,
output reg zero,
output reg MemtoRegOut, RegWriteOut, branchOut, MemReadOut, MemWriteOut
);

always @(posedge clk)
begin
if (PCSrc==1'b0)
begin
    if (reset==1'b0)
    begin
    adder_out=  adder_in;
    ALU_Result_out= ALU_Result_in;
    ReadData2out= ReadData2In;
    rdOut=rd;
    zero=ZERO_in;
    MemtoRegOut=MemtoReg;
    RegWriteOut=RegWrite;
    branchOut=branch;
    MemReadOut= MemRead;
    MemWriteOut=MemWrite;
    end
end
else
begin
    adder_out=  64'b0;
    ALU_Result_out= 64'b0;
    ReadData2out= 64'b0;
    rdOut=5'b0;
    zero=1'b0;
    MemtoRegOut=1'b0;
    RegWriteOut=1'b0;
    branchOut=1'b0;
    MemReadOut= 1'b0;
    MemWriteOut=1'b0;
end

end
always@(reset)
begin
    if (reset==1'b1)
    begin
    adder_out=  64'b0;
    ALU_Result_out= 64'b0;
    ReadData2out= 64'b0;
    rdOut=5'b0;
    zero=1'b0;
    MemtoRegOut=1'b0;
    RegWriteOut=1'b0;
    branchOut=1'b0;
    MemReadOut= 1'b0;
    MemWriteOut=1'b0;
    end
end
endmodule