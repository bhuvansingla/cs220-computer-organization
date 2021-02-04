`include "./A2Q3_blink.v"

module top;

reg clk;
wire out;

blink BLINK(clk, out);

always @(out) begin
    $display("Time: %d | Blink: %d", $time, out);
end

initial begin
    forever begin
        clk = 1;
        #5
        clk = 0;
        #5
        clk = 1;
    end
end

initial begin
    #3100000
    $finish;
end

endmodule