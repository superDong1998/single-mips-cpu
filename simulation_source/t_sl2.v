`timescale 1ns / 1ps

module t_sl2( );
  reg [31:0] a;
  wire [31:0] b;
  
  sl2 test(a, b);
  
  initial begin
    a = 'h12344321;
  end
  always begin
    #10
    a = a + 1;
  end
endmodule
