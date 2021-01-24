
# XOR example

## Compile
$ iverilog -o ./out/my_xor ./my_xor.v ./testbench.v  

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