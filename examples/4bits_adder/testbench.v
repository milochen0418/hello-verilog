`timescale 1ns/1ns

module bit4_adderTB();
  reg [3:0] A;
  reg [3:0] B;
  wire [4:0] C;
  
  bit4_adder FBA(
    .A(A),
    .B(B),
    .Cout(C[4]),
    .S(C[3:0])
    );
  
  initial begin 
    $display("Hello, This is bit4_adder");
    $dumpfile("./out/dump.vcd"); 
    $display("$dumpvars(1,bit4_adderTB);");
    $dumpvars(1,bit4_adderTB);  
    #100  A=4'd3; B=4'd4;
    #100  A=4'd0; B=4'd5;
    #100  A=4'd9; B=4'd2;
    #100  A=4'd10; B=4'd10;
    #100  A=4'd15; B=4'd15;
    #100  $finish;
  end
endmodule






