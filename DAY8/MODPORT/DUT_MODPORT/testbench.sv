// modport - dut modport
// testbench 
`include "interface.sv"
`include "test.sv"

module testbench;
  logic	clk, rst_n, j, k;
  logic q, q_bar;
  
  intf intff();			// interface initialize - for ports
  test tst(intff);		// test handle and passing interface
  
  // instantation
  jk_ff inst(intff.dut);		// passing interface.modport as arguments
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    #100;
    $finish;
  end
endmodule