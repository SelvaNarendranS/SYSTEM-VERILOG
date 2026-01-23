// modport - Basic modport
// Interface
interface intf;
  logic	[7:0]a;
  logic [7:0]b;
  logic [7:0]c;
  logic [8:0]sum;
  logic [8:0]subtract;
  
  // modport
  modport tb(input sum, input subtract, output a, output b, output c); // modport for testbench
endinterface