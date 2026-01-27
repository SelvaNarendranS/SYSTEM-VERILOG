// multiple modport
// interface

interface intf #(parameter WIDTH = 8);
  logic 			en;
  logic [WIDTH-1:0] a;
  logic [WIDTH-1:0] b;
  logic [WIDTH-1:0] multiply;
  logic [WIDTH-1:0] divide;
  logic [WIDTH-1:0] power;
  logic [WIDTH-1:0] square;
    
  // multiple modports 
  modport cal(input en, a, b, output multiply, divide);	 // design - calculate
  modport rt(input en, a, b, output power, square);	 // design - root
  modport tb(output en, a, b, input multiply, divide, power, square);	// testbench
  
endinterface