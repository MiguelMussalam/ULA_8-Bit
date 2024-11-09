`include "FF_d.v"

module reg_8_bit(d,q,clk);
    input clk;
    input [7:0] d;
    output [7:0] q;
    genvar i;
    generate
        for(i = 0; i < 8; i = i+1) begin : ffd_inst
            FF_d ff(d[i],q[i],clk);
        end
    endgenerate
endmodule