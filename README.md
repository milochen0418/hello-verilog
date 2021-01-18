# Hello Verilog  
## Purpose
Verilog is one of most popular HDL (Hardware Description Language) in the world for IC designer.  The purpose of this project is teach you how to use your Mac OS X and VSCode to develope Verilog.  If you are a software developer, this project is good for your to get started.  

### HDL (Hardware Description Langague)
The function of half adder is add two bit.  together. For the half adder design, you will have  
(1) Input: A, B   
(2) Output: S (Sum) + C (Carry)    
![Half Adder](https://raw.githubusercontent.com/milochen0418/hello-verilog/master/half_adder.png)   

So we can use logic gates to implement half adder. And the HDL is a langauge to describe what circuit it is. The abvoe picture show the two popular HDL to describe half adder.  
![HDL](https://raw.githubusercontent.com/milochen0418/hello-verilog/master/HDL.png)  
Verilog is more like C programming language style and VHDL is more like Ada programming language style. In this hello project, I decide to use Verilog.  
## Environment Setup  
$ **brew install icarus-verilog**  
If you don't have brew, then do the following command to install HomeBrew to have it.  
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  

## Edit by VSCode 
At the first, install VSCode extension Verilog-HDL/SystemVerilog... made by mshr-h   
Then you can see correct color in VSCode. 
$ code hello.v  
<pre><code>
module main;
  initial 
    begin
      $display("Hello, World");
      $finish ;
    end
endmodule
</code></pre>
## Compile
$ iverilog -o ./out/hello hello.v  

## Execuite
$ vvp ./out/hello  
Hello, World  

## Edit more files
$ code Simple_Circuit.v  
<pre><code>
module	Simple_Circuit(A, B, C, D, E);  
    output D, E;  
    input  A, B, C;  
    wire   w1;
    and    G1(w1, A, B);
    not    G2(E, C);
    or     G3(D, w1, E);
endmodule
</code></pre>

$ code t_Simple_Circuit.v  
<pre><code>
module	t_Simple_Circuit;
  wire	D, E;
  reg		A, B, C;
	
  //instantiate device under test
  Simple_Circuit	M1(A, B, C, D, E);
	
  //apply inputs one at a time
  initial	begin
    $dumpfile("./out/mytest.vcd");
    $dumpvars;
    A=1'b0; B=1'b0; C=1'b0;
    #100 A=1'b1; B=1'b1; C=1'b1; 
  end
  
  initial #200 $finish;
endmodule
</code></pre>
## Compile Circuit  
$ iverilog -o ./out/mycircuit t_Simple_Circuit.v Simple_Circuit.v  
## Execute Circuit to generate .vcd file for GTKWave  
$ vvp ./out/mycircuit  

## Install GTKWave by HomeBrew
$ brew install gtkwave  

## Use GTKWave to open .vcd file  
1. Open GTKWave from your Mac Desktop GUI  
2. In the GTKWave application, TopMenu -> File -> Open New Tab -> (Choice your ./out/mytest.vcd)  
3. Then you can see something has been import and you can click it.  

## GUI Result for GTKWave to open ./out/mytest.vcd file  
![VCD Result](https://raw.githubusercontent.com/milochen0418/hello-verilog/master/result.png)  

BTW, when I create this project, I refer   
https://www.twblogs.net/a/5d21a78bbd9eee1e5c83bd9b   
https://www.edaplayground.com/  
https://blog.fkynjyq.com/write-verilog-with-vscode   
https://formulae.brew.sh/formula/icarus-verilog  
https://www.easonchang.com/2016/03/18/verilog-on-macosx/  
https://ithelp.ithome.com.tw/articles/10196424  

