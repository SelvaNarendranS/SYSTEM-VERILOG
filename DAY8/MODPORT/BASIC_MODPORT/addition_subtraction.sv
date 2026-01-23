// modport - Basic modport
// Design

module math(
  input [7:0]a, b, c,
  output [8:0]sum, subtract);
  
  assign sum 	  = a + b + c;			// addition
  assign subtract = sum - c;			// subtraction
endmodule