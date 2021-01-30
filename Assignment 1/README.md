# Assignment 1

[40 points] 1. Implement an eight-bit ripple carry adder using eight one-bit full adders. Organize the design as follows. Write a module for one-bit full adder. Write another module for eight-bit ripple carry adder that instantiates eight one-bit full adders and connects them properly to build an eight-bit ripple carry adder. Write a top module to test the eight-bit adder. Make sure to display your inputs, sum, and carry out. Your top module must have ten different inputs. Put one time unit delay between consecutive inputs. Place one module in one verilog file i.e., you will have three verilog files. As a hint, the module skeletons are given below.

```
module one_bit_full_adder (a, b, cin, sum, cout);

   input a;
   input b;
   input cin;

   output sum;
   wire sum;
   output cout;
   wire cout;

   ...

endmodule
```

```
module eight_bit_adder (x, y, carry_in, sum, carry_out);

   input [7:0] x;
   input [7:0] y;
   input carry_in;

   output [7:0] sum;
   wire [7:0] sum;
   output carry_out;
   wire carry_out;

   wire [6:0] intermediate_carry;

   one_bit_full_adder FA0 (x[0], y[0], carry_in, sum[0], intermediate_carry[0]);
   one_bit_full_adder FA1 (...);

   ...

endmodule
```

```
module eight_bit_adder_top;

   reg [7:0] A;
   reg [7:0] B;
   reg Cin;

   wire [7:0] Sum;
   wire Carry;

   eight_bit_adder ADDER (A, B, Cin, Sum, Carry);

   always @ (A or B or Cin)
   ...

endmodule
```

[60 points] 2. Implement an eight-bit comparator using eight one-bit comparators. Just like the previous question, organize your design into three different modules. The top module should have ten test cases. For each test case, display the inputs and the three outputs (less, equal, greater). Choose your test cases to cover all three outputs. In this case also, you will have three verilog files.

Submission: Submit your verilog files (three files for each question) named clearly. For example, you could name the files as follows: A1Q1_one_bit_full_adder.v, A1Q1_eight_bit_adder.v, A1Q1_eight_bit_adder_top.v, A1Q2_one_bit_comparator.v, A1Q2_eight_bit_comparator.v, A1Q2_eight_bit_comparator_top.v. Email the files as attachment to cs220spring2021submit@gmail.com. The subject line of the email MUST be the following (replace N by your group number): Assignment#1 submission for Group#N
