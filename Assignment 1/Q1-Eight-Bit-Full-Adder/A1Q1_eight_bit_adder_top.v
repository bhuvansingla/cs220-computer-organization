`include "./A1Q1_eight_bit_adder.v"

module eight_bit_adder_top;

   reg [7:0] A;
   reg [7:0] B;
   reg Cin;

   wire [7:0] Sum;
   wire Carry;

   eight_bit_adder ADDER (.x(A), .y(B), .carry_in(Cin), .sum(Sum), .carry_out(Carry));

   always @ (A or B or Cin or Sum or Carry)
   begin
       $display("time=%d | %d + %d + %d = %d, carry = %d", $time, A, B, Cin, Sum, Carry);
   end

   initial begin
       A = 0; B = 0; Cin = 0;
       #1
       $display("\n");
       A = 2; B = 4; Cin = 1;
       #1
       $display("\n");
       A = 26; B = 144; Cin = 1;
       #1
       $display("\n");
       A = 128; B = 8; Cin = 0;
       #1
       $display("\n");
       A = 196; B = 36; Cin = 0;
       #1
       $display("\n");
       A = 147; B = 120; Cin = 1;
       #1
       $display("\n");
       A = 147; B = 120; Cin = 1;
       #1
       $display("\n");
       A = 63; B = 18; Cin = 1;
       #1
       $display("\n");
       A = 255; B = 254; Cin = 1;
       #1
       $display("\n");
       A = 170; B = 255; Cin = 0;
       #1
       $display("\n");
       A = 238; B = 17; Cin = 0;
       #1
       $display("\n");
       $finish;       
   end

endmodule