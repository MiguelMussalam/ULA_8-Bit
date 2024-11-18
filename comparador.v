module comparador(a,b,s);

    input [7:0] a,b;
    output reg [7:0] s;

    always@ (a or b)begin
    if(a == b)
        s = 8'b00000000;
    else if (a > b)
        s = 8'b00000010;
    else
        s = 8'b00000001; 
    end
endmodule