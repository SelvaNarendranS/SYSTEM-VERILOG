// Write a constraint to generate the sequence 1122334455.

class base;
  rand int val[10];	// fixed array for 10 values of pairs
  
  // constraint
  constraint sequence_generation {
    val[0] == 1;		// fixing the start of sequence
    
    foreach (val[i]) {
      if(i > 0)
        if(i % 2 == 1) 			// at odd index copy the previous value
          val[i] == val[i-1];
        else 
          val[i] == (val[i-1] + 1);		// at even index incrementing the previous index
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
    
    $display("--- Ramdomization of sequence generation -- 1122334455  ---");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      