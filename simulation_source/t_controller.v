`timescale 1ns / 1ps

module t_controller( );
  reg [5:0] op, funct;
  reg zero;
  wire memtoreg, memwrite, alusrc, regdst, regwrite, jump, pcsrc;
  wire [2:0] alucontrol;
  
  controller test(op, funct, zero, memtoreg, memwrite, pcsrc, alusrc, regdst, regwrite, jump, alucontrol);
  
  initial begin
    op = 0;
    zero = 0;
    funct = 32;
    #20 op = 6'b000000;
    #20 op = 6'b100011;
    #20 op = 6'b101011;
    #20 op = 6'b000100;
    #20 op = 6'b001000;
    #20 op = 6'b000010;
  end
  
  always begin
    #10
    funct = funct + 1;
  end
endmodule
