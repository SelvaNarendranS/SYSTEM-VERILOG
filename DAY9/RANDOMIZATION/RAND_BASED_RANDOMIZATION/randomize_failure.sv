// Rand Variable–Based Randomization  -- randomize failure
// it can only used inside classes
class base;
  randc int a;		// randc variable    
  
  // constraint 
  constraint c1 {
    a > 10;
    a < 5;			// the constraint is impossible to achive 
  }
  
  constraint c2 {
    a > 10;			// the constraint is possible to achive 
  }
  
  // function to print random generated values
  function void print();
    $display("a = %0d", a);
  endfunction
  
endclass

module randomize_failure;
  base b1;  	// class handle 
  
  initial begin
    b1 = new(); 	// memory allocation
    
    b1.c2.constraint_mode(1);		// enable constraint c2
    b1.c1.constraint_mode(0);		// disable constraint c1
    $display("\n----------printing ramdomized values----------------");
    repeat(5) begin
      b1.randomize();			// calling inbuild .randomize() function for generating random values for the class variable
      
      b1.print();	// calling print function
    end
    
    #5;
    b1.c2.constraint_mode(0);		// disable constraint c2
    b1.c1.constraint_mode(1);		// enable constraint c1
    b1.randomize();			// calling inbuild .randomize() function for generating random values for the class variable
      
    if(!b1.randomize()) begin 		// randomize() it is a function so it rerurns a value
      $display("time = %0t | Randomization failed", $time);
    end
    
  end
endmodule