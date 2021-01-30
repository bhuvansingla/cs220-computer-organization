`include "./A2Q2_priority_encoder8to3.v"

module top;

reg [7:0] in;
wire [2:0] encodedOut;

priority_encoder8to3 ENCODER(in, encodedOut);

always @(in or encodedOut) begin
    $display("Time = %d | Input: %b | Encoded: %b", $time, in, encodedOut);
end

initial begin
    $display("Format: Input: Y7Y6Y5Y4Y3Y2Y1Y0 | Encoded: X2X1X0\n");
    in = 8'b00010000;
    #1
    $display("\n");
    in = 8'b01000100;
    #1
    $display("\n");
    in = 8'b11110000;
    #1
    $display("\n");
    in = 8'b00010001;
    #1
    $display("\n");
    in = 8'b11111111;
    #1
    $display("\n");
    in = 8'b00011000;
    #1
    $display("\n");
    in = 8'b00000110;
    #1
    $display("\n");
    in = 8'b01010100;
    #1
    $display("\n");
    in = 8'b00011101;
    #1
    $display("\n");
    in = 8'b00100000;
    #1
    $display("\n");
end

endmodule