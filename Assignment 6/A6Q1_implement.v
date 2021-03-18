module implement(read1,read2,write,data,validity,readval1,readval2,clk);
    input [4:0] read1,read2,write;
    input [15:0] data;
    input [2:0] validity;
    input clk;
    output reg [15:0] readval1,readval2;
    reg [15:0] registers[0:31];
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
        if(validity==0) begin
            registers[write]<=data;
        end
        else if(validity==1) begin
            readval1<=registers[read1];
        end
        else if(validity==2) begin
            readval1<=registers[read1];
            readval2<=registers[read2];
        end
        else if(validity==3) begin
            readval1<=registers[read1];
            registers[write]<=data;
        end
        else if(validity==4) begin
            readval1<=registers[read1];
            readval2<=registers[read2];
            registers[write]<=data;
        end
    end
endmodule