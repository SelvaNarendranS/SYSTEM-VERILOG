// Write a constraint to generate values in increasing order.

class base;
  rand int unsigned val[10];
  
  // constraint
  constraint increasing_order {
    foreach(val[i])
      if(i > 0)
        val[i] > (val[i-1]);	// random increasing -- relational constraint
  }
  
  function void print(); 
    $display("  var = %0p", val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization of values in increasing order ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      