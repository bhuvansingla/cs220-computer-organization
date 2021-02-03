`include "./A2Q1_decoder3to8.v"
`include "./A2Q1_encoder8to3.v"

module top;

reg [2:0] in;
wire [7:0] decodedOut;
wire [2:0] encodedOut;

decoder3to8 DECODER(in, decodedOut);
encoder8to3 ENCODER(decodedOut, encodedOut);

always @(in or encodedOut) begin
    $display("Time : %d | Decoder Input: %b | Encoder Output: %b", $time, in, encodedOut);
end

initial begin
    in = 3'b000;
    #1
    $display("\n");
    in = 3'b001;
    #1
    $display("\n");
    in = 3'b010;
    #1
    $display("\n");
    in = 3'b011;
    #1
    $display("\n");
    in = 3'b100;
    #1
    $display("\n");
    in = 3'b101;
    #1
    $display("\n");
    in = 3'b110;
    #1
    $display("\n");
    in = 3'b111;
    #1
    $display("\n");
end

endmodule