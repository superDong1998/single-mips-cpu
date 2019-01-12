`timescale 1ns / 1ps

//main decoder
module maindec(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
  input [5:0] op;
  output memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump;
  output [2:0] aluop;
  
  reg [10:0] controls;
  
  assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop} = controls;
  
  always @(*) begin
    case(op)
      6'b000000 : controls <= 10'b1100000010; //R-type
      6'b100011 : controls <= 10'b1010010000; //LW
      6'b101011 : controls <= 10'b0010100000; //SW
      6'b000100 : controls <= 10'b0001000001; //BEQ
      6'b001000 : controls <= 10'b1010000000; //ADDI
      6'b000010 : controls <= 10'b0000001000; //jump
      6'b001100 : controls <= 10'b1010000100; //ADNDI
      6'b001101 : controls <= 10'b1010000101; //ORI
      6'b001010 : controls <= 10'b1010000110; //SLTI
      default : controls <= 10'bxxxxxxxxxx; //INVALID
    endcase
  end
endmodule
