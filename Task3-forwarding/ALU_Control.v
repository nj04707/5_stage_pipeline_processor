module ALU_Control(
input [1:0] ALUOp,
input [3:0] Funct,
output reg [3:0] Operation
);

always @(*)
begin
	case(ALUOp)
		2'b00:
		begin
		if (Funct==4'b0001) //slli
		begin
			Operation=4'b0111;
		end
		else
		begin
			Operation=4'b0010; 
		end
		end
		
		2'b01:
		begin
		if (Funct==4'b0001)//bne
		begin
			Operation=4'b0101;
		end
		else if (Funct==4'b0100)//blt
		begin
			Operation=4'b1010;
		end
		else if (Funct==4'b0000) //beq
		begin
			Operation=4'b0110;
		end 
		
		end
		
		2'b10:
		begin
		if (Funct==4'b0000)
		begin
			Operation=4'b0010; 
		end
		else if (Funct==4'b1000)
		begin
			Operation=4'b0110;
		end
		else if (Funct==4'b0111)
		begin
			Operation=4'b0000;
		end
		else if (Funct==4'b0110)
		begin
			Operation=4'b0001;
		end
		end
	endcase
		
end
endmodule