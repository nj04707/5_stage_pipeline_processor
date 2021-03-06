module Instruction_memory(
input [63:0] Inst_Adress,
output reg [31:0] Instruction
);

reg [7:0]Array[11:0]; 
  initial 
    begin 
        

        Array[0] =8'b10110011; 
        Array[1] =8'b00000001; 
        Array[2] =8'b01010010; 
        Array[3] =8'b00000000; 

        Array[4] =8'b00110011; 
        Array[5] =8'b00000001; 
        Array[6] =8'b01110011; 
        Array[7] =8'b00000000; 

        Array[8] =8'b10110011; 
        Array[9] =8'b00000100; 
        Array[10] =8'b01010101; 
        Array[11] =8'b00000000; 

    end 



always @ (Inst_Adress)
begin
	
	Instruction={Array[Inst_Adress+3],Array[Inst_Adress+2], Array[Inst_Adress+1],Array[Inst_Adress]};
end
endmodule