#!/bin/bash  
iverilog -o ./out/bit4_adder ./half_adder.v ./full_adder.v ./bit4_adder.v ./testbench.v  && ./out/bit4_adder && open ./out/dump.vcd