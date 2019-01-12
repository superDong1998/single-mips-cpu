`timescale 1ns / 1ps

module t_extend();
  reg [15:0] imm;
  wire [31:0] result;
  
  extendNum test(imm, result);
  
  initial begin
    imm = 'hF000;
  end
  
endmodule
