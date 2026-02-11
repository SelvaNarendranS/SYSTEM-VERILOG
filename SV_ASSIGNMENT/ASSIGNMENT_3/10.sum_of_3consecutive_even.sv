// Write a constraint to ensure that the sum of three consecutive numbers is even.

class base;
  rand int val[];		// declared dynamic array 
  
  // constraint
  constraint sum_of_3consecutive_even {
    val.size() == 10;		// allocating size to the dynamic array
    
    foreach(val[i])
      if(i>=2)
        (val[i] + val[i-1] + val[i-2]) % 2 == 0;	// checking and setting the sum of previous 3 values should be even
    
    foreach(val[i])
      val[i] inside {[1:100]};		// inside constraint for specific set of range
  }
  
  function void print(); 
    $display("  var = %0p", val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization sum of three consecutive values is even ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      