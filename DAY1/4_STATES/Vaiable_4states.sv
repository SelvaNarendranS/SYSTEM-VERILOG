// 4 states
module vaiable_4states;
  wire    a;		// >=1 bit unsigned
  reg     b;		// >=1 bit unsigned
  logic	  c;		// >=1 bit unsigned
  integer d;		// 32bit signed
  real	  e;		// 64 bit unsigned floating point 
  time    f;		// 64 bit unsigned
  
  initial begin
    
    $display("\nDefault value of wire = %b", a);
    $display("Default value of reg = %b", b);
    $display("Default value of logic = %b", c);
    $display("Default value of integer = %0d", d);
    $display("Default value of real = %0f", e);
    $display("Default value of time = %0t", f);
    
    #5;
    // Initialize
	b = 1'b1; 		//reg
	c = 1'b0; 		//logic
	d = 164;  		//integer
	e = 10.36;		//real
	f = $time;		//time
    
    $display("\nAfter initialize value of wire = %b", a);
    $display("After initialize value of reg = %b", b);
    $display("After initialize value of logic = %b", c);
    $display("After initialize value of integer = %0d", d);
    $display("After initialize value of real = %.3f", e);
    $display("After initialize value of time = %0t", f);
    
  end
endmodule
