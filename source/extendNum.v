`timescale 1ns / 1ps

//signal extend immediate:
module extendNum(imm, y);
  input [15:0] imm;
  output [31:0] y;
  //将imm的高位直接复制到前16位
  assign y = {{16{imm[15]}}, imm};
endmodule
