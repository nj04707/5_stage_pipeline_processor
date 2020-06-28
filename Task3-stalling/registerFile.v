module registerFile(
input [4:0] Rs1, [4:0] Rs2, [4:0] Rd,
input [63:0] WriteData, 
input RegWrite,
input clk, reset,
output reg [63:0] ReadData1, reg [63:0] ReadData2 
);

reg [63:0] Array[31:0];
initial
begin
   Array[0]<=64'd0;
   Array[1]<=64'd1;
   Array[2]<=64'd2;
   Array[3]<=64'd3;
   Array[4]<=64'd4;
   Array[5]<=64'd5;
   Array[6]<=64'd6;
   Array[7]<=64'd7;
   Array[8]<=64'd8;
   Array[9]<=64'd9;
   Array[10]<=64'd10;
   Array[11]<=64'd11;
   Array[12]<=64'd12;
   Array[13]<=64'd13; 
   Array[14]<=64'd14;  
   Array[15]<=64'd15;
   Array[16]<=64'd16;
   Array[17]<=64'd17;
   Array[18]<=64'd18;
   Array[19]<=64'd19; 
   Array[20]<=64'd20;   
   Array[21]<=64'd21;   
   Array[22]<=64'd22;   
   Array[23]<=64'd23;   
   Array[24]<=64'd24;   
   Array[25]<=64'd25;   
   Array[26]<=64'd26;   
   Array[27]<=64'd27;   
   Array[28]<=64'd28;   
   Array[29]<=64'd29;   
   Array[30]<=64'd30;   
   Array[31]<=64'd31;  
 end         

always@(negedge clk)
begin
	if (RegWrite==1)
	begin
		Array[Rd]<=WriteData;
	end

end


always @(Rs1, Rs2 , reset , Array , clk, posedge clk)
begin
	if (reset)
	begin
		ReadData1<=64'b0;
		ReadData2<=64'b0;
	end
	else
	begin
		ReadData1<=Array[Rs1];
		ReadData2<=Array[Rs2];
	end
end
endmodule
