`include "reg_8_bit.v"
`include "decodificador.v"
`include "tristate.v"

`include "somador_completo.v"
`include "subtrator_completo.v"
`include "AND.v"
`include "OR.v"
`include "XOR.v"
`include "XNOR.v"
`include "comparador.v"

module ULA(a_in,b_in,opcode_in,s,flag,clk);
    input clk;
    input [2:0] opcode_in;
    input [7:0] a_in,b_in;

    wire [7:0] a_out, b_out, opcode_out;
    wire [8:0] s_in, s_soma, s_sub;
  	wire [7:0] s_out,s_and,s_or,s_xor,s_nand,s_xnor,s_com;
  
  	output reg flag;
    output [7:0] s;

    reg_8_bit reg_a(a_in,a_out,clk);
    reg_8_bit reg_b(b_in,b_out,clk);
    decodificador d(opcode_in,1'b1,opcode_out);

    //Operações <= 9 Bits
    //----------------------------------------
  	somador_completo som_1(a_out,b_out,s_soma);
  	tristate som_2(s_soma[7:0],s_out,opcode_out[0]);

  	subtrator_completo sub_1(a_out,b_out,s_sub);
  	tristate sub_2(s_sub[7:0],s_out,opcode_out[1]);
    //-----------------------------------------

    //Operações <= 8 Bits
    //----------------------------------------------------------
    AND and_1(a_out,b_out,s_and[7:0]);
 	  tristate and_2(s_and[7:0],s_out,opcode_out[2]);

    OR or_1(a_out,b_out,s_or[7:0]);
  	tristate or_2(s_or[7:0],s_out,opcode_out[3]);

    XOR xor_1(a_out, b_out, s_xor[7:0]);
  	tristate xor_2(s_xor[7:0], s_out, opcode_out[4]);

    //NAND - neganado s_out
    AND nan_1(a_out, b_out, s_nand[7:0]);
    tristate nan_2(~s_nand,s_out,opcode_out[5]);

    XNOR xno_1(a_out, b_out, s_xnor[7:0]);
    tristate xno_2(s_xnor, s_out,opcode_out[6]);

    comparador com_1(a_out, b_out, s_com[7:0]);
    tristate com_2(s_com, s_out,opcode_out[7]);
    //--------------------------------------------------------
	
    reg_8_bit s1(s_out[7:0],s,clk);
  	
    always@ (*) begin
        case(opcode_in)
            3'b000 : flag = s_soma[8];
            3'b001 : flag = s_sub[8];
            default : flag = 1'b0;
        endcase
        end
endmodule