`include "./A5Q2_smallest_three_bit.v"

module top;

reg [2:0] in0;
reg [2:0] in1;
reg [2:0] in2;
reg [2:0] in3;

wire [1:0] idx;

smallest compare(in0, in1, in2, in3, idx);

initial begin
    in0 = 3'b000; in1 = 3'b000; in2 = 3'b010; in3 = 3'b111;
    #1
    $display("%d, %d, %d, %d | Output: %d", in0, in1, in2, in3, idx);

    in0 = 3'b000; in1 = 3'b100; in2 = 3'b010; in3 = 3'b001; 
    #1
    $display("%d, %d, %d, %d | Output: %d", in0, in1, in2, in3, idx);

    in0 = 3'b000; in1 = 3'b000; in2 = 3'b000; in3 = 3'b000;
    #1
    $display("%d, %d, %d, %d | Output: %d", in0, in1, in2, in3, idx);
    
    in0 = 3'b101; in1 = 3'b101; in2 = 3'b110; in3 = 3'b000; 
    #1
    $display("%d, %d, %d, %d | Output: %d", in0, in1, in2, in3, idx);

    in0 = 3'b101; in1 = 3'b101; in2 = 3'b110; in3 = 3'b111; 
    #1
    $display("%d, %d, %d, %d | Output: %d", in0, in1, in2, in3, idx);

    in0 = 3'b101; in1 = 3'b101; in2 = 3'b101; in3 = 3'b100;
    #1
    $display("%d, %d, %d, %d | Output: %d", in0, in1, in2, in3, idx);

        in0 = 3'b101; in1 = 3'b111; in2 = 3'b110; in3 = 3'b000; 
    #1
    $display("%d, %d, %d, %d | Output: %d", in0, in1, in2, in3, idx);

    in0 = 3'b001; in1 = 3'b101; in2 = 3'b010; in3 = 3'b011; 
    #1
    $display("%d, %d, %d, %d | Output: %d", in0, in1, in2, in3, idx);

    in0 = 3'b101; in1 = 3'b111; in2 = 3'b110; in3 = 3'b000; 
    #1
    $display("%d, %d, %d, %d | Output: %d", in0, in1, in2, in3, idx);

    in0 = 3'b111; in1 = 3'b111; in2 = 3'b110; in3 = 3'b111; 
    #1
    $display("%d, %d, %d, %d | Output: %d", in0, in1, in2, in3, idx);
end

endmodule