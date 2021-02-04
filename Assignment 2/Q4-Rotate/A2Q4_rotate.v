module rotate(clk, out);

input clk;
output reg [3:0] out = 4'b1000;

reg [15:0] cycles = 0;

always @(posedge clk) begin
    cycles <= cycles + 1;
    if (cycles == 25000) begin
      out[3] <= out[2];
      out[2] <= out[1];
      out[1] <= out[0];
      out[0] <= out[3];;
      cycles <= 1;
    end
end

endmodule