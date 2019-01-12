`timescale 1ns / 1ps

//register file: 向寄存器文件中写入数据；
module regFile(clk, regwriteEn, regwriteaddr, regwritedata, rsaddr, rtaddr, rsdata, rtdata);
  input clk, regwriteEn; // write enable
  input [4:0] regwriteaddr;  //reg write addr
  input [31:0] regwritedata;  //reg write data
  input [4:0] rsaddr, rtaddr;  //RsAddr, RtAddr
  output [31:0] rsdata, rtdata;  //RsData, RtData
  
  reg [31:0] rf[31:0]; //32 * 32 registers 
  
  //we 有效时，写入数据
  always @(posedge clk) begin
    if(regwriteEn) rf[regwriteaddr] <= regwritedata;
  end
  
  // 读Rs Rt寄存器中的数据
  assign rsdata = (rsaddr != 0) ? rf[rsaddr] : 0;
  assign rtdata = (rtaddr != 0) ? rf[rtaddr] : 0;
endmodule
