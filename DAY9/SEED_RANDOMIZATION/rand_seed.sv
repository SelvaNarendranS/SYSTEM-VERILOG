// Rand Variable– seeded Randomization
// it can only used inside classes
class rand_seed;
  rand int a;		// rand variable   ----- same values can be repeated before all possible values are randomized
  
  function new(int seed);
    this.srandom(seed);		// manual seed for specific object
  endfunction				// random value are generated with one selected seed value  -- Repeatable Results - every run
  
  // constraint
  constraint c1 {
    a inside {[1:200]};
  }
  
  // function to print random generated values
  function void print();
    $display("a = %0d", a);
  endfunction
  
endclass

module rand_variable;
  base b1;  	// class handle 
  
  initial begin
    b1 = new(100); 	// memory allocation and passing seed value to constructor
     
    $display("\n----------printing ramdomized values----------------");
    repeat(5) begin
      b1.randomize();			// calling inbuild .randomize() function for generating random values for the class variable
      
      b1.print();	// calling print function
    end
  end
endmodule