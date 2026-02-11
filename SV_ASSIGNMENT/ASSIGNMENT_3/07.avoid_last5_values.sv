// Write a constraint to avoid generating the same 4-variable value as any of the last 5 occurrences.

class base;
  rand bit[3:0] val;	// 4 - variable -- 4bits
  bit [3:0] history[$];	// queue to store previous values history
  
  // constraint
  constraint avoid_last5_values {
    !(val inside {history});		// inverted inside constraint
      
  }
  
  function void post_randomize();
    history.push_back(val);		// adding new value to the queue
    
    // removing old 6th value inside the queue
    if(history.size() > 5)
      history.pop_front();
  endfunction
  
  function void print();
    $display("  var = %0d(%b)", val, val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization by avoiding last 5 value occurrences ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      