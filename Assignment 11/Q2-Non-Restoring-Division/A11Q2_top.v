`include "./A11Q2_nrd.v"

module top;

reg [31:0] dividend, divisor;
reg signed [6:0] len_dividend, len_divisor;
reg clk, newInput;

wire [31:0] quotient;
wire signed [31:0] remainder;

wire done; 
wire [4:0]numAdd, numSub;

reg [3:0] test_case_num = 0;
reg start;

nrd NRD(dividend, divisor, clk,  len_dividend, len_divisor, newInput, quotient, remainder, done, numAdd, numSub);

always @(negedge clk or posedge start) begin
    if (done == 1) begin
        if (len_dividend - len_divisor < 0 ) begin
          newInput = 0;
        end
        if (test_case_num > 0) begin
            $display("%d, %d, %d, %d, %d, %d", dividend, divisor, quotient, remainder, numAdd, numSub);
        end
        if (test_case_num == 0) begin
            dividend = 2020; divisor = 20; len_dividend = 11; len_divisor = 5; newInput = 1;
        end
        else if (test_case_num == 1) begin
            dividend = 9; divisor = 2; len_dividend = 4; len_divisor = 2; newInput = 1;
        end
        else if (test_case_num == 2) begin 
            dividend =10 ; divisor = 1; len_dividend = 4; len_divisor = 1; newInput = 1;
        end
        else if (test_case_num == 3) begin 
            dividend =10; divisor = 4; len_dividend = 4; len_divisor = 3; newInput = 1;
        end
        else if (test_case_num == 4) begin 
            dividend = 50; divisor = 5; len_dividend = 6; len_divisor = 3; newInput = 1;
        end
        else if (test_case_num == 5) begin 
            dividend = 10; divisor = 100; len_dividend = 4; len_divisor = 7; newInput = 1;
        end
        else if (test_case_num == 6) begin 
            dividend = 74; divisor = 9; len_dividend = 7; len_divisor = 4; newInput = 1;
        end
        else if (test_case_num == 7) begin 
            dividend = 1000; divisor = 1000; len_dividend = 10; len_divisor = 10; newInput = 1;
        end
        else if (test_case_num == 8) begin
            dividend = 4294967295; divisor = 1; len_dividend = 32; len_divisor = 1;newInput = 1;
        end
        else if (test_case_num == 9) begin
            dividend = 2; divisor = 4294967295; len_dividend = 1; len_divisor = 32;newInput = 1;
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
    $display("dividend, divisor, quotient, remainder, numAdd, numSub");
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