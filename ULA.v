`include "reg_8_bit.v"
`include "decodificador.v"
`include "tristate.v"

`include "somador_completo.v"
`include "subtrator_completo.v"
`include "AND.v"
`include "OR.v"
`include "XOR.v"

module ULA(a_in,b_in,opcode_in,s,clk);
    input clk;
    input [2:0] opcode_in;
    input [7:0] a_in,b_in;

    wire [7:0] a_out, b_out, opcode_out;
    wire [8:0] s_in,s_out;

    output [7:0] s;

    reg_8_bit reg_a(a_in,a_out,clk);
    reg_8_bit reg_b(b_in,b_out,clk);
    decodificador d(opcode_in,1'b1,opcode_out);

    //Operações <= 9 Bits
    //----------------------------------------
    somador_completo som_1(a_out,b_out,s_in);
    tristate som_2(s_in,s_out,opcode_out[0]);

    subtrator_completo sub_1(a_out,b_out,s_in);
    tristate sub_2(s_in,s_out,opcode_out[1]);
    //-----------------------------------------

    //Operações <= 8 Bits
    //----------------------------------------------------------
    AND and_1(a_out,b_out,s_in);
    tristate and_2(s_in,s_out,opcode_out[2]);

    OR or_1(a_out,b_out,s_in);
    tristate or_2(s_in,s_out,opcode_out[3]);

    XOR xor_1(a_out, b_out, s_in);
    tristate xor_2(s_in, s_out, opcode_out[4]);
    //----------------------------------------------------------

    reg_8_bit s1(s_out[7:0],s,clk);
endmodule