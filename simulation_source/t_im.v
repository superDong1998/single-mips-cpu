`timescale 1ns / 1ps
module t_im();
  reg [5:0] addr;
  wire [31:0] rd;
  
  IM test(addr, rd);
  initial begin 
    addr = 'd0;
  end
  
  always begin
    #10
    addr = addr + 1;
  end
endmodule
