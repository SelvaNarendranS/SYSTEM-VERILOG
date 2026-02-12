// Write a constraint to generate even numbers between 10 and 30.

class base;
  rand int val;
  
  // constraint
   constraint even_numbers_generation {
     val % 2 == 0;		// even value generation
     val inside {[10:30]};		// inside constaint for -- limiting generation with specific set of range 
  }
  
  function void print(); 
    $display("  var = %0p", val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of even numbers generation b/w 10 to 30  ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      