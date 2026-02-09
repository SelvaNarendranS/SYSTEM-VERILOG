// Write a constraint to generate values between 1000 and 2000 such that values do not repeat.  

class Generic;
  randc int unsigned var1;
  
  // constraint
  constraint c1 {
    var1 inside {[1000:2000]};
  }
  
  // display function
  function void print();
    $display("var1 = %d ", var1);
  endfunction
  
endclass
    

module main;
  Generic g1;		// class handle
  
  initial begin
    g1 = new();			// memory allocation
    
    $display("\n--------------------- The list of randomized values ----------------");
    
    repeat(10) begin
      if(g1.randomize())	// calling randomize function
        g1.print();				// calling class print function
      else
        $display("Randomize failed");
    end
  end
  
endmodule

// https://edaplayground.com/x/s98K