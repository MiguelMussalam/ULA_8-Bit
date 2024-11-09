module meio_somador(a, b, s, c);
    input a, b;
    output reg s,c;

    always@(a,b)begin
    s = a ^ b;
    c = a & b;    
    end
endmodule  