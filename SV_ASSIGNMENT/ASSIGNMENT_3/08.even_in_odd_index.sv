// write a constraint to generate a sequence where even numbers appear in odd positions.

class base;
  rand bit[3:0] val[8];
  static int a = 1;
  
  // constraint
  constraint even_in_odd_index {
    foreach(val[i])
      (i % 2 == 1) -> (val[i] % 2) == 0; 	// implication constraint
    // detect odd index  ->  randomize only even value
  }
  
  function void print();
    $display("\n	----> SAMPLE -- %0d <------", a);
    foreach(val[i]) 
      $display("  var[%0d] = %0d -- %0s",i, val[i], (i%2 == 1) ? "Odd index - even value" : "");
    a++; 
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization of sequence even number's on odd place(position) ---");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      