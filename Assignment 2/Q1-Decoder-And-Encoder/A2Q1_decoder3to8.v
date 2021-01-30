module decoder3to8(in, out);

input [2:0] in;
output wire [7:0] out;

assign out[0] = ~in[2] & ~in[1] & ~in[0];
assign out[1] = ~in[2] & ~in[1] & in[0];
assign out[2] = ~in[2] & in[1] & ~in[0];
assign out[3] = ~in[2] & in[1] & in[0];
assign out[4] = in[2] & ~in[1] & ~in[0];
assign out[5] = in[2] & ~in[1] & in[0];
assign out[6] = in[2] & in[1] & ~in[0];
assign out[7] = in[2] & in[1] & in[0];

endmodule