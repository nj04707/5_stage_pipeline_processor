module risk_processor(
input clk, reset
);
wire [63:0] b;
assign b= 16'h0000000000000004;

wire [63:0] PC_Out;
wire [63:0] adder1_out;
wire [63:0] adder2_out;
wire [63:0] mux1_out;
wire [31:0] Instruction_m;
wire[6:0] opcode;
wire[4:0] rd;
wire[2:0] func3;
wire[4:0] rs1;
wire [4:0] rs2;
wire[6:0] func7;
wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] Aluop;
wire [63:0] imm_data;
wire [3:0] Operation;
wire [63:0] mux2_out;
wire [63:0] ReadData1;
wire [63:0] ReadData2;
wire [63:0] Result;
wire Zero;
wire[63:0] Read_data;
wire [63:0] mux3_out;

Program_Counter p1(.clk(clk), .reset(reset), .Pc_In(mux1_out),.PC_Out(PC_Out));
adder a1(.a(PC_Out),.b(b),.out(adder1_out));
mux m(.a(adder1_out),.b(adder2_out),.sel(Branch & Zero),.data_out(mux1_out));
adder a2(.a(PC_Out),.b(imm_data << 1),.out(adder2_out));

Instruction_memory i1(.Inst_Adress(PC_Out),.Instruction(Instruction_m));
parser p(.instruction(Instruction_m),.opcode(opcode),.rd(rd),.func3(func3),.rs1(rs1),.rs2(rs2),.func7(func7));

Control_Unit c1( .Opcode(opcode), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc),.RegWrite(RegWrite),.ALUOp(Aluop));

registerFile r1 (.Rs1(rs1), .Rs2(rs2),  .Rd(rd), .WriteData(mux3_out), .RegWrite(RegWrite),.clk(clk), .reset(reset),.ReadData1(ReadData1), .ReadData2(ReadData2));

IDG idg(.instruction(Instruction_m),.imm_data(imm_data));

ALU_Control a5(.ALUOp(Aluop),.Funct({1'b0, Instruction_m[14:12]}),.Operation(Operation));

mux m2(.a(ReadData2),.b(imm_data),.sel(ALUSrc),.data_out(mux2_out));

alu_64 ALU_64(.a(ReadData1),.b(mux2_out),.ALUOp(Operation),.Result(Result),.ZERO(Zero));
Data_memory d1(.mem_addr (Result),.write_data(ReadData2),.clk(clk),.mem_write(MemWrite),.mem_read(MemRead),.Read_data(Read_data));

mux m3(.a(Result),.b(Read_data),.sel(MemtoReg),.data_out(mux3_out));

endmodule