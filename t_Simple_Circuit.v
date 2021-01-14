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