// modport with task
// testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  parameter WIDTH = 8; 

  intf #(8)intff();			// interface initialize - for ports
  test tst(intff.tb);		// passing modport tb as arguments for test
  
  // instantation
  converter #(.WIDTH(WIDTH)) inst(intff.dut);		// passing modport dut as arguments
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    #100;
    $finish;
  end
endmodule