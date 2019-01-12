`timescale 1ns / 1ps

//ALU: ÓÃÓÚÂß¼­ÔËËã
module alu(src1, src2, alucont, result, zero);
  input [31:0] src1, src2;
  input [2:0] alucont;
  output reg [31:0] result;
  output zero;
  
  assign zero = result == 0 ? 1 : 0; 
  always@(*) begin
    case(alucont[2:0])
      3'b000 : result <= src1 & src2;
      3'b010 : result <= src1 + src2;
      3'b001 : result <= src1 | src2;
      3'b011 : result <= src1 - src2;
      3'b111 : begin 
                 if(src1 < src2) result <= 1;
                 else result <= 0;
               end
    endcase
  end
endmodule 
