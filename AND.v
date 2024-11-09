module AND(a,b,s);
    input [7:0] a,b;
    output reg [8:0] s;

    s = a & b;
endmodule