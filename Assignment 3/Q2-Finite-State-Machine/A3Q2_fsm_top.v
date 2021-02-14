`include "./A3Q2_fsm.v"

module top;
    reg clk,in;
    wire op;
    fsm FSM(clk,in,op);

    always @(posedge clk) begin
        $display("Time=%2d,Input=%b,Alternating=%b",$time,in,op);
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
        in=1;
        #10
        in=0;
        #10
        in=1;
        #10
        in=0;
        #10
        in=0;
        #10
        in=1;
        #10
        in=1;
        #10
        in=0;       
        #10 
        in=1;
        #10
        in=0;
    end

endmodule