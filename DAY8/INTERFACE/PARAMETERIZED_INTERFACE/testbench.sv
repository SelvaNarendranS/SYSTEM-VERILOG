// parameterized interface
// testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  intf #(8) intff();	// initialize  parameter interface
  test tst(intff);		// passing arguments test (test handle)
  
  // instantation with interface to dut
  power dut(intff);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule