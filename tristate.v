module tristate(a,b,en);
    input en;
    input [8:0] a;
    output reg [8:0] b;
    always@ (*) begin
        if(en)
            b = a;
        else
            b = 8'bz;
    end
endmodule