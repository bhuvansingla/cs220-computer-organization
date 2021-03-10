module one_bit_comparator(a, b, e_n_1, g_n_1, l_n_1, e_n, g_n, l_n);

    input a;
    input b;
    input e_n_1;
    input g_n_1;
    input l_n_1;

    output wire e_n;
    output wire g_n;
    output wire l_n;

    assign g_n = g_n_1 | (e_n_1 & (a & (~b)));
    assign e_n= e_n_1 & ~(a^b);
    assign l_n = l_n_1 | (e_n_1 & ((~a) & b)); 

endmodule