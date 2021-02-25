`timescale 1ns/1ns

module wand_wor (a, b, c, d, e); 
  input a, b;
  output c, d, e;
  wire not_a;
  wand d;
  wor e;
  
  assign not_a = ~a;
  assign c = not_a & b; // c =  NOT(a) AND b

  //wired and
  assign d = a; 
  assign d = b;

  //wired or
  assign e = a;
  assign e = b;

endmodule

