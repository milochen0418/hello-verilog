# 4 Bits Adder Example 
## Design
### Half Adder 
AND Gate + XOR Gate   

### Full Adder 
Half Adder + Half Adder + OR Gate = Full Adder   
As the following picture.  
![Half Adder and Full Adder](https://github.com/milochen0418/hello-verilog/raw/master/examples/4bits_adder/blueprint_full_adder.png)

### 4Bits Adder 
Half Adder +  3 * Full Adder  = 4 Bits Adder   
Asthe following picture.  

![4 Bits Adder](https://github.com/milochen0418/hello-verilog/raw/master/examples/4bits_adder/blueprint_4bits_adder.png)  

## Compile
$ iverilog -o ./out/bit4_adder ./half_adder.v ./full_adder.v ./bit4_adder.v ./testbench.v  


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
