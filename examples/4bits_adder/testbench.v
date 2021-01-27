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
    #2  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    A=4'd3; B=4'd4;
    #5  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    A=4'd0; B=4'd5;
    #5  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    A=4'd9; B=4'd2;
    #5  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    A=4'd10; B=4'd10;
    #5  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    A=4'd15; B=4'd15;
    #5  $display("A = %d, B = %d, FBA = %d", A, B, C[4:0]);
    #1  $finish;
  end
endmodule






