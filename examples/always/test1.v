`timescale 1ns/1ns
module test1(in, out);  
    input in;  
    output out;  
    reg out;  
    always@(in)  
        out = ~ in;  
endmodule  