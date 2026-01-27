// multiple modport 
// testbench
`include "interface.sv"
`include "test.sv"

module testbench;
  parameter WIDTH = 16; 

  intf #(WIDTH)intff();			// interface initialize - for ports
  test tst(intff.tb);		// passing modport tb as arguments for test
  
  // instantation
  calculate dut1(intff.cal);		// passing modport cal as arguments
  root dut2(intff.rt);				// passing modport rt as arguments
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    #100;
    $finish;
  end
endmodule