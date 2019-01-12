`timescale 1ns / 1ps

//mux2 : 二选一复用器
module mux2 # (parameter WIDTH = 8) (d0, d1, s, y);
  input [WIDTH-1:0] d0, d1;
  input s;
  output [WIDTH-1:0] y;
  
  assign y = s ? d1 : d0;
endmodule
