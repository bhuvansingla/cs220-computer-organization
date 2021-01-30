`include "./A2Q1_decoder3to8.v"
`include "./A2Q1_encoder8to3.v"

module top;

reg [2:0] in;
wire [7:0] decodedOut;
wire [2:0] encodedOut;

decoder3to8 DECODER(in, decodedOut);
encoder8to3 ENCODER(decodedOut, encodedOut);

always @(in or decodedOut or encodedOut) begin
    $display("Input: %b | Decoded: %b | Encoded: %b", in, decodedOut, encodedOut);
end

initial begin
    $display("Format: Input: X2X1X0 | Decoded: Y7Y6Y5Y4Y3Y2Y1Y0 | Encoded: X2X1X0\n");
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