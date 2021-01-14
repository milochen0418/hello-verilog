# Hello Verilog

## Environment Setup  
$ brew install icarus-verilog  
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
