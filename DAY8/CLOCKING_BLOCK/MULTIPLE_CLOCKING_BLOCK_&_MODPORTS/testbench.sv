// multiple clocking block with modports
// testbench
`timescale 1ns/1ps
`include "interface.sv"
`include "test.sv"

module testbench;
  parameter WIDTH = 64; 

  intf #(WIDTH)intff();			// interface initialize - for ports
  test tst(intff.tb);		// passing modport tb as arguments for test
  
  // instantation
  clock_divider dut1(intff.clk_div);		// passing modport clk_div as arguments
  baud_generator dut2(intff.baud);				// passing modport baud as arguments
  
  // clock generation
  initial begin
    intff.clk = 0;
    forever #5 intff.clk = ~intff.clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    #100000;
    $finish;
  end
endmodule