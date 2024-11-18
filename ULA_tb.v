`include "ULA.v"

module ULA_tb;

    reg clk;
    reg [7:0] a, b;
    reg [2:0] opcode;
 	wire [7:0] s;
  	wire flag;
  	ULA uut(a,b,opcode,s,flag,clk);

    initial begin
        $dumpfile("ULA_tb.vcd");
        $dumpvars(0,ULA_tb);
        
        // Adição
        a = 8'd10;
        b = 8'd10;
        opcode = 3'b000; #100;
      
        a = 8'd255;
        b = 8'd255; #100;
        //--------------------
      
        // Subtração
        a = 8'd10;
        b = 8'd10;
        opcode = 3'b001; #100;
      
        a = 8'd25;
        b = 8'd5; #100;
        //--------------------

        // AND
        a = 8'b00000001;
        b = 8'b00000001;
        opcode = 3'b010; #100;

        a = 8'b00000010;
        b = 8'b00000000; #100;
        //--------------------

        // OR
        a = 8'b00000001;
        b = 8'b00000001;
        opcode = 3'b011; #100;

        a = 8'b00000010;
        b = 8'b00000000; #100;
        //--------------------

        // XOR
        a = 8'b00000001;
        b = 8'b00000001;
        opcode = 3'b100; #100;

        a = 8'b00000010;
        b = 8'b00000000; #100;
        //--------------------

        // NAND
        a = 8'b00000001;
        b = 8'b00000001;
        opcode = 3'b101; #100;

        a = 8'b00000001;
        b = 8'b00000000; #100;
        //--------------------

        //XNOR
        a = 8'b00000001;
        b = 8'b00000001;
        opcode = 3'b110; #100;

        a = 8'b00000010;
        b = 8'b00000000; #100;
        //--------------------

        // Comparador
        a = 8'b00000001;
        b = 8'b00000001;
        opcode = 3'b111; #100;

        a = 8'b00000010;
        b = 8'b00000000; #100;
        //--------------------
      
        $display("Teste completo");
        $finish;
    end

    initial begin
        clk = 0;
        forever #10 clk = ~ clk;
    end
endmodule