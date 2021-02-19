`include "./A4Q2_grid_walk.v"

module top;
reg [1:0] steps, direction;
reg clk;
wire [4:0] x; 
wire [4:0] y;
grid_walk GRID_WALK(steps, direction, clk, x, y);
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
    #100
    $finish;
end
initial begin
    // EAST = 0, NORTH = 1, WEST = 2, SOUTH = 3
    #3
    $display("Time= %2d , Previous Input: Steps = %d, Direction = %d | Currently At: (%d, %d)", $time,steps, direction, x, y);
    steps = 2; direction = 0;
    #10
    $display("Time= %2d , Previous Input: Steps = %d, Direction = %d | Currently At: (%d, %d)", $time,steps, direction, x, y);
    steps = 3; direction = 1;
    #10
    $display("Time= %2d , Previous Input: Steps = %d, Direction = %d | Currently At: (%d, %d)", $time,steps, direction, x, y);
    steps = 2; direction = 0;
    #10
    $display("Time= %2d , Previous Input: Steps = %d, Direction = %d | Currently At: (%d, %d)", $time,steps, direction, x, y);
    steps = 3; direction = 1;
    #10
    $display("Time= %2d , Previous Input: Steps = %d, Direction = %d | Currently At: (%d, %d)", $time,steps, direction, x, y);
    steps = 3; direction = 1;
    #10
    $display("Time= %2d , Previous Input: Steps = %d, Direction = %d | Currently At: (%d, %d)", $time,steps, direction, x, y);
    steps = 1; direction = 2;
    #10
    $display("Time= %2d , Previous Input: Steps = %d, Direction = %d | Currently At: (%d, %d)", $time,steps, direction, x, y);
    steps = 3; direction = 3;
    #10
    $display("Time= %2d , Previous Input: Steps = %d, Direction = %d | Currently At: (%d, %d)", $time,steps, direction, x, y);
    steps = 1; direction = 3;
    #10
    $display("Time= %2d , Previous Input: Steps = %d, Direction = %d | Currently At: (%d, %d)", $time,steps, direction, x, y);
    steps = 1; direction = 0;
    #10
    $display("Time= %2d , Previous Input: Steps = %d, Direction = %d | Currently At: (%d, %d)", $time,steps, direction, x, y);
    end
endmodule