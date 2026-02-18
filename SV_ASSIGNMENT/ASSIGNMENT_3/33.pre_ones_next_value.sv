// Write a constraint where the number of 1's in one variable depends on another variable.

class base;
  rand int count;
  rand bit [15:0]num;
  
  // constraint
  constraint pre_value_1s_next {
    count inside {[0:16]};
  }
  
  constraint count_ones {
    $countones(num) == count;
    
  }     
  
  function void print();
    $display("\t  num = %0d(%b) | count = %0d(%0b)", num, num, count, count);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of 1's in one variable depends on another variable ---");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule