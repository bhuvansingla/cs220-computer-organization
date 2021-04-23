`include "./A11Q1_booth.v"

module top;

reg signed [31:0] multiplicand, multiplier;
reg clk, newInput;

wire signed [63:0] product;
wire done; 
wire [4:0]numAdd, numSub;

reg [3:0] test_case_num = 0;
reg start;

booth BOOTH(multiplicand, multiplier, clk, newInput, product, done, numAdd, numSub);

always @(negedge clk or posedge start) begin
    if (done == 1) begin
        if (multiplier == 0 || multiplier == -1) begin
          newInput = 0;
        end
        if (test_case_num > 0) begin
            $display("%d, %d, %d, %d, %d", multiplicand, multiplier, product, numAdd, numSub);
        end

        if (test_case_num == 0) begin
            multiplicand = 2020; multiplier = -1; newInput = 1;
        end
        else if (test_case_num == 1) begin
            multiplicand = 9; multiplier = 2; newInput = 1;
        end
        else if (test_case_num == 2) begin 
            multiplicand =10 ; multiplier = 1; newInput = 1;
        end
        else if (test_case_num == 3) begin 
            multiplicand = -10; multiplier = 4; newInput = 1;
        end
        else if (test_case_num == 4) begin 
            multiplicand = -50; multiplier = -5; newInput = 1;
        end
        else if (test_case_num == 5) begin 
            multiplicand = 10; multiplier = 0; newInput = 1;
        end
        else if (test_case_num == 6) begin 
            multiplicand = 100; multiplier = 100; newInput = 1;
        end
        else if (test_case_num == 7) begin 
            multiplicand = 1000; multiplier = -1000; newInput = 1;
        end
        else if (test_case_num == 8) begin
            multiplicand = 99; multiplier = 1431655765; newInput = 1;
        end
        else if (test_case_num == 9) begin
            multiplicand = 1; multiplier = -1431655766; newInput = 1;
        end
        else begin
          $display("Program completed.");
          $finish;
        end

        test_case_num <= test_case_num + 1;
    end
    else begin
        newInput = 0;
    end
end

initial begin
    $display("multiplicand, multiplier, product, numAdd, numSub");
    start=1;
    #1
    start=0;
end

initial begin
    forever begin
        clk <= 1;
        #5
        clk <= 0;
        #5
        clk <= 1;
    end
end

endmodule