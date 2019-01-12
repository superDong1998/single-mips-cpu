`timescale 1ns / 1ps

//program counter: output current instruction, input next instruction
module PC #(parameter WIDTH = 8) (clk, reset, next, current);
  input clk, reset;
  input [WIDTH-1:0] next;
  output reg [WIDTH-1:0] current;
  
  always @(posedge clk, posedge reset) begin
    if(reset)  current <= 0;
    else  current <= next;
  end
endmodule
