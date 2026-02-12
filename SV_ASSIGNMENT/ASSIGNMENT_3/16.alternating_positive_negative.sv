// Write a constraint to generate the alternating positive-negative sequence: 5, -10, 15, -20, 25, -30.

class base;
  rand int val[6];
  
  // constraint
   constraint alternating_positive_negative {
     val[0] == 5;				// initial value of the sequence
    
     foreach(val[i]){
       if(i % 2 == 0)		// even index positive values 
        val[i] == (i+1) * val[0];
      else					// odd index negative values
        val[i] == -((i+1) * val[0]);
    }
  }
  
  function void print(); 
    $display("  var = %0p", val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization of alternating positive-negative sequence ---");
    repeat(1) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      