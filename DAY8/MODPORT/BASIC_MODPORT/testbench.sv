// modport - Basic modport
// testbench 
`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff();		// interface initialize - for ports
  test tst(intff.tb);	// test handle and passing interface.modport as arguments
  
  // instantation
  math dut(
    .a(intff.a),
    .b(intff.b),
    .c(intff.c),
    .sum(intff.sum),
    .subtract(intff.subtract)
  );
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule