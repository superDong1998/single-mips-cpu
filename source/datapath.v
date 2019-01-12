`timescale 1ns / 1ps

//datapath
module datapath(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, zero, pc, instr, aluout, writedata, readdata);
  input clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump;
  input [2:0] alucontrol;
  input [31:0] instr;
  input [31:0] readdata;
  output zero;
  output [31:0] pc, aluout, writedata;
  
  wire [4:0] writereg;
  wire [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
  wire [31:0] signimm, signimmsh;
  wire [31:0] srca, srcb;
  wire [31:0] result;
  
  //next PC logic
  PC #(32) pcreg(clk, reset, pcnext, pc);
  PCPlus4 pcadd1(pc, 32'b100, pcplus4); // pc plus4
  sl2 immsh(signimm, signimmsh);
  PCPlus4 pcadd2(pcplus4, signimmsh, pcbranch);
  mux2 #(32) pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
  mux2 #(32) pcmux(pcnextbr, {pcplus4[31:28], instr[25:0], 2'b00}, jump, pcnext);
  
  //register file logic
  regFile rf(clk, regwrite, writereg, result, instr[25:21], instr[20:16], srca, writedata);
  mux2 #(5) wrmux(instr[20:16], instr[15:11], regdst, writereg);
  mux2 #(32) resmux(aluout, readdata, memtoreg, result);
  extendNum se(instr[15:0], signimm);
  
  //ALU logic
  mux2 #(32) srcbmux(writedata, signimm, alusrc, srcb);
  alu alu(srca, srcb, alucontrol, aluout, zero);
endmodule
