 `define SIZE 32

 module nrd(dividend, divisor, clk, len_dividend, len_divisor, newInput, quotient, remainder, done, numAdd, numSub);

    input [31:0] dividend, divisor;
    input signed [6:0] len_dividend, len_divisor;
    input clk, newInput;

    output reg [31:0] quotient = 0;
    output reg signed [31:0] remainder;
    output reg done = 1; 
    output reg [4:0] numAdd = 0, numSub = 0;

    reg isFirstCycle = 1;

    reg [31:0] aligned_divisor; 

    reg [5:0] iteration = 0;

    always @(posedge newInput) begin
        quotient <= 32'b0;
        remainder <= dividend;
        iteration <= 0;
        done <= 0;
        numAdd <= 0;
        numSub <= 0;
        isFirstCycle <= 1;
    end 

    always @(posedge clk) begin
        if (len_dividend - len_divisor < 0) begin
          done <= 1;
        end
        else if (isFirstCycle == 1) begin
            aligned_divisor <= divisor << (len_dividend - len_divisor);
            isFirstCycle <= 0;
        end
        else begin  

            if (remainder < 0) begin
              remainder <= remainder + aligned_divisor;
              numAdd <= numAdd + 1;
              quotient <= quotient ^ 1;
            end
            else begin
              remainder <= remainder - aligned_divisor;
              numSub <= numSub + 1;
            end
            #1
            quotient <= (quotient << 1) | 1;
            aligned_divisor <= aligned_divisor >> 1;
            iteration <= iteration + 1;
            #1
            if (iteration == len_dividend - len_divisor + 1) begin
                if (remainder < 0) begin
                  remainder <= remainder + divisor;
                  numAdd <= numAdd + 1;
                  quotient <= quotient - 1;
                end
                #1
                done <= 1;
            end
        end
    end

endmodule