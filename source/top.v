`timescale 1ns / 1ps

module top(clk, reset, writedata, dataaddr, memwrite);
  input clk, reset;
  output [31:0] writedata, dataaddr;
  output memwrite;
  
  wire [31:0] pc, instr, readdata;
  
  mips mips(clk, reset, pc, instr, memwrite, dataaddr, writedata, readdata);
  IM imem(pc[7:2], instr);
  DM dmem(clk, memwrite, dataaddr, writedata, readdata);
  
endmodule
