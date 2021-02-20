`timescale 1ns/1ns
module ripple_carry_counter_TB;

reg clk; 
reg reset;
wire [3:0] q;

reipple_carry_counter r1(q, clk, reset);
initial
  clk = 1'b0; 
always 
  #5 clk = ~clk;

initial 
begin
    reset = 1'b1;
    #15 reset = 1'b0;
    #180 reset = 1'b1;
    #10 reset = 1'b0;
    #20 $finish;
end

initial 
  $monitor($time, " Outpu q = %q", q);
endmodule