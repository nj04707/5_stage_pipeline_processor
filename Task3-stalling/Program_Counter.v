module Program_Counter(
input clk, reset,
input [63:0] Pc_In,
input PCWrite,
output reg [63:0] PC_Out
);

always @(posedge clk or posedge reset)
begin
	if (reset)
		PC_Out<=0;
	else
		if (PCWrite==1'b1)
		begin
		PC_Out<=Pc_In;
		end
				
end
endmodule