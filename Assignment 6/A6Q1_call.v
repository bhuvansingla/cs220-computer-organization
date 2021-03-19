module call(read1, read2, write, data, cmd, clk, done);

    input [4:0] read1,read2,write;
    input signed [15:0] data;
    input [2:0] cmd;
    input clk;

    output reg done;

    reg [4:0] cycles = 5'b0;
    reg signed [15:0] temp;

    reg signed [15:0] readval1,readval2;
    reg signed [15:0] registers[0:31];

    initial begin
        registers[0]=16'b0;
        registers[1]=16'b0;
        registers[2]=16'b0;
        registers[3]=16'b0;
        registers[4]=16'b0;
        registers[5]=16'b0;
        registers[6]=16'b0;
        registers[7]=16'b0;
        registers[8]=16'b0;
        registers[9]=16'b0;
        registers[10]=16'b0;
        registers[11]=16'b0;
        registers[12]=16'b0;
        registers[13]=16'b0;
        registers[14]=16'b0;
        registers[15]=16'b0;
        registers[16]=16'b0;
        registers[17]=16'b0;
        registers[18]=16'b0;
        registers[19]=16'b0;
        registers[20]=16'b0;
        registers[21]=16'b0;
        registers[22]=16'b0;
        registers[23]=16'b0;
        registers[24]=16'b0;
        registers[25]=16'b0;
        registers[26]=16'b0;
        registers[27]=16'b0;
        registers[28]=16'b0;
        registers[29]=16'b0;
        registers[30]=16'b0;
        registers[31]=16'b0;
    end

    always @(posedge clk) begin

        if(cmd==0) begin
            if (cycles == 2) begin
                registers[write]<=data;
                cycles <= 0; 
                #1
                done <= 1'b1;
                done <= #1 1'b0;
            end
            cycles <= cycles + 1;
        end

        else if(cmd==1) begin
            if (cycles == 2) begin            
                readval1<=registers[read1];
                cycles <= 0;
                #1
                $display("Read Address: %d | Read Value: %d\n", read1, readval1);
                done <= 1'b1;
                done <= #1 1'b0;
            end
            cycles <= cycles + 1;
        end

        else if(cmd==2) begin
            if (cycles == 2) begin

                readval1<=registers[read1];
                readval2<=registers[read2];
                cycles <= 0;
                #1
                $display("Read Address 1 = %d | Read Value 1 = %d\n" ,read1, readval1);
                $display("Read Address 2 = %d | Read Value 2 = %d\n" ,read2, readval2);
                
                done <= 1'b1;
                done <= #1 1'b0;
        
            end
            cycles <= cycles + 1;
        end

        else if(cmd==3) begin
            if (cycles == 2) begin
                readval1<=registers[read1];
                registers[write]<=data;
                cycles <= 0;
                #1
                $display("Read Address = %d | Read Value = %d\n" , read1, readval1);
                done <= 1'b1;
                done <= #1 1'b0;
            end
            cycles <= cycles + 1;
        end

        else if(cmd==4) begin
            if (cycles == 2) begin
                readval1<=registers[read1];
                readval2<=registers[read2];
                registers[write]<=data;
                cycles <= 0;
                #1
                $display("Read Address 1 = %d | Read Value 1 = %d\n" ,read1, readval1);
                $display("Read Address 2 = %d | Read Value 2 = %d\n" ,read2, readval2);
                done <= 1'b1;
                done <= #1 1'b0;
            end
            cycles <= cycles + 1;
        end
       
        else if(cmd == 5) begin
             if (cycles == 2) begin
                readval1<=registers[read1];
                readval2<=registers[read2];
            end
            else if (cycles == 18) begin
                temp<=readval1+readval2;
            end
            else if (cycles == 20) begin
                registers[write]<=temp;
                cycles <= 0;
                #1
                $display("Write Address = %d | Written Value = %d\n", write, temp);
                done <= 1'b1;
                done <= #1 1'b0;
            end            
            cycles<=cycles+1; 
        end

        else if(cmd == 6) begin
             if (cycles == 2) begin
                readval1<=registers[read1];
                readval2<=registers[read2];
            end
            else if (cycles == 18) begin
                temp<=readval1-readval2;
            end
            else if (cycles == 20) begin
                registers[write]<=temp;
                cycles <= 0;
                #1
                $display("Write Address = %d | Written Value = %d\n", write, temp);
                done <= 1'b1;
                done <= #1 1'b0;
            end            
            cycles<=cycles+1; 
        end

        else if(cmd == 7) begin
            if (cycles == 2) begin
                readval1<=registers[read1];
            end
            else if (cycles == 18) begin
                temp<=(readval1<<data);
            end
            else if (cycles == 20) begin
                registers[write]<=temp;
                cycles <= 0;
                #1
                $display("Write Address = %d | Written Value = %d\n", write, temp);
                done <= 1'b1;
                done <= #1 1'b0;
            end
            cycles<=cycles+1; 
        end 
    end
endmodule