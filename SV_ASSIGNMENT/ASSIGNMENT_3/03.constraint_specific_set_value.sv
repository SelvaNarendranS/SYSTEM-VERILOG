// Write a constraint to generate specific values: 25, 27, 30, 36, 40, 45.

class base;
  rand int unsigned val;
  
  // constraint
  constraint c1 {
    val inside {25, 27, 30, 36, 40, 45};		// inside constraint -- specific set of range -- randomize only specified values
  }
  
  function void print();
    $display("  var = %0d(%0b)", val, val);
  endfunction
  
endclass

module specific_set_value;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization of specific set of values: 25, 27, 30, 36, 40, 45 ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      