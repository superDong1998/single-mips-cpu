`timescale 1ns / 1ps

//signal extend immediate:
module extendNum(imm, y);
  input [15:0] imm;
  output [31:0] y;
  //��imm�ĸ�λֱ�Ӹ��Ƶ�ǰ16λ
  assign y = {{16{imm[15]}}, imm};
endmodule
