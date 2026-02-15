// Write a constraint to print the pattern 122112211.

class base;
  rand int val[10];
  
  // constraint
  constraint  pattern_printing {
    
    foreach(val[i]) {
      if((i%4 == 0) || (i%4 == 3))
         val[i] == 1;
      else if((i%4 == 1) || (i%4 ==2))
        val[i] == 2;
    }
  }
      // 1 - repeating pattern even index places - 2, 4, 6, 8
      // in odd index places -- toggles by previous odd values 1 -> 2, 2 -> 1
  
  function void print();
    $display("   var = %0p",val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization to print the pattern 12211221 as value ---");
    repeat(1) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      