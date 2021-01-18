`timescale 1ns / 1ns
module half_adder(
    input A,
    input B,
    output Cout,
    output S
    );

  xor (S,A,B);
  and (Cout,A,B);
endmodule


