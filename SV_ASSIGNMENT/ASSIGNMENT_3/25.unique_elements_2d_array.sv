// Write a constraint to ensure unique elements in a 2D array without using the unique keyword.

class base;
  rand int val[6][4];
  
  // constraint
  constraint  unique_elements_2d_array {
    
    foreach(val[i, j]) {				// builds array1
      foreach(val[k, a]) {				// builds array2
        if(!(i == k) && (j == a))
          val[i][j] != val[k][a];		// checks for duplicates array1 Vs array2
      }
      val[i][j] inside {[1:10]};			// specific set of range
    }
  }
  
  function void print();
    $display("   var = %0p",val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization to check unique elements in 2D array without using unique keyword ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      