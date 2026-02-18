// Write a constraint for a 2D array with specific constraints.

class base;
  rand int unsigned num[5][3];		// 2D array
  
  // constraint
  constraint array_2D_randomize {
    
    foreach(num[i, j])
      num[i][j] inside {[1:200]};
  }     
  
  function void print();
    $display("\t  num = %0p", num);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of 2D array with specific constraints ---");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodules