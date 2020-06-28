module Instruction_memory(
input [63:0] Inst_Adress,
output reg [31:0] Instruction
);

reg [7:0]Array[23:0]; 
initial 
    begin 
        

        Array[0] = 8'b10010011; 
        Array[1] = 8'b10000000; 
        Array[2] = 8'b01010000; 
        Array[3] = 8'b00000000; 

        Array[4] = 8'b10010011; 
        Array[5] = 8'b00000010; 
        Array[6] = 8'b10010000; 
        Array[7] = 8'b00000000; 

        Array[8] = 8'b01100011; 
        Array[9] = 8'b10000110; 
        Array[10] = 8'b01010000; 
        Array[11] = 8'b00000000; 

        Array[12] = 8'b00010011; 
        Array[13] = 8'b10001010; 
        Array[14] = 8'b10100010; 
        Array[15] = 8'b00000101; 
          
        Array[16] = 8'b01100011; 
        Array[17] = 8'b10010100; 
        Array[18] = 8'b01010000; 
        Array[19] = 8'b00000000; 

        Array[20] = 8'b10110011; 
        Array[21] = 8'b10000010; 
        Array[22] = 8'b00010010; 
        Array[23] = 8'b01000000; 

       

    end 



always @ (Inst_Adress)
begin
	
	Instruction={Array[Inst_Adress+3],Array[Inst_Adress+2], Array[Inst_Adress+1],Array[Inst_Adress]};
end
endmodule