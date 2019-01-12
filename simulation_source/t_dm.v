`timescale 1ns / 1ps

module t_dm();
  reg clk, we;
  reg [31:0] alu, writedata;
  wire [31:0] readdata;
  
  DM test(clk, we, alu, writedata, readdata);
  
  initial begin
    clk = 0;
    we = 1;
    alu = 0;
    writedata = 8;
  end
  
  always begin
    #5
    clk = ~clk;
  end
  always begin
    #200
    we = ~we;
  end
  always begin
    #10
    alu = alu + 100;
    
  end
endmodule
