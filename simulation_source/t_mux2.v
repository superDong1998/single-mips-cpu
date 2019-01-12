`timescale 1ns / 1ps

module t_mux2( );
  reg s;
  reg [7:0] d0, d1; // parameter is adjustable
  wire [7:0] y;
  
  mux2 #(8) test(d0, d1, s, y);
  
  initial begin
    d0 = 8;
    d1 = 4;
    s = 0;
  end
  
  always begin
    #20
    s = ~s;
  end
endmodule
