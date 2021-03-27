`include "./A7Q1_main.v"

module top;

    reg clk;
    wire [2:0] pc, r, i, j, three, four, five, six;

    main MAIN(clk, pc, r, i, j, three, four, five, six);

    initial begin
        forever begin
            clk = 0;
            #5
            clk = 1;
            #5
            clk = 0;
        end
    end

    initial begin
        #80
        $display("R-format: %d\n", r);
        $display("I-format: %d\n", i);
        $display("J-format: %d\n", j);
        $display("Writes to $3: %d\n", three);
        $display("Writes to $4: %d\n", four);
        $display("Writes to $5: %d\n", five);
        $display("Writes to $6: %d\n", six);
        #1
        $finish;
    end
endmodule