// Rand Variable–Based Randomization  -- rand mode - disable randomization
// it can only used inside classes
class base;
  rand int a;			// rand variable
  rand logic[3:0] b;
  randc bit[1:0] c;		// randc variable
  randc byte d;
  
  // function to print random generated values
  function void print();
    $display("a = %0d | b = %0d | c = %0d | d = %0d", a, b, c, d);
  endfunction
  
endclass

module rand_mode;
  base b1;  	// class handle 
  
  initial begin
    b1 = new(); 	// memory allocation
    
    $display("\n----------printing ramdomized values----------------");
    
    $display(" Disable randomization for a specific variable -- a, c --- rand_mode(0)");  // default mode will be 1 -- so b & d ramdomization done
    b1.a.rand_mode(0);
    b1.c.rand_mode(0);	// disable randomization
    repeat(5) begin
      b1.randomize();			// calling inbuild .randomize() function for generating random values for the class variable
      
      b1.print();	// calling print function      
    end
    
    $display(" enabling randomization for all variable - rand_mode(1)");
    b1.a.rand_mode(1);
    b1.c.rand_mode(1);	// enable randomization
    repeat(5) begin
      b1.randomize();			// calling inbuild .randomize() function for generating random values for the class variable
      
      b1.print();	// calling print function
    end
  end
endmodule