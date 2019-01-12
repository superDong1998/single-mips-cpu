`timescale 1ns / 1ps

//data memory: 当写使能有效时将数据写入数据寄存器
module DM(clk, we, a, wd, rd);
  input clk, we;
  input [31:0] a, wd;  //aluresult, writedata
  output [31:0] rd;
  
  reg [31:0] RAM[63:0];
  
  assign rd = RAM[a[31:26]];  //readdata
  
  always @(posedge clk) begin
    if(we)  RAM[a[31:26]] <= wd;
  end
endmodule