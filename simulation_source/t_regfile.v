`timescale 1ns / 1ps

module t_regfile( );
  reg clk, we;
  reg[4:0] regwriteaddr;
  reg [31:0] regwritedata;
  reg [4:0] rsaddr, rtaddr;
  wire [31:0] rsdata, rtdata;
  
  regFile test(clk, we, regwriteaddr, regwritedata, rsaddr, rtaddr, rsdata, rtdata);
  
  initial begin 
    clk = 0;
    we = 1;
    regwriteaddr = 'd0;
    regwritedata = 'd8;
    rsaddr = 0;
    rtaddr = 'd32;
  end
  
  always begin
    #10
    clk = ~clk;
  end
  always begin
    #100
    we = ~we;
  end
  always begin
    #10
    regwriteaddr = regwriteaddr + 1;
  end
  always begin
    #20
    rsaddr = rsaddr + 1;
    rtaddr = rtaddr - 1;
  end
    
endmodule
