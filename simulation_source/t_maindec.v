`timescale 1ns / 1ps

module t_maindec( );
  reg [5:0] op;
  wire memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump;
  wire [2:0] aluop;
  
  maindec test(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
  
  initial begin
    op = 0;
    #20 op = 6'b000000;
    #20 op = 6'b100011;
    #20 op = 6'b101011;
    #20 op = 6'b000100;
    #20 op = 6'b001000;
    #20 op = 6'b000010;
    #20 op = 6'b011110;
    #20 op = 6'b001100;
    #20 op = 6'b001101;
    #20 op = 6'b001010;
  end
  
endmodule
