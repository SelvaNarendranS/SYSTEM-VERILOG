// Write a constraint to generate unique numbers without using the unique keyword.

class base;
  rand int val[10];
  
  // constraint
  constraint  unique_elements {
    foreach(val[i]) {			// array 1
      foreach(val[j]) { 		// array2
        if(i != j)
          val[i] != val[j];		// checks previous value for no duplicates (array1 vs array2)
      }
      val[i] inside {[1:15]};
    } 
  }
  
  function void print();
    $display("   var = %0p",val);
  endfunction
  
endclass

module unique_no_without_uniqe_key;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of unique numbers without using the unique keyword ---");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      