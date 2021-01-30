module blink(clk, out);

input clk;
output reg out = 0;

reg [21:0] cycles = 0; //22 bits are sufficient to store 31,000 cycles.

always @(posedge clk) begin
    cycles <= cycles + 1;
    if(cycles % 25000 == 0) begin
      out <= ~out;
    end
    if(cycles == 310000) begin
      $finish;
    end
end

endmodule