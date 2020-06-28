module alu_64(
	input [63:0] a,[63:0] b, [3:0] ALUOp,
	output reg [63:0]Result,
	output reg ZERO
	
);
always @ (*)
begin     
    case({ALUOp})

	4'b0111: //slli
	begin
		Result= a<<b;
	
	end
	4'b0101://bne
	begin
		Result= a-b;
		if(Result==0)
			begin 
			ZERO=0;
			end
		else
			ZERO=1;
	end
	4'b1010:
	begin
		Result = (a<b)?1:0;
		ZERO = Result;
	end
			
      4'b0000: 
	begin
	  Result = a&b; 
	end
      4'b0001    :
	begin
	  Result = a|b;
	end
		  
      4'b0010    :
	begin
	  Result = a+b;	   
	end

 	4'b0110://beq
	begin
	Result = a-b;  
	ZERO = Result?0:1;
	end
		
	default  : Result = ~(a|b);    
    endcase
	

end
endmodule