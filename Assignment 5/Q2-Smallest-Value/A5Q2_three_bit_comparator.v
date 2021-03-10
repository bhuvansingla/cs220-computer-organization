`include "./A5Q2_one_bit_comparator.v"

module three_bit_comparator(a, b, l);

    input [2:0] a;
    input [2:0] b;

    wire e;
    wire g;
    output wire l;

    wire [1:0] intermediate_e;
    wire [1:0] intermediate_g;
    wire [1:0] intermediate_l;

    one_bit_comparator C1 (a[2], b[2], 1'b1, 1'b0, 1'b0, intermediate_e[0], intermediate_g[0], intermediate_l[0]);
    one_bit_comparator C2 (a[1], b[1], intermediate_e[0], intermediate_g[0], intermediate_l[0], intermediate_e[1], intermediate_g[1], intermediate_l[1]);
    one_bit_comparator C3 (a[0], b[0], intermediate_e[1], intermediate_g[1], intermediate_l[1], e, g, l);

endmodule