`include "./A5Q1_fsm.v"


module top;
	wire [3:0] curr;
	reg [1:0] in;
	reg clk;


	implement FSM (in,curr,clk);

	always @(posedge clk) begin
		$display("time=%2d-->Output=%d\n",$time,curr);
	end
	initial begin
		#100
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
		in=2'b00; 
		#10
		$display("\n");  
		in=2'b01;
		#10
		$display("\n"); 
		in=2'b10;
		#10
		$display("\n"); 
		in=2'b11;
		#10
		$display("\n"); 
		in=2'b00;
		#10
		$display("\n");
		in=2'b01;
		#10
		$display("\n");
		in=2'b10;
		#10
		$display("\n");
		in=2'b11;
		#10
		$display("\n");
		in=2'b01;
		#10
		$display("\n"); 
	end
	
endmodule