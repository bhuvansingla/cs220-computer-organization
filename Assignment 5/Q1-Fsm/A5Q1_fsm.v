module implement(in,curr,clk);
	input [1:0] in;//2 bit input
	input clk;//clock
	
	output reg [3:0] curr=4'b0;//current state

	reg [2:0] microcode_rom [12:0];//13 states
	
	wire [3:0] micro_instruction;//4 bit microinstruction
	
	reg [3:0] dispatch_rom_1 [3:0];
	reg [3:0] dispatch_rom_2 [3:0];
	reg [3:0] dispatch_rom_3,dispatch_rom_4;
	
	initial begin
		microcode_rom[0]=0;
		microcode_rom[1]=0;
		microcode_rom[2]=0;
		microcode_rom[3]=1;
		microcode_rom[4]=3;
		microcode_rom[5]=3;
		microcode_rom[6]=3;
		microcode_rom[7]=0;
		microcode_rom[8]=0;
		microcode_rom[9]=0;
		microcode_rom[10]=2;
		microcode_rom[11]=4;
		microcode_rom[12]=4;
		dispatch_rom_1[0]=4;
		dispatch_rom_1[1]=5;
		dispatch_rom_1[2]=6;
		dispatch_rom_1[3]=6;
		dispatch_rom_2[0]=11;
		dispatch_rom_2[1]=12;
		dispatch_rom_2[2]=12;
		dispatch_rom_2[3]=12;
		dispatch_rom_3=7;
		dispatch_rom_4=0;
	end
	
	assign micro_instruction=microcode_rom[curr];
	always @(posedge clk) begin
		if (micro_instruction==0) begin
			curr<=#2 curr+1;
		end
		else if (micro_instruction==1) begin
			curr<=#2 dispatch_rom_1[in];
		end
		else if (micro_instruction==2) begin
			curr<=#2 dispatch_rom_2[in];
		end
		else if (micro_instruction==3) begin
			curr<=#2 dispatch_rom_3;
		end
		else begin
			curr<=#2 dispatch_rom_4;
		end
	end
endmodule