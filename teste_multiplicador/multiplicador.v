`include "somador_completo_4bits.v"

module multiplicador(a,b,s,clk);
    input [3:0] a, b;
    output [7:0] s;
    wire [3:0] in_adicao1,in_adicao2;
    wire [4:0] s_adicao1, s_adicao2, s_adicao3;

    assign s[0] = a[0] & b[0];
    assign in_adicao1[0] = a[1] & b[0];
    assign in_adicao1[1] = a[2] & b[0];
    assign in_adicao1[2] = a[3] & b[0];
    assign in_adicao1[3] = 0;

    assign in_adicao2[0] = a[0] & b[1];
    assign in_adicao2[1] = a[1] & b[1];
    assign in_adicao2[2] = a[2] & b[1];
    assign in_adicao2[3] = a[3] & b[1];

    somador_completo_4bits som1({1'b0, in_adicao1[3:1]},in_adicao2,s_adicao1);

endmodule