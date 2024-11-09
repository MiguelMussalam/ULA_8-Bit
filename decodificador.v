module decodificador(a,enable,y);
    input [2:0] a;
    input enable;
    output reg [7:0] y;

    always@ (a or enable) begin
        if (enable == 1'b1) begin
        case(a)
        3'b000: y = 8'b00000001; // 0
        3'b001: y = 8'b00000010; // 1
        3'b010: y = 8'b00000100; // 2
        3'b011: y = 8'b00001000; // 3
        3'b100: y = 8'b00010000; // 4
        3'b101: y = 8'b00100000; // 5
        3'b110: y = 8'b01000000; // 6
        3'b111: y = 8'b10000000; // 7
        default: y = 8'b00000000; // Invalid
        endcase
        end
        else y = 8'b00000000;
    end
endmodule