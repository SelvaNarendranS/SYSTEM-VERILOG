// Write a constraint to generate the palindrome-like sequence 1234554321.

class base;
  rand int val[10];	// fixed array for 10 values of pairs
  
  // constraint
  constraint palindrome_seq_generation {
    
    foreach (val[i]) {
      val[i] == val[val.size()-(i+1)];		// palindrome -- copying value from LSB to MSB
      
      if(i < 5)
        val[i] == i + 1;	// increasing order of given sequence
      
      //       val[i] inside {[1:50]};	// for random different number of sequence
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
    
    $display("--- Ramdomization of palindrome sequence generation ---");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      