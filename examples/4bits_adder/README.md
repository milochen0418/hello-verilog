# 4 Bits Adder Example 
## Design
### Half Adder 
AND Gate + XOR Gate   
**half_adder.v**
```Verilog
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
```
### Full Adder 
Half Adder + Half Adder + OR Gate = Full Adder   
As the following picture.  
![Half Adder and Full Adder](https://github.com/milochen0418/hello-verilog/raw/master/examples/4bits_adder/blueprint_full_adder.png)  
**full_adder.v**
```Verilog
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
```
### 4Bits Adder 
Half Adder +  3 * Full Adder  = 4 Bits Adder   
Asthe following picture.  

![4 Bits Adder](https://github.com/milochen0418/hello-verilog/raw/master/examples/4bits_adder/blueprint_4bits_adder.png)    
**bit4_adder.v**
```Verilog
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
```
## Compile
$ iverilog -o ./out/bit4_adder ./half_adder.v ./full_adder.v ./bit4_adder.v ./testbench.v    
**testbench.v**
```Verilog
`timescale 1ns/1ns

module bit4_adderTB();
  reg [3:0] A;
  reg [3:0] B;
  wire [4:0] C;
  
  bit4_adder FBA(
    .A(A),
    .B(B),
    .Cout(C[4]),
    .S(C[3:0])
    );
  
  initial begin 
    $display("Hello, This is bit4_adder");
    $dumpfile("./out/dump.vcd"); 
    $display("$dumpvars(1,bit4_adderTB);");
    $dumpvars(1,bit4_adderTB);  
    #2  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    A=4'd3; B=4'd4;
    #5  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    A=4'd0; B=4'd5;
    #5  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    A=4'd9; B=4'd2;
    #5  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    A=4'd10; B=4'd10;
    #5  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    A=4'd15; B=4'd15;
    #5  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    #1  $finish;
  end
endmodule
```

## Execute 
$ ./out/bit4_adder  
It will show information    
<pre>
Hello, This is bit4_adder
$dumpvars(1,bit4_adderTB);
VCD info: dumpfile ./out/dump.vcd opened for output.
A =  x, B =  x, FBA =  x
A =  3, B =  4, FBA =  7
A =  0, B =  5, FBA =  5
A =  9, B =  2, FBA = 11
A = 10, B = 10, FBA = 20
A = 15, B = 15, FBA = 30
</pre>
and generate the ./out/dump.vcd.   

## Simulate  
Use GTKwave to open the file in ./out/dump.vcd   
And the result will be as the following   
![GTKwave result](https://github.com/milochen0418/hello-verilog/raw/master/examples/4bits_adder/result.png)  

## One command to rebuild and re-simulate 
$ iverilog -o ./out/bit4_adder ./half_adder.v ./full_adder.v ./bit4_adder.v ./testbench.v && ./out/bit4_adder && open ./out/dump.vcd  
or call script  
$ ./rebuildrun.sh  
