// Write a constraint to generate alternating pairs of 0 and 1.

class base;
  rand int val[16];
  
  // constraint
  constraint  alternating_0_1_pairs {		// output sequence - 00110011...
    
    foreach(val[i]) {
      if((i/2) % 2 == 0)		// so for index pair of 2 index positions need to print same value 
         val[i] == 0;
      else
        val[i] == 1;
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
    
    $display("\n--- Ramdomization to generate alternating pairs of 0 and 1 (00110011...) ---");
    repeat(1) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      