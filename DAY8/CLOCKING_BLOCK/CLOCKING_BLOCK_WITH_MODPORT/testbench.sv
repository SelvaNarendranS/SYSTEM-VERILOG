// clocking block with modport
// testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  intf #(32) intff();	// initialize  parameter interface
  test tst(intff.tb);		// passing arguments test (test handle)
  
  // instantation with interface to dut
  sum_of_unit_scaled_digits inst(intff.dut);
  
  // clock generation
  initial begin
    intff.clk = 0;
    forever #5 intff.clk = ~intff.clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    #70;
    $finish;
  end
  
endmodule