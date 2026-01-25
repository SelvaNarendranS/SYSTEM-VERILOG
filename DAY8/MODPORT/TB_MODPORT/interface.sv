// modport - testbench modport
// Interface
interface intf;
  logic	clk;
  logic rst_n;
  logic s;
  logic r;
  logic q;
  logic q_bar;
  
  // modport
  modport dut(input clk, rst_n, s, r, output q, q_bar); // modport for design
  modport tb(output clk, rst_n, s, r, input q, q_bar); // modport for testbench
  
endinterface