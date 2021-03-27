module main(clk, pc, r, i, j, three, four, five, six);
    
    input clk;
    output reg [2:0] pc = 3'b0;
    output reg [2:0] r = 3'b0;
    output reg [2:0] i = 3'b0;
    output reg [2:0] j = 3'b0;
    output reg [2:0] three = 3'b0;
    output reg [2:0] four = 3'b0;
    output reg [2:0] five = 3'b0;
    output reg [2:0] six = 3'b0;

    reg [31:0] registers[0:7];
    
    wire [31:0] curr_inst;
    wire [5:0] curr_opcode;
    wire [4:0] curr_rd;
    wire [4:0] curr_rt;

    assign curr_inst = registers[pc];
    assign curr_opcode = curr_inst[31:26];
    assign curr_rd = curr_inst[15:11];
    assign curr_rt = curr_inst[20:16];

    initial begin
        registers[0]=32'b00100000000001000011010001010110;
        registers[1]=32'b00100000000001011111111111111111;
        registers[2]=32'b00000000101001000011000000010100;
        registers[3]=32'b00100000000000110000000000000111;
        registers[4]=32'b00000000110000110011000000000100;
        registers[5]=32'b00000000000000110001100001000010;
        registers[6]=32'b01011100100001011001101010111100;
        registers[7]=32'b00001000000100100011010001010110;
    end

    always @(posedge clk) begin

        if (curr_opcode == 0) begin
            // R
            r <= #1 r + 1;
            if (curr_rd == 3) begin
              three <= #1 three + 1;
            end
            else if (curr_rd == 4) begin
              four <= four + 1;
            end
            else if (curr_rd == 5) begin
              five <= five + 1;
            end
            else if (curr_rd == 6) begin
              six <= six + 1;
            end
        end
        else if (curr_opcode == 2 | curr_opcode == 3) begin
            // J
            j <= #1 j + 1;
        end
        else begin
            // I
            i<= #1 i + 1;
            if (curr_rt == 3) begin
              three <= #1 three + 1;
            end
            else if (curr_rt == 4) begin
              four <= four + 1;
            end
            else if (curr_rt == 5) begin
              five <= five + 1;
            end
            else if (curr_rt == 6) begin
              six <= six + 1;
            end
        end

        // $display("%b %b\n", curr_inst, curr_opcode);

        pc <= #1 pc + 1;
    end

endmodule