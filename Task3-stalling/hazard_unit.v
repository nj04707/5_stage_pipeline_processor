module hazard_unit (
input MemRead_idex, 
input [4:0] rd_idex,
input [4:0] Rs1_ifid,
input [4:0] Rs2_ifid,
output reg PcWrite,
output reg Ifid_write,
output reg mux_sel 
);
always@(*)
begin


if (MemRead_idex && ((rd_idex==Rs1_ifid) || (rd_idex==Rs2_ifid)))
    begin
    PcWrite=1'b0;
    Ifid_write=1'b0;
    mux_sel=1'b1;
    end
else
begin
    PcWrite=1'b1;
    Ifid_write=1'b1;
    mux_sel=1'b0;

end
end
endmodule


