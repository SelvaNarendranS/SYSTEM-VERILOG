// Write a constraint to generate palindrome numbers.

class base;
  rand shortint val[7];				// dynamic array 
  longint unsigned  result;
  
  // constraint
  constraint  palindrome_numbers {
    
    foreach(val[i]) {
      val[i] == val[(val.size()-i-1)];		// palindrome -- copying value from LSB to MSB 
    
      val[i] inside {[0:9]};			// for random different number of sequence
       
      val[0] != 0;			// to avoid 0 at lsb bit 
    }
  }
  
  function void post_randomize();
    result = 0;
    for(int i = 0; i < 7; i++) begin
      result = result + (val[i] * (10**i));		// array to single digit number convertion
    end
  endfunction
  
  function void print();
    $display("var = %0p | result --> palindrome number = %0d",val, result);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of palindrome numbers as value ---");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      