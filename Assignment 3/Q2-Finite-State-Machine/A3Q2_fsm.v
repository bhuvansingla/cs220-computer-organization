`define TICK #1

module fsm(clk,in,op);

    input clk,in;
    output wire op;
    reg a=0;
    reg b=0;

    always @(posedge clk) begin
        b <= `TICK (~in|a);
        a <= `TICK (in|b);
    end

    assign op = (~b&~in)|(~a&in);

endmodule