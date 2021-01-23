module one_bit_full_adder (a, b, cin, sum, cout);

   input a;
   input b;
   input cin;

   output sum;
   wire sum;
   output cout;
   wire cout;

   assign sum = a ^ b ^ cin;
   assign cout = ((a & b) | (b & cin) | (cin & a));

endmodule
