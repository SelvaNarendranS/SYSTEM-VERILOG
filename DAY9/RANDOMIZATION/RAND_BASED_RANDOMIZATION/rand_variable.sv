// Rand Variable–Based Randomization  -- rand variable
// it can only used inside classes
class base;
  rand int a;		// rand variable   ----- same values can be repeated before all possible values are randomized
  
  // function to print random generated values
  function void print();
    $display("a = %0d", a);
  endfunction
  
endclass

module rand_variable;
  base b1;  	// class handle 
  
  initial begin
    b1 = new(); 	// memory allocation
    
    $display("\n----------printing ramdomized values----------------");
    repeat(5) begin
      b1.randomize();			// calling inbuild .randomize() function for generating random values for the class variable
      
      b1.print();	// calling print function
    end
  end
endmodule