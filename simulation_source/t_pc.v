`timescale 1ns / 1ps

module t_pc( );

  reg clk, reset;
  reg [31:0] next;
  wire [31:0] current;
 
  PC #(32) a(.clk(clk), .reset(reset), .next(next), .current(current));
 
 initial begin
   clk = 0;
   reset = 0;
   next = 8'h12343211;
 end
 
 always begin
   forever #10
   clk = ~clk;
 end
 always begin
   #20
   next = next + 1;
   #100
   reset = ~reset;
 end

endmodule
