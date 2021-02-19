`include "./A4Q1_onebit_addersub.v"
`include "./A4Q1_eightbit_addersub.v"

module top;
    reg signed [7:0] a,b;
    reg opcode;
    wire signed [7:0] sum;
    wire cout;
    wire overflow;
    eightbit EIGHTBIT(a,b,opcode,sum,cout,overflow);
    always @ (a or b or opcode or sum or cout or overflow)
   begin
       $display("time=%d | A=%d, B=%d, OPCODE=%d, OUTPUT = %d, CARRY = %d, OVERFLOW = %b", $time, a, b, opcode, sum, cout, overflow);
   end
   initial begin
       a = 0; b = 0; opcode = 0;
       #1
       $display("\n");
       a = 2; b = 4; opcode = 1;
       #1
       $display("\n");
       a = 26; b = 127; opcode = 1;
       #1
       $display("\n");
       a = 127; b = 1;opcode = 0;
       #1
       $display("\n");
       a = 96; b = 36; opcode = 0;
       #1
       $display("\n");
       a = 47; b = 120; opcode= 1;
       #1
       $display("\n");
       a = 47; b = 120; opcode = 0;
       #1
       $display("\n");
       a = 63; b = 18; opcode = 1;
       #1
       $display("\n");
       a = 5; b = 54; opcode= 1;
       #1
       $display("\n");
       a = 70; b = 35; opcode = 0;
       #1
       $display("\n");
       a = 38; b = 17; opcode= 0;
       #1
       $display("\n");
       $finish;       
   end
endmodule