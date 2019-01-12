`timescale 1ns / 1ps

module t_alu( );
  reg [31:0] src1, src2;
  reg [2:0] alucont;
  wire zero;
  wire [31:0] result;
  
  alu test(src1, src2, alucont, result, zero);
  
  initial begin 
    src1 = 32'hffffFFF4;
    src2 = 32'hffffFFF2;
    alucont = 0;
  end
  
  always begin 
    #10 
    alucont = alucont + 1;
  end
  
endmodule
