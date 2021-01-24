`include "./A1Q2_one_bit_comparator.v"

module eight_bit_comparator(a, b, e, g, l);

    input [7:0] a;
    input [7:0] b;

    output wire e;
    output wire g;
    output wire l;

    wire [6:0] intermediate_e;
    wire [6:0] intermediate_g;
    wire [6:0] intermediate_l;
    

    one_bit_comparator C1 (a[7], b[7], 1'b1, 1'b0, 1'b0, intermediate_e[0], intermediate_g[0], intermediate_l[0]);
    one_bit_comparator C2 (a[6], b[6], intermediate_e[0], intermediate_g[0], intermediate_l[0], intermediate_e[1], intermediate_g[1], intermediate_l[1]);
    one_bit_comparator C3 (a[5], b[5], intermediate_e[1], intermediate_g[1], intermediate_l[1], intermediate_e[2], intermediate_g[2], intermediate_l[2]);
    one_bit_comparator C4 (a[4], b[4], intermediate_e[2], intermediate_g[2], intermediate_l[2], intermediate_e[3], intermediate_g[3], intermediate_l[3]);
    one_bit_comparator C5 (a[3], b[3], intermediate_e[3], intermediate_g[3], intermediate_l[3], intermediate_e[4], intermediate_g[4], intermediate_l[4]);
    one_bit_comparator C6 (a[2], b[2], intermediate_e[4], intermediate_g[4], intermediate_l[4], intermediate_e[5], intermediate_g[5], intermediate_l[5]);
    one_bit_comparator C7 (a[1], b[1], intermediate_e[5], intermediate_g[5], intermediate_l[5], intermediate_e[6], intermediate_g[6], intermediate_l[6]);
    one_bit_comparator C8 (a[0], b[0], intermediate_e[6], intermediate_g[6], intermediate_l[6], e, g, l);

endmodule