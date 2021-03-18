`include "./A6Q1_call.v"
module top;
    reg [4:0] read1,read2,write;
    reg [15:0] data;
    reg [2:0] validity;
    reg clk;
    wire indicator;
    wire [15:0] readval1,readval2;
    call CALL(read1,read2,write,data,validity,readval1,readval2,clk,indicator);
    always @(posedge indicator) begin
        $display("Instruction completed");
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
        validity=3'b000;write=1;data=17;
        #20
        validity=3'b011; read1=1; write=2; data=-9;
        #20
        validity=3'b100; read1=1; read2=2; write=3; data=65;
        #20
        validity=3'b010; read1=2; read2=3;
        #20
        validity=3'b111; read1=3; write=5; read2=3;
        #200
        validity=3'b101; read1=1; read2=2; write=4;
        #200
        validity=3'b111; read1=4; write=4; read2=9;
        #200
        validity=3'b110; read1=5; read2=4; write=6;
        #200
        validity=3'b001; read1=6;
        #20
        $finish;
    end
endmodule