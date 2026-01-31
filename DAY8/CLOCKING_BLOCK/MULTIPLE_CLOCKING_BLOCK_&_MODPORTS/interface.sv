// multiple clocking block with modports
// interface

interface intf #(parameter WIDTH = 8);
  logic 			clk;
  logic 			rst_n;		// active low reset
  logic 			en;
  logic [WIDTH-1:0] system_clk;
  logic [WIDTH-1:0] baud_rate;
  logic [WIDTH-1:0] required_clk;
  logic			 	clk_tick;
  logic			 	baud_tick;
  logic [WIDTH-1:0] clk_cycle;
  logic [WIDTH-1:0] baud_cycle;
  
  // clocking block
  // clocking block for driving stimulus to dut
  clocking drive @(negedge clk);		// individual skew
    input #1 clk_tick, clk_cycle, baud_tick, baud_cycle;
    output #2 clk, rst_n, en, system_clk, required_clk, baud_rate;
  endclocking
  
  // clocking block for sample output from dut
  clocking sample @(posedge clk);		// individual skew
    input #3 clk_tick, clk_cycle, baud_tick, baud_cycle, clk, rst_n, en, system_clk, required_clk, baud_rate;
  endclocking
    
  
  // multiple modports 
  modport clk_div(input clk, rst_n, en, system_clk, required_clk, output clk_tick, clk_cycle); // design - clock divider
  
  modport baud(input clk, rst_n, en, system_clk, baud_rate, output baud_tick, baud_cycle); // design - baud generator
  
  modport tb(
    clocking drive,   // allows access to drive through clocking block
    clocking sample,  // allows access to sample through clocking block 
      input baud_tick, baud_cycle, clk_tick, clk_cycle 
    );	// testbench
  
endinterface