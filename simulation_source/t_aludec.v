`timescale 1ns / 1ps

module t_aludec();
  reg [5:0] funct;
  reg [2:0] aluop;
  wire [2:0] alucontrol;
  
  aludec test(funct, aluop, alucontrol);
  
  initial begin
    funct = 32;
    aluop = 0;
    #20 aluop = 0;
    #20 aluop = 1;
    #20 aluop = 2;
    #20 aluop = 3;
    #20 aluop = 4;
    #20 aluop = 5;
    #20 aluop = 6;
    #20 aluop = 7;
  end
  always begin
    #20 
      funct = funct + 1;
  end
endmodule
