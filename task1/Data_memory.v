module Data_memory(
input [63:0]mem_addr,
input [63:0] write_data,
input clk,
input mem_write,
input mem_read,
output reg[63:0] Read_data
);

reg [7:0] Array [63:0];

initial 
begin
Array[0]=8'b00000100;
Array[1]=8'b00000000;
Array[2]=8'b00000000;
Array[3]=8'b00000000;
Array[4]=8'b00000000;
Array[5]=8'b00000000;
Array[6]=8'b00000000;
Array[7]=8'b00000000;

Array[8]=8'b00010000;
Array[9]=8'b00000000;
Array[10]=8'b00000000;
Array[11]=8'b00000000;
Array[12]=8'b00000000;
Array[13]=8'b00000000;
Array[14]=8'b00000000;
Array[15]=8'b00000000;

Array[16]=8'b00000011;
Array[17]=8'b00000000;
Array[18]=8'b00000000;
Array[19]=8'b00000000;
Array[20]=8'b00000000;
Array[21]=8'b00000000;
Array[22]=8'b00000000;
Array[23]=8'b00000000;

Array[24]=8'b00000010;
Array[25]=8'b00000000;
Array[26]=8'b00000000;
Array[27]=8'b00000000;
Array[28]=8'b00000000;
Array[29]=8'b00000000;
Array[30]=8'b00000000;
Array[31]=8'b00000000;

Array[32]=8'b00100000;
Array[33]=8'b00000000;
Array[34]=8'b00000000;
Array[35]=8'b00000000;
Array[36]=8'b00000000;
Array[37]=8'b00000000;
Array[38]=8'b00000000;
Array[39]=8'b00000000;



end

always @(*)
begin 
	if (mem_read)
	begin
		Read_data={Array[mem_addr+7],Array[mem_addr+6], Array[mem_addr+5],Array[mem_addr+4],Array[mem_addr+3],Array[mem_addr+2], Array[mem_addr+1],Array[mem_addr]};
	end
		
end

always @(posedge clk)
begin 
	if (mem_write)
	begin
		Array[mem_addr]=write_data[7:0];
		Array[mem_addr+1]=write_data[15:8];
		Array[mem_addr+2]=write_data[23:16];
		Array[mem_addr+3]=write_data[31:24];
		Array[mem_addr+4]=write_data[39:32];
		Array[mem_addr+5]=write_data[47:40];
		Array[mem_addr+6]=write_data[55:48];
		Array[mem_addr+7]=write_data[63:56];
	end
end

endmodule