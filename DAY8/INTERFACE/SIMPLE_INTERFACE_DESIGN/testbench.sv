// interface - simple interface using interface in design
// testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  intf intff();			// initialize interface
  test tst(intff);		// passing arguments test (test handle)
  
  // instantation with interface to dut
  shift_reg R_shift(intff);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule