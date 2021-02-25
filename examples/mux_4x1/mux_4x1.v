`timescale 1ns/1ns

module mux_4x1 (i3, i2, i1, i0, s1, s0, o0)
  input i3, i2 ,i1 ,i0, s1 ,s0;
  output o0;

  //Purpose 
  //(s1, s0) == (0,0) -> select i0 as o0 
  //(s1, s0) == (0,1) -> select i1 as o0 
  //(s1, s0) == (1,0) -> select i2 as o0
  //(s1, s0) == (1,1) -> select i3 as o0
  
  bufif0 ( line01, i0, s0); //buffer from i0 to line01 if s0 == 0
  bufif1 ( line01 ,i1, s0); //buffer from i1 to line01 if s0 == 1 
  bufif0 ( line32, i2, s0); //buffer from i2 to line32 if s0 == 0
  bufif1 ( line32, i3, s0); //buffer from i3 to line32 if s0 == 1

  bufif0 ( o0, line01, s1); //buffer from line01 to o0 if s1 == 0 
  bufif1 ( o0, line32, s1); //buffer from line32 to o0 if s1 == 1  
  
endmodule
