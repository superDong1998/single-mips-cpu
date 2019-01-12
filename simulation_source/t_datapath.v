`timescale 1ns / 1ps

module t_datapath( );
  reg clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump;
  reg [2:0] alucontrol;
  reg [31:0] instr;
  reg [31:0] readdata;
  wire zero;
  wire [31:0] pc, aluout, writedata;
  
  datapath test(clk, reset, memtoreg, pcsrc, alusrc, regdst, regwrite, jump, alucontrol, zero, pc, instr, aluout, writedata, readdata);
  
  initial begin
    clk = 0;
    reset = 0;
    memtoreg = 0;
    pcsrc = 0;
    alusrc = 0;
    regdst = 0;
    regwrite = 0;
    jump = 0;
    alucontrol = 0;
    instr = 0;
    readdata = 'h12344321;
  end
  always begin
    #5 clk = ~clk;
  end
  always begin
    #10
    memtoreg = ~memtoreg;
    #15
    pcsrc = ~pcsrc;
    #10 alusrc= ~alusrc;
    #15 regdst = ~regdst;
    #10 regwrite = ~regwrite;
    #10 alucontrol = alucontrol + 1;
        instr = instr + 2;
    #20 readdata = readdata + 8;
    #200 reset = ~reset;
  end
endmodule
