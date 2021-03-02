module vector(I0, I1, O0, O1, O2, O3);
  input  [3:0] I0;  //4 bits input
  input  [4:0] I1;  //5 bits input
  output [2:0] O0;  //3 bits output
  output [4:0] O1;  //5 bits output
  output [2:0] O2;  //3 bits output
  output [4:0] O3;  //5 bits output

  assign O0 = I0; //I0[3] ignore 
  assign O1 = I0; //O1[4] be zero
  assign O2 = I1[3:1]; //assign I1[3:1] to O2[2:0]
  assign O3 = {I0[2:0],I1[3:2]}; // assign I0[2:0] -> O3[4:2] & I1[3:2] -> O3[1:0]
endmodule
