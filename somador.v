module somador_completo(a, b,cin, s, cout);
    input a, b,cin;
    output reg s,cout;

    always@(a,b,cin)begin
    s = (a ^ b) ^ cin;
    cout = (b&cin) | (a&cin) | (a&b);
    end
endmodule