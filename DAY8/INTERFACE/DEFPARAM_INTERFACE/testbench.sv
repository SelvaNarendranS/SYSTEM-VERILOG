// defparam with Interface
// testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  intf #(longint, 3) intff();	// initialize  parameter interface
  test tst(intff);		// passing arguments test (test handle)
  
  // instantation with interface to dut
  sum_of_digits dut(intff);
  
  // override using defparam
  defparam intff.WIDTH = 128;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule