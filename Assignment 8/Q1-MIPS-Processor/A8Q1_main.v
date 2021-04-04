`define MAX_PC 14
`define OUTPUT_REG 2

module main(clk, done, out);
    
    input clk;
    reg [2:0] state = 0;

    reg [31:0] curr_inst;
    reg [5:0] curr_opcode;
    reg [4:0] curr_rd;
    reg [4:0] curr_rs;
    reg [4:0] curr_rt;
    reg [4:0] curr_shft;
    reg signed [15:0] curr_imd;
    reg [5:0] curr_func;
    reg [26:0] curr_jt;

    reg [7:0] readVal1;
    reg [7:0] readVal2;
    reg [7:0] readRow;

    reg invalid = 0; // invalid = 0 means it is valid.

    reg [7:0] temp_sum;
    reg [7:0] temp_link;
    reg [7:0] temp_slt;
    reg [7:0] temp_address;

    output reg done = 0;
    output reg [7:0] out;

    reg signed [7:0] data_mem[0:10];
    reg signed [7:0] registers[0:31];
    reg [7:0] pc= 8'b00001100;


    reg [31:0] instruction_mem[0:13];

    initial begin
      data_mem[0] = 8'b00000011;
      data_mem[1] = 8'b00001010;
      data_mem[2] = 8'b00000011;
      data_mem[3] = 8'b00000100;
      data_mem[4] = 8'b00000101;
      data_mem[5] = 8'b11111011;
      data_mem[6] = 8'b10000000;
      data_mem[7] = 8'b11111110;
      data_mem[8] = 8'b11111101;
      data_mem[9] = 8'b11111100;
      data_mem[10] = 8'b00001010;
    end

    initial begin
        instruction_mem[0]=32'b00100100000000100000000000000000;
        instruction_mem[1]=32'b00100100000000110000000000000000;
        instruction_mem[2]=32'b00000000011000010010000000101010;
        instruction_mem[3]=32'b00010000000001000000000000001000;
        instruction_mem[4]=32'b00100100000001010000000000001010;
        instruction_mem[5]=32'b00010000101000110000000000000110;
        instruction_mem[6]=32'b10001100011001100000000000000000;
        instruction_mem[7]=32'b00000000010001100001000000100001;
        instruction_mem[8]=32'b00100100011000110000000000000001;
        instruction_mem[9]=32'b00000000011000010010000000101010;
        instruction_mem[10]=32'b00010100000001001111111111111011;
        instruction_mem[11]=32'b00000011111000000000000000001000;
        instruction_mem[12]=32'b10001100000000010000000000001010;
        instruction_mem[13]=32'b00001100000000000000000000000000;
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
            curr_inst <= instruction_mem[pc];
            state <= 1;
        end

        else if (state == 1) begin
            curr_opcode <= curr_inst[31:26];
            #1
            if (curr_opcode == 0) begin
              curr_rs <= curr_inst[25:21];
              curr_rt <= curr_inst[20:16];
              curr_rd <= curr_inst[15:11];
              curr_shft <= curr_inst[10:6];
              curr_func <= curr_inst[5:0];
            end
            else if (curr_opcode != 2 & curr_opcode != 3) begin
              curr_rs <= curr_inst[25:21];
              curr_rt <= curr_inst[20:16];
              curr_imd <= curr_inst[15:0];
            end
            else begin
              curr_jt <= curr_inst[25:0];
            end
            state <= 2;
        end

        else if (state == 2) begin
            if (curr_opcode == 0) begin
              readVal1 <= registers[curr_rs];
              readVal2 <= registers[curr_rt];
            end
            else if (curr_opcode != 2 & curr_opcode != 3) begin
              readVal1 <= registers[curr_rs];

              if (curr_opcode == 4 | curr_opcode == 5) begin
                readVal2 <= registers[curr_rt];
              end
            end
            state <= 3;
        end

        else if (state == 3) begin
            if(curr_opcode == 9) begin
              temp_sum <= readVal1 + curr_imd[7:0];
              pc <= pc + 1;
            end
            else if (curr_opcode == 0 && curr_func == 33) begin
              temp_sum <= readVal1 + readVal2;
              pc <= pc + 1;
            end
            else if (curr_opcode == 0 && curr_func == 42) begin
              if ($signed (readVal1) < $signed(readVal2)) begin
                temp_slt <= 1;
              end
              else begin
                temp_slt <= 0;
              end
              pc <= pc + 1;
            end
            else if (curr_opcode == 4 || curr_opcode == 5) begin
              if (curr_opcode == 4) begin
                if (readVal1 == readVal2) begin
                  pc <= pc + curr_imd[7:0];
                end
                else begin
                  pc <= pc + 1;
                end
              end
              if (curr_opcode == 5) begin
                if (readVal1 != readVal2) begin
                  pc <= pc + curr_imd[7:0];
                end
                else begin
                  pc <= pc + 1;
                end
              end
            end 
            else if (curr_opcode == 3) begin
              temp_link <= pc + 1;
              pc <= curr_jt[7:0];
            end
            else if (curr_opcode == 0 && curr_func == 8) begin
              pc <= readVal1;
            end
            else if (curr_opcode == 35) begin
              temp_address <= readVal1 + curr_imd[7:0];
              pc <= pc + 1;
            end
            else begin
                invalid <= 1;
            end
            state <= 4;
        end
        else if (state == 4) begin
          if (curr_opcode == 35) begin
            readRow <= data_mem[temp_address];
          end
          state <= 5;
        end
        else if (state == 5) begin
            if(invalid == 0) begin
                if (curr_opcode == 0 & curr_rd != 0) begin
                  if (curr_func == 33) begin
                    registers[curr_rd] <= temp_sum;
                  end
                  else if (curr_func == 42) begin
                    registers[curr_rd] <= temp_slt;
                  end
                end
                else if (curr_opcode == 9 & curr_rt != 0) begin
                  registers[curr_rt] <= temp_sum;
                end
                else if (curr_opcode == 35 & curr_rt != 0) begin
                    registers[curr_rt] <= readRow;
                end
                else if (curr_opcode == 3) begin
                  registers[31] <= temp_link;
                end
            end
            if(pc < `MAX_PC) begin
                state <= 0;
            end
            else begin
                state <= 6;
            end
        end
        else if (state == 6) begin
            out <= registers[`OUTPUT_REG];
            done <= #1 1;
        end
    end

endmodule