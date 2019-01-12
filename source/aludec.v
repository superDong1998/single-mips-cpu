`timescale 1ns / 1ps

//alu decoder
module aludec(funct, aluop, alucontrol);
  input [5:0] funct;
  input [2:0] aluop;
  output reg [2:0] alucontrol;
  
  always @(*) begin
    case(aluop)
      3'b000 : alucontrol <= 3'b010; //add
      3'b001 : alucontrol <= 3'b011; //sub
      3'b100 : alucontrol <= 3'b000; //and
      3'b101 : alucontrol <= 3'b001; //or
      3'b110 : alucontrol <= 3'b111; //slt
      default : case(funct) //R-TYPE
        6'b100000 : alucontrol <= 3'b010; //add
        6'b100010 : alucontrol <= 3'b011; //sub
        6'b100100 : alucontrol <= 3'b000; //and
        6'b100101 : alucontrol <= 3'b001; //or
        6'b101010 : alucontrol <= 3'b111; //slt
        default :alucontrol <= 3'bxxx;
      endcase
    endcase 
  end  
endmodule