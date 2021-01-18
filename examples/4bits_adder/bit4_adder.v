`timescale 1ns / 1ns

module bit4_adder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] S,
    output Cout
    );

  wire C1,C2,C3;

  half_adder ha0(A[0], B[0], C1, S[0]);
  full_adder fa1(A[1], B[1], C1, C2,   S[1]);
  full_adder fa2(A[2], B[2], C2, C3,   S[2]);
  full_adder fa3(A[3], B[3], C3, Cout, S[3]);

endmodule

