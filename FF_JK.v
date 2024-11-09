module FF_JK(j,k,pr,clr,q,nq,clk);
    input j,k,pr,clr,clk;
    output reg q,nq;

    always@ (posedge clk) begin
        if ({pr,clr} == 2'b10)begin
            q = 1'b0;
            nq = ~q;
        end
        else if({pr,clr} == 2'b01)begin
            q = 1'b1;
            nq = ~q;
        end
        else if({pr,clr} == 2'b00) begin
            q = 1'bx;
            nq = 1'bx;
        end
        else begin
            case({j,k})
                2'b00:begin
                    q = q; nq = nq;
                end
                2'b01: begin
                    q = 0; nq = ~q;
                end
                2'b10: begin
                    q = 1; nq = ~q;
                end
                2'b11: q = ~q;
                default: q = 0;
            endcase
        end
    end
endmodule