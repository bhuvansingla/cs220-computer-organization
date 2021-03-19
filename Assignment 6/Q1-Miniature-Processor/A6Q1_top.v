`include "./A6Q1_call.v"

module top;

    reg [4:0] read1,read2,write;
    reg signed [15:0] data;
    reg [2:0] cmd;
    reg clk;
    wire done;
    reg start;

    reg [4:0] inst_num = 0;

    call CALL(read1, read2, write, data, cmd, clk, done);
    

    always @(posedge done or posedge start) begin

        if (inst_num == 0) begin
            cmd=3'b000; write=1; data=17;
        end
        else if (inst_num == 1) begin
            cmd=3'b011; read1=1; write=2; data=-9;
        end
        else if (inst_num == 2) begin 
            cmd=3'b100; read1=1; read2=2; write=3; data=65;
        end
        else if (inst_num == 3) begin 
            cmd=3'b010; read1=2; read2=3;
        end
        else if (inst_num == 4) begin 
            cmd=3'b111; read1=3; write=5; data=3;
        end
        else if (inst_num == 5) begin 
            cmd=3'b101; read1=1; read2=2; write=4;
        end
        else if (inst_num == 6) begin 
            cmd=3'b111; read1=4; write=4; data=9;
        end
        else if (inst_num == 7) begin 
            cmd=3'b110; read1=5; read2=4; write=6;
        end
        else if (inst_num == 8) begin
            cmd=3'b001; read1=6;
        end
        else begin
          $display("Program completed.");
          $finish;
        end

        inst_num <= inst_num + 1;
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
        start=1;
        #1
        start=0;
    end
    
endmodule   