`timescale 1ns / 1ps

//mips
module mips(clk, reset, pc, instr, memwrite, aluout, writedata, readdata);
  input clk, reset;
  input [31:0] instr, readdata;
  output [31:0] pc, aluout, writedata;
  output memwrite;
  
  wire memtoreg, branch, pcsrc, zero, alusrc, regdst, regwrite, jump;
  wire [2:0] alucontrol;
  
  controller c(instr[31:26], instr[5:0], zero, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol);
  
  datapath dp(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, zero, pc, instr, aluout, writedata, readdata);
endmodule
