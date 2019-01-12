`timescale 1ns / 1ps
module t_pcplus4();
  reg [31:0] a, b;
  wire [31:0] result;
  
  PCPlus4 test(a, b, result);
  
  initial begin 
    a = 'h12344321;
    b = 'd4;
  end
  always begin
    #10
    a = a + 1;
  end 
endmodule
