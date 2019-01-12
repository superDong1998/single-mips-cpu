`timescale 1ns / 1ps

module t_top();
 reg clk, reset;
 wire memwrite;
 wire [31:0] writedata, dataaddr;
 
 top test(clk, reset, writedata, dataaddr, memwrite);
 initial begin
   clk = 0;
   reset = 1;
   #10
   reset = 0;
 end
 always begin
  #5 clk = ~clk;
  end
endmodule
