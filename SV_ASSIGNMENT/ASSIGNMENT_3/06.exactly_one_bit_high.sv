// write a constraint to generate a 32-bit number where exactly one bit is high.

class base;
  rand bit[31:0] val;
  
  // constraint
  constraint c1 {
    
    $countones(val) == 1;	// count -- allows only one ones in the random variable
  }
  
  function void print();
    $display("  var = %0d(%b)", val, val);
  endfunction
  
endclass

module exactly_one_bit_high;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization of exactly one bit high 32 bit variable ---");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      