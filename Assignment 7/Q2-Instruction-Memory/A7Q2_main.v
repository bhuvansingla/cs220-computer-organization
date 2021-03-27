`define MAX_PC 7
`define OUTPUT_REG 5
`include "./A7Q2_eightbit_addersub.v"

module main(clk, done, out);
    
    input clk;
    reg [31:0] instructions[0:6];
    reg [2:0] state = 0;
    reg [2:0] pc = 0;


    reg [31:0] curr_inst;
    reg [5:0] curr_opcode;
    reg [4:0] curr_rd;
    reg [4:0] curr_rs;
    reg [4:0] curr_rt;
    reg [4:0] curr_shft;
    reg [15:0] curr_imd;
    reg [5:0] curr_func;

    reg [7:0] readVal1;
    reg [7:0] readVal2;

    reg invalid = 0; // invalid = 0 means it is valid.

    reg signed [7:0] registers[0:31];

    reg [7:0] a, b;
    reg opcode;
    wire [7:0] sum;
    wire cout;
    output reg done = 0;
    output reg [7:0] out;

    eightbit EIGHTBIT(a,b,opcode,sum,cout);

    initial begin 
        instructions[0] =32'b00100100000000010000000000101101;
        instructions[1] =32'b00100100000000101111111111101100;
        instructions[2] =32'b00100100000000111111111111000100;
        instructions[3] =32'b00100100000001000000000000011110;
        instructions[4] =32'b00000000001000100010100000100001;
        instructions[5] =32'b00000000011001000011000000100001;
        instructions[6] =32'b00000000101001100010100000100011;
    end

    initial begin
        registers[0]=8'b0;
        registers[1]=8'b0;
        registers[2]=8'b0;
        registers[3]=8'b0;
        registers[4]=8'b0;
        registers[5]=8'b0;
        registers[6]=8'b0;
        registers[7]=8'b0;
        registers[8]=8'b0;
        registers[9]=8'b0;
        registers[10]=8'b0;
        registers[11]=8'b0;
        registers[12]=8'b0;
        registers[13]=8'b0;
        registers[14]=8'b0;
        registers[15]=8'b0;
        registers[16]=8'b0;
        registers[17]=8'b0;
        registers[18]=8'b0;
        registers[19]=8'b0;
        registers[20]=8'b0;
        registers[21]=8'b0;
        registers[22]=8'b0;
        registers[23]=8'b0;
        registers[24]=8'b0;
        registers[25]=8'b0;
        registers[26]=8'b0;
        registers[27]=8'b0;
        registers[28]=8'b0;
        registers[29]=8'b0;
        registers[30]=8'b0;
        registers[31]=8'b0;
    end

    always @(posedge clk) begin
        if (state == 0) begin
            curr_inst <= instructions[pc];
            pc <= pc + 1;
            state <= 1;
        end
        else if (state == 1) begin
            curr_opcode <= curr_inst[31:26];
            #1
            if (curr_opcode == 0) begin
                // R
                curr_rs <= curr_inst[25:21];
                curr_rt <= curr_inst[20:16];
                curr_rd <= curr_inst[15:11];
                curr_shft <= curr_inst[10:6];
                curr_func <= curr_inst[5:0];

            end
            else if (curr_opcode != 2 | curr_opcode != 3) begin
                // I
                curr_rs <= curr_inst[25:21];
                curr_rt <= curr_inst[20:16];
                curr_imd <= curr_inst[15:0];
            end
            state <= 2;
        end
        else if (state == 2) begin
            if (curr_opcode == 0) begin
                // R
                readVal1 <= registers[curr_rs];
                readVal2 <= registers[curr_rt];
            end
            else if (curr_opcode != 2 & curr_opcode != 3) begin
                // I
                readVal1 <= registers[curr_rs];
            end
            state <= 3;
        end
        else if (state == 3) begin
            if(curr_opcode == 9) begin
                a <= readVal1;
                b <= curr_imd[7:0];
                opcode <= 0;
            end
            else if (curr_opcode == 0 && curr_func == 33) begin
                a <= readVal1;
                b <= readVal2;
                opcode <= 0;
            end
            else if (curr_opcode == 0 && curr_func == 35) begin
                a <= readVal1;
                b <= readVal2;
                opcode <= 1;
            end
            else begin
                invalid <= 1;
            end
            state <= 4;
        end
        else if (state == 4) begin
            if(invalid == 0) begin
                if (curr_opcode == 0 & curr_rd != 0) begin
                    // R
                    registers[curr_rd] <= sum;
                end
                else if ((curr_opcode != 2 & curr_opcode != 3) & curr_rt != 0) begin
                    // I
                    registers[curr_rt] <= sum;
                end
            end
            if(pc < `MAX_PC) begin
                state <= 0;
            end
            else begin
                state <= 5;
            end
        end
        else if (state == 5) begin
            out <= registers[`OUTPUT_REG];
            done <= #1 1;
        end
    end

endmodule