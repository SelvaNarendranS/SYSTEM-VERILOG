// Write a constraint to generate random even numbers between 50 and 100.

class base;
  rand int val;
  
  // constraint
  constraint  random_even_numbers {
    val % 2 == 0;		// generate only even numbers
    val inside {[50:100]};	// inside constraint to limit specific set  of range
  }
  
  function void print();
    $display("var = %0d",val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of random even numbers between 50 and 100 ---");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      