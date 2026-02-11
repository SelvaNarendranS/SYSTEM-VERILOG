// Write a constraint to generate unique multiples of 3.

class base;
  rand int unsigned val;
  
  // constraint
  constraint unique_multiples_of_3 {
    val % 3 == 0;    		// allows only divisible by 3 without remainder=1
    unique {val};		// unique constraint
  }
  
  function void print(); 
    $display("  var = %0d", val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization of unique values multiples of 3 ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      