`timescale 1ns / 1ns

module full_adder(
    input A,
    input B,
    input Cin,
    output Cout,
    output S
    );

  wire P,G,H;
  half_adder  ha1(A,B,G,P);
  half_adder  ha2(P,Cin,H,S);
  or #2 (Cout,G,H);
endmodule
