// clocking block - with default skew
// interface

interface intf;
  logic clk;
  logic rst;
  logic t;
  logic q;
  logic q_bar;
  
  // clocking block - test bench
  clocking cb @(posedge clk); 
    default input #1 output #1;		// default skew 
    input q, q_bar;		// samples from dut -- slightly before the edge (input skew)
    output t;		// drives to dut  -- slightly after the edge 
    output #2 rst;	// can also allocate seprate skew from default
  endclocking
  
  // drives tb(output) - dut(input) at posedge of clk after a defined skew(1ns) 
  
  // samples tb(input) - dut(output) at before a defined skew(1ns) of posedge of clk and result at the end of posedge clk --(sample done - 1 cycle after the drive)
  
endinterface