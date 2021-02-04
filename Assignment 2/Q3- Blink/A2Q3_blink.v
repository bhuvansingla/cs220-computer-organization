module blink(clk, out);

input clk;
output reg out = 0;

reg [15:0] cycles = 0;

always @(posedge clk) begin
    cycles <= cycles + 1;
    if(cycles == 25000) begin
      out <= ~out;
      cycles <= 1;
    end
end

endmodule