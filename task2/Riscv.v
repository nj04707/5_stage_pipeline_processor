module Riscv(
input clk, reset
);
wire [63:0] b;
assign b= 16'h0000000000000004;

wire [63:0] PC_Out;

wire [63:0] PC_Outidex;
wire [63:0] adder1_out;
wire [63:0] adder2_out;
wire [63:0] adder_out_ex;
wire [63:0] mux1_out;
wire [31:0] Instruction_m;
wire [31:0] Instruction_if;
wire[6:0] opcode;
wire[4:0] rd_parser;
wire[4:0] rd_id;
wire[4:0] rd_mem;
wire[4:0] rd_ex;
wire[2:0] func3;
wire[4:0] rs1;
wire [4:0] rs2;
wire[4:0] rs1_id;
wire [4:0] rs2_id;
wire[6:0] func7;
wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] Aluop;
wire Branch_id, MemRead_id, MemtoReg_id, MemWrite_id, ALUSrc_id, RegWrite_id;
wire Branch_ex, MemRead_ex, MemtoReg_ex, MemWrite_ex, RegWrite_ex;
wire MemtoReg_mem, RegWrite_mem;
wire [1:0] Aluop_id;
wire [63:0] imm_data;
wire [63:0] imm_dataOut;
wire [3:0] Operation;
wire [63:0] mux2_out;
wire [63:0] ReadData1;
wire [63:0] ReadData2;
wire[63:0] ReadData1Out;
wire [63:0] ReadData2Out;
wire [63:0] ReadData2_ex;
wire [63:0] Result;
wire [63:0]ALU_Result_out;
wire [63:0] ALU_Resultout_mem;
wire Zero;
wire zero_ex;
wire[63:0] Read_data;
wire [63:0] ReadDataout;
wire [63:0] mux3_out;
wire [63:0] if_pc_out;
wire [3:0] funct;

Program_Counter p1(.clk(clk), .reset(reset), .Pc_In(mux1_out),.PC_Out(PC_Out));
adder a1(.a(PC_Out),.b(b),.out(adder1_out));
mux m(.a(adder1_out),.b(adder_out_ex),.sel(Branch_ex & zero_ex),.data_out(mux1_out));
//adder a2(.a(PC_Outidex),.b(imm_dataOut << 1),.out(adder2_out));

//adder a2(.a(PC_Outidex),.b(imm_dataOut << 1),.out(adder2_out));

Instruction_memory i1(.Inst_Adress(PC_Out),.Instruction(Instruction_m));

IFID ifid(.PC_in(PC_Out),
.instruction_in(Instruction_m),
.clk(clk),
.reset(reset),
.PC_out(if_pc_out),
.Instruction_out(Instruction_if)
);

parser p(.instruction(Instruction_if),.opcode(opcode),.rd(rd_parser),.func3(func3),.rs1(rs1),.rs2(rs2),.func7(func7));

Control_Unit c1( .Opcode(opcode), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc),.RegWrite(RegWrite),.ALUOp(Aluop));

registerFile r1 (.Rs1(rs1), .Rs2(rs2),  .Rd(rd_mem), .WriteData(mux3_out), .RegWrite(RegWrite_mem),.clk(clk), .reset(reset),.ReadData1(ReadData1), .ReadData2(ReadData2));

IDG idg(.instruction(Instruction_if),.imm_data(imm_data));

IDEX idex(
.clk(clk),
.reset(reset),
.PC_inidex(if_pc_out),
.ReadData1In(ReadData1),
.ReadData2In(ReadData2),
.imm_data(imm_data),
.rs1(rs1),
.rs2(rs2),
.rd(rd_parser),
.inst({Instruction_if[30], Instruction_if[14:12]}),
.MemtoReg(MemtoReg), 
.RegWrite(RegWrite),
.branch(Branch),
.MemRead(MemRead),
.MemWrite(MemWrite),
.ALUSrc(ALUSrc),
.ALUOp(Aluop),

.PC_Outidex(PC_Outidex),
.ReadData1Out(ReadData1Out),
.ReadData2Out(ReadData2Out),
.imm_dataOut(imm_dataOut),
.funct(funct),
.rdOut(rd_id), 
.rs1Out(rs1_id), 
.rs2Out(rs2_id),
.MemtoRegOut(MemtoReg_id), 
.RegWriteOut(RegWrite_id),
.branchOut(Branch_id),
.MemReadOut(MemRead_id),
.MemWriteOut(MemWrite_id),
.ALUSrcOut(ALUSrc_id),
.ALUOpOut(Aluop_id)
);

ALU_Control a5(.ALUOp(Aluop_id),.Funct(funct),.Operation(Operation));

mux m2(.a(ReadData2Out),.b(imm_dataOut),.sel(ALUSrc_id),.data_out(mux2_out));

alu_64 ALU_64(.a(ReadData1Out),.b(mux2_out),.ALUOp(Operation),.Result(Result),.ZERO(Zero));

adder a2(.a(PC_Outidex),.b(imm_dataOut << 1),.out(adder2_out));

EXMEM exmem(
.clk(clk),
.reset(reset),
.adder_in(adder2_out),
.ZERO_in(Zero), 
.ALU_Result_in(Result),
.ReadData2In(ReadData2Out),
.rd(rd_id),
.MemtoReg(MemtoReg_id),
.RegWrite(RegWrite_id),
.branch(Branch_id), 
.MemRead(MemRead_id),
.MemWrite(MemWrite_id),


.adder_out(adder_out_ex),
 .ALU_Result_out(ALU_Result_out),
 .ReadData2out(ReadData2_ex),
 .rdOut(rd_ex),
.zero(zero_ex),
.MemtoRegOut(MemtoReg_ex), .RegWriteOut(RegWrite_ex),

.branchOut(Branch_ex), .MemReadOut(MemRead_ex),.MemWriteOut(MemWrite_ex)
);


Data_memory d1(.mem_addr (ALU_Result_out),.write_data(ReadData2_ex),.clk(clk),.mem_write(MemWrite_ex),.mem_read(MemRead_ex),.Read_data(Read_data));

MEMWB mem(
	

.clk(clk),
.reset(reset),
.ReadDatain(Read_data),
.ALU_Resultin(ALU_Result_out),
.MemtoReg(MemtoReg_ex), .RegWrite(RegWrite_ex),
.rd(rd_ex),

.ReadDataout(ReadDataout),
.ALU_Resultout(ALU_Resultout_mem),
.rdOut(rd_mem),
.MemtoRegOut(MemtoReg_mem), 
.RegWriteOut(RegWrite_mem)
 
);

mux m3(.a(ALU_Resultout_mem),.b(ReadDataout),.sel(MemtoReg_mem),.data_out(mux3_out));


endmodule