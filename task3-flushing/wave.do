onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/rp/p1/Pc_In
add wave -noupdate /tb/rp/p1/PC_Out
add wave -noupdate -radix decimal /tb/rp/r1/WriteData
add wave -noupdate /tb/rp/p1/PC_Out
add wave -noupdate -radix binary /tb/rp/i1/Instruction
add wave -noupdate -radix decimal /tb/rp/ALU_64/Result
add wave -noupdate -radix decimal /tb/rp/ALU_64/ZERO
add wave -noupdate /tb/rp/p/opcode
add wave -noupdate /tb/rp/p/rd
add wave -noupdate /tb/rp/p/func3
add wave -noupdate -radix decimal /tb/rp/p/rs1
add wave -noupdate -radix decimal /tb/rp/p/rs2
add wave -noupdate /tb/rp/p/func7
add wave -noupdate -radix decimal /tb/rp/r1/ReadData1
add wave -noupdate -radix decimal /tb/rp/r1/ReadData2
add wave -noupdate -radix decimal /tb/rp/d1/Read_data
add wave -noupdate -radix decimal /tb/rp/d1/write_data
add wave -noupdate -radix decimal /tb/rp/c1/MemRead
add wave -noupdate -radix decimal /tb/rp/c1/MemtoReg
add wave -noupdate -radix decimal /tb/rp/c1/MemWrite
add wave -noupdate -radix decimal /tb/rp/c1/RegWrite
add wave -noupdate -radix decimal /tb/rp/c1/ALUOp
add wave -noupdate -radix decimal /tb/rp/idg/imm_data
add wave -noupdate -radix decimal /tb/rp/r1/Rd
add wave -noupdate /tb/clk
add wave -noupdate /tb/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 179
configure wave -valuecolwidth 57
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {75 ns}
