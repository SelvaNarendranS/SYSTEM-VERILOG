//  Write a constraint for a 32-bit variable such that exactly 12 non-consecutive 1's are generated.

class base;
  rand bit[31:0]val;
  
  // constraint
  constraint c1 {
    $countones(val) == 12;		// count ones in the random variable 
    
    // non_consecutive_1s
    foreach(val[i])
      if(i > 0)
        !(val[i] && val[i-1]);		// value !(1 && val[i-1](1)-- )if both should not equal to 1 -- (i & i+1)
  }
  
  function void print();
    $display("  var = %b(%0d)", val, val);
  endfunction
  
endclass

module non_consecutive_1s;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Randomly generated 12 non-consecutive 1's -- in 32 bits ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      