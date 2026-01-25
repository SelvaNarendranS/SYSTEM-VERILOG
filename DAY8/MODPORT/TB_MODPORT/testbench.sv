// modport - testbench modport
// testbench 
`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff();				// interface initialize - for ports
  test tst(intff.tb);		// test handle and passing interface.modport
  
  // instantation
  sr_ff inst(.intff(intff.dut));		// passing interface.modport as arguments
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    #100;
    $finish;
  end
endmodule