// clocking block - with clocking block
// testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff();		// instance interface for ports
  test tst(intff);	// passing interface to test as arguments
  
  // instantation
  dff dut(.clk(intff.clk),
          .rst(intff.rst),
          .d(intff.d),
          .q(intff.q),
          .q_bar(intff.q_bar));
  
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