`include "./A5Q2_three_bit_comparator.v"

module smallest(in0, in1, in2, in3, idx);

input [2:0] in0;
input [2:0] in1;
input [2:0] in2;
input [2:0] in3;

wire smaller0vs1;
wire smaller0vs2;
wire smaller0vs3;
wire smaller2vs3;
wire smaller1vs2;
wire smaller1vs3;

three_bit_comparator C1(in0, in1, smaller0vs1);
three_bit_comparator C2(in0, in2, smaller0vs2);
three_bit_comparator C3(in0, in3, smaller0vs3);
three_bit_comparator C4(in1, in2, smaller1vs2);
three_bit_comparator C5(in1, in3, smaller1vs3);
three_bit_comparator C6(in2, in3, smaller2vs3);

output wire [1:0] idx;

output wire isIndexZeroSmallest;
output wire isIndexOneSmallest;
output wire isIndexTwoSmallest;

assign isIndexZeroSmallest = (smaller0vs1 ? (smaller0vs2 ? (smaller0vs3 ? 1 : 0) : 0) : 0);
assign isIndexOneSmallest = (smaller1vs2 ? (smaller1vs3 ? 1 : 0) : 0);
assign isIndexTwoSmallest = (smaller2vs3 ? 1 : 0);
assign idx = isIndexZeroSmallest ? 2'b00 : (isIndexOneSmallest ? 2'b01 : (isIndexTwoSmallest ? 2'b10 : 2'b11));

endmodule