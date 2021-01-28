
# XOR example
## Design

![XOR design](https://github.com/milochen0418/hello-verilog/raw/master/examples/xor/xor.png)


**my_xor.v**
```Verilog
`timescale 1ns/1ns

module my_xor( output myout, input inA, input inB);
  wire x, y, not_inA, not_inB;
  and(x,inA,not_inB);
  and(y,not_inA, inB);
  not(not_inA,inA);
  not(not_inB,inB);
  or(myout,x,y);
endmodule
```
## Compile
$ iverilog -o ./out/my_xor ./my_xor.v ./testbench.v  
**testbench.v**
```Verilog
`timescale 1ns/1ns

module my_xor_TB();
  reg a,b;
  wire a_xor_b;
  my_xor XOR1(a_xor_b,a,b);

  initial begin
    $display("Hello, This is my_xor");
    $dumpfile("./out/dump.vcd"); 
    $display("$dumpvars(1,my_xor_TB);");
    $dumpvars(1,my_xor_TB);
    a=0;
    b=0;
    #10
    $display("a = %d, b = %d, xor = %d",a,b,a_xor_b);
    a=0;
    b=1;
    #10
    $display("a = %d, b = %d, xor = %d",a,b,a_xor_b);
    a=1;
    b=1;
    #10
    $display("a = %d, b = %d, xor = %d",a,b,a_xor_b);
    a=1;
    b=0;
    #10
    $display("a = %d, b = %d, xor = %d",a,b,a_xor_b);
    $finish;
  end
endmodule  
```

## Execute 
$ ./out/my_xor     
It will show information    
<pre>
Hello, This is my_xor  
$dumpvars(1,my_xor_TB);  
VCD info: dumpfile ./out/dump.vcd opened for output.  
a = 0, b = 0, xor = 0  
a = 0, b = 1, xor = 1  
a = 1, b = 1, xor = 0  
a = 1, b = 0, xor = 1  
</pre>
and generate the ./out/dump.vcd.   

## Simulate  
Use GTKwave to open the file in ./out/dump.vcd   
And the result will be as the following  
![GTKwave result](https://github.com/milochen0418/hello-verilog/raw/master/examples/xor/result.png)
