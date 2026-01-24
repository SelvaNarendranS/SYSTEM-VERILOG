// modport - dut modport
// Interface
interface intf;
  logic	clk;
  logic rst_n;
  logic j;
  logic k;
  logic q;
  logic q_bar;
  
  // modport
  modport dut(input clk, rst_n, j, k, output q, q_bar); // modport for design
  
endinterface