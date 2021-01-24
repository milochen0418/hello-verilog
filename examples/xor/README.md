
# XOR example

# Compile
$ iverilog -o ./out/my_xor ./my_xor.v ./testbench.v  

## Execute 
$ ./out/my_xor 
It will show information and generate the dump.vcd 

## Simulate  
Use GTKwave to open the file in ./out/dump.vcd   
And the result will be as the following  
![GTKwave result]
(https://github.com/milochen0418/hello-verilog/raw/master/examples/xor/result.png)