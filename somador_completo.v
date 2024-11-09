`include "meio_somador.v"
`include "somador.v"

module somador_e_subtrator(a, b, s);

    input [7:0] a,b;
    output [8:0] s;
    wire [6:0] c;

    meio_somador m1(a[0],b[0],s[0],c[0]);
    somador_completo m2(a[1],b[1],c[0],s[1],c[1]);
    somador_completo m3(a[2],b[2],c[1],s[2],c[2]);
    somador_completo m4(a[3],b[3],c[2],s[3],c[3]);
    somador_completo m5(a[4],b[4],c[3],s[4],c[4]);
    somador_completo m6(a[5],b[5],c[4],s[5],c[5]);
    somador_completo m7(a[6],b[6],c[5],s[6],c[6]);
    somador_completo m8(a[7],b[7],c[6],s[7],s[8]);
endmodule