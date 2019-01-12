`timescale 1ns / 1ps

module t_mips( );
  reg clk, reset;
  reg [31:0] instr, readdata;
  wire [31:0] pc, aluout, writedata;
  wire memwrite;
  
  mips test(clk, reset, pc, instr, memwrite, aluout, writedata, readdata);
  
  initial begin
    clk = 0;
    reset = 0;
    readdata = 'h12344321;
    #50 instr = 'h20020005;
    #50 instr = 'h2003000C;
    #50 instr = 'h2067FFF7;
  end
  
  always begin
    #10 clk = ~clk;
  end
endmodule
