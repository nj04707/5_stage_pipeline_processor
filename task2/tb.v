module tb();
reg clk;
reg reset;

Riscv rp(.clk(clk), .reset(reset));
initial  
begin
clk= 1'b0;
reset=1'b1; 
#7 reset =1'b0; 
end
always

#5 clk=~clk;

endmodule