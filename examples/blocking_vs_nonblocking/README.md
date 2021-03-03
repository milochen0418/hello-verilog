
# Blocking vs nonblocking
## Design


**dummy.v**
```Verilog
`timescale 1ns/1ns

module dummy();
endmodule
```
## Compile
$ iverilog -o ./out/test ./dummy.v ./testbench.v  
**testbench.v**
```Verilog
`timescale 1ns/1ns

module concurrent();
  reg [7:0] x;
  reg [7:0] y;
  reg [7:0] z;
  reg CLK;
  
  initial begin 
    CLK=0;
    x=10;
    y=10;
    z=10;
    $dumpfile("./out/dump.vcd"); 
    $dumpvars(1,concurrent);  
    #100  $finish;
  end
  
  always #5 CLK = ~CLK;
  
  always @ (posedge CLK) begin
    x<=25;   // 0x19
    y<=x+13; // 0x26
    z<=x*y;  // 0xB6
  end
  
endmodule
```

## Execute 
$ ./out/test
It will show information    
<pre>
VCD info: dumpfile ./out/dump.vcd opened for output.
</pre>
and generate the ./out/dump.vcd.   

## Simulate  
Use GTKwave to open the file in ./out/dump.vcd   
And the result will be as the following  
![GTKwave result](https://github.com/milochen0418/hello-verilog/raw/master/examples/blocking_vs_nonblocking/result.png)
