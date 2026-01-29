// clocking block - with clocking block
// interface

interface intf;
  logic clk;
  logic rst;
  logic d;
  logic q;
  logic q_bar;
  
  // clocking block - test bench -- (individual input and output skew)
  clocking cb @(posedge clk);  
    input q, q_bar;		// samples from dut -- slightly before the edge (input skew)
    output rst, d;		// drives to dut  -- slightly after the edge 
  endclocking
  // using clocking block output(rst, d) drives to dut from test at posedge of the clk and exactly after 1 clk cycle input(q, q_bar) is sampled from the dut to test
  
  // here no delays are applied so default skew is automatically applied
  
endinterface