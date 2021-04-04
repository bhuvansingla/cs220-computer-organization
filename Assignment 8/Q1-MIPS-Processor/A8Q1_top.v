`include "./A8Q1_main.v"

module top;

    reg clk;
    wire done;
    wire signed [7:0] out;
    main MAIN(clk, done, out);

    always @(posedge done) begin
        $display("OUTPUT_REG contains %d", out);
        #1
        $finish;
    end

    initial begin
        forever begin
            clk = 0;
            #5
            clk = 1;
            #5
            clk = 0;
        end
    end
endmodule