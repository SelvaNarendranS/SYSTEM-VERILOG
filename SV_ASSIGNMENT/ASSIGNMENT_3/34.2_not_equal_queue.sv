// Write a constraint to ensure that two queues contain different elements.

class base;
  rand int num[$];	
  rand int val[$];		// queue array
  
  // constraint
  constraint queue_size {
    num.size() == 5;
    val.size() == 5;    
  }
  
  constraint unique_queue {
    
    foreach(num[i]) {
      num[i] inside {[1:200]};
      val[i] inside {[1:200]};
    }
    
    foreach(num[i]) {
      foreach(val[j])
        num[i] != val[j];
    }
  } 
  
  function void print();
    $display("\t  num = %0p | val = %0p", num, val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization to ensure that two queues contain different elements ---");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule