// Write a constraint where a variable's range of 0-100 has 10% probability and 101-255 has 30% probability.

class base;
  rand bit [7:0] val;		
  
  // constraint
  constraint probability_of_range {
    val dist {[0:100] :/ 10, 
              [101:255] :/ 30 };		// relative didtribution constraint
  }
  
  function void print(); 
    $display("  var = %0d  --- %0s", val, (val<101) ? "value < 100 - 10%" : "value > 100 --- 30%");
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomizing probability of range values ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      