`include "meio_somador.v"
`include "somador.v"

module somador_completo_4bits(a, b, s);

    input [3:0] a,b;
    output [4:0] s;
    wire [3:0] c;

    meio_somador m1(a[0],b[0],s[0],c[0]);
    somador m2(a[1],b[1],c[0],s[1],c[1]);
    somador m3(a[2],b[2],c[1],s[2],c[2]);
    somador m4(a[3],b[3],c[2],s[3],s[4]);
endmodule