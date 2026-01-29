// clocking block - individual skew
// testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  intf intff();			// initialize interface
  test tst(intff);		// passing arguments test (test handle)
  
  // instantation with interface
  xor_gate xor_g(.clk(intff.clk), .a(intff.a), .b(intff.b), .z(intff.z));
  
   // clock generation
  initial begin
    intff.clk = 0;
    forever #5 intff.clk = ~intff.clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    #100;
    $finish;
  end
  
endmodule