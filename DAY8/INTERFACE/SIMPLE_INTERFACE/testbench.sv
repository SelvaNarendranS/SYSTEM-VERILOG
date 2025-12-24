// interface - simple interface
// testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  intf intff();			// initialize interface
  test tst(intff);		// passing arguments test (test handle)
  
  // instantation with interface
  xnor_gate xnor_g(.a(intff.a), .b(intff.b), .z(intff.z));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule