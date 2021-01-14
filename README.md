# Hello Verilog

## Environment Setup  
$ brew install icarus-verilog  
If you don't have brew, then do the following command to install HomeBrew to have it.  
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  

## Edit by VSCode 
At the first, install VSCode extension Verilog-HDL/SystemVerilog... made by mshr-h   
Then you can see correct color in VSCode. 
## Compile
$ iverilog -o ./out/hello hello.v

## Execuite
$ vvp ./out/hello