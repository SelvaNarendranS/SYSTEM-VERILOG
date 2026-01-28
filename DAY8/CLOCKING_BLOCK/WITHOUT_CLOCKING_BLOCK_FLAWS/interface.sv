// clocking block - Race condition(without clocking block)
// interface

interface intf;
  logic clk;
  logic rst;
  logic d;
  logic q;
  logic q_bar;
  
  // without clocking block
  // without clocking block output(rst, d) drives to dut from test and input(q, q_bar) is sampled from the dut to test are takes place at same time -- so race condition may occurs
  
endinterface