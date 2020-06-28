module Instruction_memory(
input [63:0] Inst_Adress,
output reg [31:0] Instruction
);

reg [7:0]Array[95:0]; 
initial 
    begin 
        

        Array[0] = 8'b00010011; 
        Array[1] = 8'b00001011; 
        Array[2] = 8'b00000000; 
        Array[3] = 8'b00000000; 

        Array[4] = 8'b00010011; 
        Array[5] = 8'b00000101; 
        Array[6] = 8'b01010000; 
        Array[7] = 8'b00000000; 

        Array[8] = 8'b00010011; 
        Array[9] = 8'b00000001; 
        Array[10] = 8'b00000000; 
        Array[11] = 8'b00000000; 

        Array[12] = 8'b10010011; 
        Array[13] = 8'b00000001; 
        Array[14] = 8'b00000000; 
        Array[15] = 8'b00000000; 
          
        Array[16] = 8'b10110011; 
        Array[17] = 8'b00001011; 
        Array[18] = 8'b01100000; 
        Array[19] = 8'b00000001; 

        Array[20] = 8'b01100011; 
        Array[21] = 8'b00000110; 
        Array[22] = 8'b10101011; 
        Array[23] = 8'b00000100; 

        Array[24] = 8'b00000011; 
        Array[25] = 8'b00110011; 
        Array[26] = 8'b00000001; 
        Array[27] = 8'b00000000; 

        Array[28] = 8'b00000011; 
        Array[29] = 8'b10110010; 
        Array[30] = 8'b00000001; 
        Array[31] = 8'b00000000;

        Array[32] = 8'b01100011; 
        Array[33] = 8'b01001110; 
        Array[34] = 8'b01000011; 
        Array[35] = 8'b00000000; 

        Array[36] = 8'b10010011; 
        Array[37] = 8'b10001011; 
        Array[38] = 8'b00011011; 
        Array[39] = 8'b00000000; 

        Array[40] = 8'b00010011; 
        Array[41] = 8'b00010001; 
        Array[42] = 8'b00111011; 
        Array[43] = 8'b00000000; 

        Array[44] = 8'b10010011; 
        Array[45] = 8'b10010001; 
        Array[46] = 8'b00111011; 
        Array[47] = 8'b00000000; 

        Array[48] = 8'b11100011; 
        Array[49] = 8'b10010100; 
        Array[50] = 8'b10101011; 
        Array[51] = 8'b11111110; 

        Array[52] = 8'b00010011; 
        Array[53] = 8'b00001011; 
        Array[54] = 8'b00011011; 
        Array[55] = 8'b00000000; 

        Array[56] = 8'b11100011; 
        Array[57] = 8'b10001100; 
        Array[58] = 8'b10101011; 
        Array[59] = 8'b11111100; 

        Array[60] = 8'b10110011; 
        Array[61] = 8'b00000010; 
        Array[62] = 8'b01100000; 
        Array[63] = 8'b00000000; 

        Array[64] = 8'b00100011; 
        Array[65] = 8'b00110000; 
        Array[66] = 8'b01000001; 
        Array[67] = 8'b00000000; 

        Array[68] = 8'b00100011; 
        Array[69] = 8'b10110000; 
        Array[70] = 8'b01010001; 
        Array[71] = 8'b00000000; 

        Array[72] = 8'b10010011; 
        Array[73] = 8'b10001011; 
        Array[74] = 8'b00011011; 
        Array[75] = 8'b00000000;

        Array[76] = 8'b00010011; 
        Array[77] = 8'b00010001; 
        Array[78] = 8'b00111011; 
        Array[79] = 8'b00000000;

        Array[80] = 8'b10010011; 
        Array[81] = 8'b10010001; 
        Array[82] = 8'b00111011; 
        Array[83] = 8'b00000000;

        Array[84] = 8'b11100011; 
        Array[85] = 8'b10010010; 
        Array[86] = 8'b10101011; 
        Array[87] = 8'b11111100;

        Array[88] = 8'b00010011; 
        Array[89] = 8'b00001011; 
        Array[90] = 8'b00011011; 
        Array[91] = 8'b00000000;

        Array[92] = 8'b11100011; 
        Array[93] = 8'b10001010; 
        Array[94] = 8'b10101011; 
        Array[95] = 8'b11111010;

    end 



always @ (Inst_Adress)
begin
	
	Instruction={Array[Inst_Adress+3],Array[Inst_Adress+2], Array[Inst_Adress+1],Array[Inst_Adress]};
end
endmodule