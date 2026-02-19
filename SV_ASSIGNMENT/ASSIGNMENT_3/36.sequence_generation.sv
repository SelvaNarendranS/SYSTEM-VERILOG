// Write a constraint to generate the sequence 0102030405.

class base;
  rand int val[10];
  
  // constraint
  constraint sequence_generation {
    
    foreach(val[i]) {
      if(i % 2 == 0) 		// identify even index
        val[i] == 0;
      else					// identify odd index
        val[i] == (i+1)/2;
    }
  } 
  
  function void print();
    $display("\t val = %0p", val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization to generate the sequence 0102030405 ---");
    repeat(1) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule