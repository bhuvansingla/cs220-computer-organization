`include "./A7Q2_onebit_addersub.v"

module eightbit(a,b,opcode,sum,cout);
    input [7:0] a,b;
    input opcode;
    output [7:0] sum;
    output cout;
    wire cout;
    wire signed [7:0] sum;
    wire [6:0] intermediate_carry;
    onebit A0(a[0],b[0],opcode,opcode,sum[0],intermediate_carry[0]);
    onebit A1(a[1],b[1],intermediate_carry[0],opcode,sum[1],intermediate_carry[1]);
    onebit A2(a[2],b[2],intermediate_carry[1],opcode,sum[2],intermediate_carry[2]);
    onebit A3(a[3],b[3],intermediate_carry[2],opcode,sum[3],intermediate_carry[3]);
    onebit A4(a[4],b[4],intermediate_carry[3],opcode,sum[4],intermediate_carry[4]);
    onebit A5(a[5],b[5],intermediate_carry[4],opcode,sum[5],intermediate_carry[5]);
    onebit A6(a[6],b[6],intermediate_carry[5],opcode,sum[6],intermediate_carry[6]);
    onebit A7(a[7],b[7],intermediate_carry[6],opcode,sum[7],cout);
endmodule