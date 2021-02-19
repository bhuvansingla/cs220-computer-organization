`include "./A4Q2_fivebit_adder_sub.v"

module grid_walk(steps, direction, clk, x, y);


input wire [1:0] steps;
input wire [1:0] direction;
input wire clk;

output reg signed [4:0] x = 5'b00000, y = 5'b00000;

assign direction_op_code = direction == 2'b00 | direction == 2'b01 ? 0 : 1; 

wire signed [4:0] newX, newY;

wire coutX ,overflowX;
wire coutY ,overflowY;

fivebit addX(x, steps, direction_op_code, newX, coutX, overflowX);
fivebit addY(y, steps, direction_op_code, newY, coutY, overflowY);

always @(posedge clk) begin
    if (direction == 2'b00) begin
        if(newX[4] == 1) begin
            x <= 5'b01111;
        end
        else begin
            x <= newX;
        end
    end
    else if (direction == 2'b10) begin
      if(newX[4] == 1) begin
            x <= 5'b00000;
        end
        else begin
            x <= newX;
        end
    end
    else if (direction == 2'b01) begin
      if(newY[4] == 1) begin
            y <= 5'b01111;
        end
        else begin
            y <= newY;
        end
    end
    else begin
        if(newY[4] == 1) begin
            y <= 5'b00000;
        end
        else begin
            y <= newY;
        end
    end
end

endmodule