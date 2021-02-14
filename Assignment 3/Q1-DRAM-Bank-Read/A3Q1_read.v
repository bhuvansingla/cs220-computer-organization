`define TICK #1

module read(clk,row_number,input_valid,op,output_valid);

    input clk,input_valid;
    input [3:0] row_number; //15 rows,thus we require 4 bits
    output output_valid;
    output [31:0] op;
    reg [31:0] op;
    reg output_valid;
    reg [31:0] r[0:15];
    reg [3:0] open_row_number=4'bz;
    reg [1:0] cycle=2'd0;
    reg is_open=1'b0;

    initial begin
        r[0]=32'd0;
        r[1]=32'd1;
        r[2]=32'd2;
        r[3]=32'd3;
        r[4]=32'd4;
        r[5]=32'd5;
        r[6]=32'd6;
        r[7]=32'd7;
        r[8]=32'd8;
        r[9]=32'd9;
        r[10]=32'd10;
        r[11]=32'd11;
        r[12]=32'd12;
        r[13]=32'd13;
        r[14]=32'd14;
        r[15]=32'd15;
    end
    
    always @(posedge clk) begin
        if(input_valid==1) begin
            if(is_open==1'b0) begin
                //one cycle later
                cycle<= `TICK 2'd1;
                output_valid<= `TICK 0;
                open_row_number<= `TICK row_number;
                is_open<=`TICK 1'b1;
            end
            else begin
                if(row_number==open_row_number) begin
                    //same cycle
                    cycle<= `TICK 2'd0;
                    output_valid<= `TICK 1;
                    // output_valid<= #1 0;
                end
                else begin
                    //two cycles later
                    cycle<= `TICK 2'd2;     
                    output_valid<= `TICK 0;   
                    open_row_number<= `TICK row_number; 
                end
            end
        end
        if(cycle==1) begin
            cycle<= `TICK cycle-1;
            op<= `TICK r[row_number];
            output_valid<= `TICK 1;
            output_valid<= `TICK 0;
        end
        else if(cycle==2) begin
            cycle<= `TICK cycle-1;
            output_valid<= `TICK 0;
        end
    end

endmodule
