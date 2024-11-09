`include "FF_JK.v"

module FF_d(d,pr,clr,q,nq,clk);
    input d,pr,clr,clk;
    output q,nq;

    FF_JK j(d,~d,~pr,~clr,q,nq,~clk);
endmodule