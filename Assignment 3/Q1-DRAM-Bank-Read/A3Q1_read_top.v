`include "./A3Q1_read.v"

module read_top;
    reg clk,input_valid;
    reg [3:0] row_number;
    wire output_valid;
    wire [31:0] op;

    read READ(clk,row_number,input_valid,op,output_valid);
    
    always @(posedge output_valid) begin
        $display("Time=%3d,Row Number=%d,Output=%2d\n",$time,row_number,op);
    end
    
    initial begin
        #300
        $finish;
    end
    
    initial begin
        forever begin
            clk=0;
            #5
            clk=1;
            #5
            clk=0;
        end
    end
    
    initial begin
        #3
        input_valid=1;
        row_number=1;
        #10
        input_valid=0;
        #20
        input_valid=1;
        row_number=1;
        #10
        input_valid=0;
        #20
        input_valid=1;
        row_number=15;
        #10
        input_valid=0;
        #20
        input_valid=1; 
        row_number=10;
        #10
        input_valid=0;
        #20
        input_valid=1; 
        row_number=13;
        #10
        input_valid=0;
        #20
        input_valid=1; 
        row_number=13;
        #10
        input_valid=0;
        #20
        input_valid=1; 
        row_number=8;
        #10
        input_valid=0;
        #20
        input_valid=1; 
        row_number=10;
        #10
        input_valid=0;
        #20
        input_valid=1; 
        row_number=11;
        #10
        input_valid=0;
        #20
        input_valid=1; 
        row_number=12;
        #10
        input_valid=0;
    end
endmodule
