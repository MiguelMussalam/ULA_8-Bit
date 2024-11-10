`timescale 1ns/1ns
`include "ULA.v"

module ULA_tb;

    reg clk;
    reg [7:0] a, b;
    reg [2:0] opcode;
    wire [8:0] s;
    ULA uut(a,b,opcode,s,clk);

    initial begin
        $dumpfile("ULA_tb.vcd");
        $dumpvars(0,ULA_tb);
        
        a = 8'b00000001;
        b = 8'b00000001;
        opcode = 3'b000;
        $display("Teste completo");
        $finish;
    end

    initial begin
        clk = 0;
        forever #10 clk = ~ clk;
    end
endmodule