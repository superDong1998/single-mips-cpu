`timescale 1ns / 1ps

//register file: ��Ĵ����ļ���д�����ݣ�
module regFile(clk, regwriteEn, regwriteaddr, regwritedata, rsaddr, rtaddr, rsdata, rtdata);
  input clk, regwriteEn; // write enable
  input [4:0] regwriteaddr;  //reg write addr
  input [31:0] regwritedata;  //reg write data
  input [4:0] rsaddr, rtaddr;  //RsAddr, RtAddr
  output [31:0] rsdata, rtdata;  //RsData, RtData
  
  reg [31:0] rf[31:0]; //32 * 32 registers 
  
  //we ��Чʱ��д������
  always @(posedge clk) begin
    if(regwriteEn) rf[regwriteaddr] <= regwritedata;
  end
  
  // ��Rs Rt�Ĵ����е�����
  assign rsdata = (rsaddr != 0) ? rf[rsaddr] : 0;
  assign rtdata = (rtaddr != 0) ? rf[rtaddr] : 0;
endmodule
