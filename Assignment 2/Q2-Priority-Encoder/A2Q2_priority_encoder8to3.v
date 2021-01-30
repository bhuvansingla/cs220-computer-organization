module priority_encoder8to3(in, out);

input [7:0] in;
output wire [2:0] out;

assign out = in[0] ? 3'b000 :
             in[1] ? 3'b001 :
             in[2] ? 3'b010 :
             in[3] ? 3'b011 :
             in[4] ? 3'b100 :
             in[5] ? 3'b101 :
             in[6] ? 3'b110 : 
                     3'b111;

endmodule