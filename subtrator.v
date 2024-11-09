module subtrator_completo(a, b,cin, s, cout);
    input a, b,cin;
    output reg s,cout;

    always@(a,b,cin)begin
    s = (a ^ b) ^ cin;
    cout = (~a&b) | (~a&cin) | (b&cin);
    end
endmodule