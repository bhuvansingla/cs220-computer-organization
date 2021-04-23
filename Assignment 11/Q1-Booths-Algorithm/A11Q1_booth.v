 `define SIZE 32

 module booth(multiplicand, multiplier, clk, newInput, product, done, numAdd, numSub);

    input signed [31:0] multiplicand, multiplier;
    input clk, newInput;

    output reg signed [63:0] product = 64'b0;
    output reg done = 0; 
    output reg [4:0] numAdd = 0, numSub = 0;

    reg [4:0] curr_idx = 0;
    reg curr_multiplier_bit;
    reg prev_multiplier_bit = 0;
    reg signed [31:0] temp_multiplier;

    always @(posedge newInput) begin
        product <= 64'b0;
        curr_idx <= 0;
        prev_multiplier_bit <= 0;
        done <= 0;
        numAdd <= 0;
        numSub <= 0;
    end

    always @(posedge clk) begin
        curr_multiplier_bit <= multiplier[curr_idx];
        #1
        if (curr_multiplier_bit != prev_multiplier_bit) begin
            if (curr_multiplier_bit == 1) begin
                product <= product - (multiplicand << curr_idx);
                numSub <= numSub + 1;
            end
            else begin
                product <= product + (multiplicand << curr_idx);
                numAdd <= numAdd + 1;
            end
        end

        temp_multiplier <= multiplier >>> (curr_idx + 1);
        #1
        if (curr_multiplier_bit == 0) begin
            if (temp_multiplier == 0) begin
                done <= 1;
            end
        end
        else begin
            if(temp_multiplier == -1) begin
                done <= 1;
                
            end
        end

        if (curr_idx == `SIZE - 1) begin
            done <= 1;
        end 
        curr_idx <= curr_idx + 1;
        prev_multiplier_bit <= curr_multiplier_bit;
    end

endmodule