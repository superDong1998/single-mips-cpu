`timescale 1ns / 1ps
//Instruction memory: 6 bit address get instruction
module IM(address, instruction);
  input [5:0] address;
  output [31:0] instruction;
  
  reg [31:0] RAM [63:0]; //32 * 64 RAM
  
  initial begin
    //initial memory
    $readmemh("memfile.txt", RAM);
  end
  
  assign instruction = RAM[address];
endmodule

