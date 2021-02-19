`include "./A4Q2_one_bit_adder_sub.v"

module fivebit(a,b,opcode,sum,cout,overflow);

    input [4:0] a;
    input [1:0] b;
    input opcode;
    output [4:0] sum;
    output cout,overflow;
    wire cout,overflow;
    wire signed [4:0] sum;
    wire [3:0] intermediate_carry;
    onebit A0(a[0],b[0],opcode,opcode,sum[0],intermediate_carry[0]);
    onebit A1(a[1],b[1],intermediate_carry[0],opcode,sum[1],intermediate_carry[1]);
    onebit A2(a[2], 1'b0,intermediate_carry[1],opcode,sum[2],intermediate_carry[2]);
    onebit A3(a[3],1'b0,intermediate_carry[2],opcode,sum[3],intermediate_carry[3]);
    onebit A7(a[4],1'b0,intermediate_carry[3],opcode,sum[4],cout);
    assign overflow=intermediate_carry[3]^cout;
endmodule