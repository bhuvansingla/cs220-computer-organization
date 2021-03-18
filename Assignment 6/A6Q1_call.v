`include "./A6Q1_implement.v"
module call(read1,read2,write,data,validity,readval1,readval2,clk,indicator);
    input [4:0] read1,read2,write;
    input [15:0] data;
    input [2:0] validity;
    input clk;
    reg [15:0] temp;
    output reg indicator;
    reg [2:0] send;
    output wire [15:0] readval1,readval2;
    reg [4:0] counter=5'b0;
    implement IMP(read1,read2,write,temp,send,readval1,readval2,clk);
    always @(posedge clk) begin
        if(validity==0) begin
            send<=0;
            counter<=0;
            indicator <= 1'b1;
            indicator <= #1 1'b0;
        end
        else if(validity==1) begin
            send<=1;
            counter<=0;
            indicator <= 1'b1;
            indicator <= #1 1'b0;
            $display("time: %d, address = %b(%d) : Read Value = %b(%d) \n" ,$time, read1,read1,readval1,readval1);
        end
        else if(validity==2) begin
            send<=2;
            counter<=0;
            indicator <= 1'b1;
            indicator <= #1 1'b0;
            $display("time: %d, address1 = %b(%d) : Read Value1 = %b(%d) \n" ,$time, read1,read1,readval1,readval1);
            $display("time: %d, address2 = %b(%d) : Read Value2 = %b(%d) \n" ,$time, read2,read2,readval2,readval2);
        end
        else if(validity==3) begin
            send<=3;
            counter<=0;
            indicator <= 1'b1;
            indicator <= #1 1'b0;
            $display("time: %d, address = %b(%d) : Read Value = %b(%d) \n" ,$time, read1,read1,readval1,readval1);
        end
        else if(validity==4) begin
            send<=4;
            counter<=0;
            indicator <= 1'b1;
            indicator <= #1 1'b0;
            $display("time: %d, address1 = %b(%d) : Read Value1 = %b(%d) \n" ,$time, read1,read1,readval1,readval1);
            $display("time: %d, address2 = %b(%d) : Read Value2 = %b(%d) \n" ,$time, read2,read2,readval2,readval2);
        end
        else if(validity==5&&counter==0) begin
            send<=2;
        end
        else if(validity==5&&counter==2) begin
            temp<=readval1+readval2;
        end
        else if(validity==5&&counter==18) begin 
            send<=0;
            indicator <= 1'b1;
            indicator <= #1 1'b0;
            $display("time: %d, address = %b(%d) : Written Value = %b(%d) \n" ,$time, write,write,data,data);
        end
        else if(validity==6&&counter==0) begin
            send<=2;
        end
        else if(validity==6&&counter==2) begin
            temp<=readval1-readval2;
        end
        else if(validity==6&&counter==18) begin 
            send<=0;
            indicator <= 1'b1;
            indicator <= #1 1'b0;
            $display("time: %d, address = %b(%d) : Written Value = %b(%d) \n" ,$time, write,write,data,data);
        end
         else if(validity==7&&counter==0) begin
            send<=2;
        end
        else if(validity==7&&counter==2) begin
            temp<=(readval1<<readval2);
        end
        else if(validity==7&&counter==18) begin 
            send<=0;
            indicator <= 1'b1;
            indicator <= #1 1'b0;
            $display("time: %d, address = %b(%d) : Written Value = %b(%d) \n" ,$time, write,write,data,data);
        end
        counter<=counter+1;
    end
endmodule