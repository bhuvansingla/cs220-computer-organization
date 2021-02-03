module rotate(clk, out);

input clk;
output reg [3:0] out = 4'b1000;

reg [15:0] cycles = 0;

reg temp;

always @(posedge clk) begin
    cycles = cycles + 1;
    if (cycles == 25000) begin
      temp = out[3];
      out[3] = out[2];
      out[2] = out[1];
      out[1] = out[0];
      out[0] = temp;
      cycles = 0;
    end
end

endmodule