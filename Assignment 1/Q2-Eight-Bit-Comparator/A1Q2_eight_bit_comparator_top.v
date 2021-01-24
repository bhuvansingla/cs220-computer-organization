`include "./A1Q2_eight_bit_comparator.v"

module eight_bit_comparator_top;

    reg [7:0] a;
    reg [7:0] b;
    
    wire e;
    wire g;
    wire l;

    eight_bit_comparator COMPARE(a, b, e, g, l);

    always @(g or e or l or a or b) begin
        $display("time = %d | a = %d, b = %d | G = %d, E = %d, L = %d", $time, a, b, g, e, l);
    end

    initial begin
        a = 10; b = 20;
        #1
        $display("\n");
        a = 10; b = 10;
        #1
        $display("\n");
        a = 1; b = 0;
        #1
        $display("\n");
        a = 255; b = 255;
        #1
        $display("\n");
        a = 0; b = 9;
        #1
        $display("\n");
        a = 150; b = 111;
        #1
        $display("\n");
        a = 12; b = 20;
        #1
        $display("\n");
        a = 19; b = 91;
        #1
        $display("\n");
        a = 22; b = 220;
        #1
        $display("\n");
        a = 99; b = 99;
        #1
        $display("\n");
    end

endmodule