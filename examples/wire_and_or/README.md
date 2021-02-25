# truth table for wired AND and wired OR


## Define

|   sign        | meaning       |
| ------------- | ------------- |
|    0          | logic false 假  |
|    1          | logic true  真  |
|    x          | floating    浮接  |
|    z          | high impedance 高阻抗 |
|   |   |

## Wired AND
| wand  | 0 | 1 | x | z |
| ------------- | ------------- | ------------- | ------------- | ------------- | 
|     **0**         |      0        |        0      |     0         |      0        | 
|     **1**         |      0        |        1      |     x         |      1        | 
|     **x**         |      0        |        x      |     x         |      x        | 
|     **z**         |      0        |        1      |     x         |      z        | 



## Wired OR
| wand  | 0 | 1 | x | z |
| ------------- | ------------- | ------------- | ------------- | ------------- | 
|     **0**         |      0        |        1      |     x         |      0        | 
|     **1**         |      1        |        1      |     1         |      1        | 
|     **x**         |      x        |        1      |     x         |      x        | 
|     **z**         |      0        |        1      |     x         |      z        | 

## Source code  
```Verilog
`timescale 1ns/1ns

module wand_wor (a, b, c, d, e); 
  input a, b;
  output c, d, e;
  wire not_a;
  wand d;
  wor e;
  
  assign not_a = ~a;
  assign c = not_a & b; 
  // c =  NOT(a) AND b

  //wired and
  assign d = a; 
  assign d = b;
  // d = a AND b 

  //wired or
  assign e = a;
  assign e = b;
  // e = a OR b 
endmodule
```

