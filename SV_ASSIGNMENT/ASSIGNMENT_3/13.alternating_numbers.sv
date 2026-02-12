// Write a constraint to generate a 10-bit variable with alternating numbers.

class base;
  rand bit [9:0] val;
  
  // constraint
  constraint alternating_numbers {
    foreach(val[i])
      if(i > 0)
        val[i] != val[i-1];		// setting randomize value different from previous one
  }
  
  function void print(); 
    $display("  var = %0d(%b)", val, val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization alternating numbers of values  ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      