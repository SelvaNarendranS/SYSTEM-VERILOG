// clocking block with modport
// interface
interface intf #(parameter WIDTH = 3);		// parameterized interface
  logic 				clk;
  logic 				rst;
  logic [WIDTH - 1:0] 	a;		// used parameter type
  logic [WIDTH - 1:0] 	z;
  
  // clocking block
  clocking cb @(negedge clk);		// cllocking block for driving input to dut
    input #2 z;			// reads the input z from testbench before 2ns of the present negedge clk
    output #3 a, rst;	// sends the output a, rst from testbench after 3ns of the present negedge clk
  endclocking
  
  // modport
  modport tb(input z, rst, a, clocking cb);				// modport for testbenct
    modport dut(input clk, rst, a, output z);		// modpirt for design
    
endinterface