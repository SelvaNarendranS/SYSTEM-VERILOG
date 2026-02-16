// Write a code snippet to randomize only the 12th bit of a variable.

class base;
  rand bit bt;
  rand int unsigned data;
  
  // constraint
  constraint  randomize_bit12_only {
    data inside {[0:6000]}; 
  }     
  
  function post_randomize();
    $display("\ndata before 12th bit change data = %0b(%0d)  -- 12th bt = %0d",data, data, data[11]);
    data[11] = bt;						// changing only the 12th bit of random value
  endfunction
  
  function void print();
    $display(" after random 12th bit change  data = %0b(%0d) -- 12th bt = %0d", data, data, bt);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of only the 12th bit of a variable ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule