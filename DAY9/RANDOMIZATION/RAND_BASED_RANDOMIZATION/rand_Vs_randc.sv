// Rand Variable–Based Randomization  -- rand Vs randc variable
// it can only used inside classes
class base;
  rand bit[1:0] a;		// rand variable
  randc bit[1:0] b;		// randc variable
  
  // function to print random generated values
  function void print();
    $display("	   a 	 = %0d  |      b        = %0d", a, b);
  endfunction
  
endclass

module randc_variable;
  int i = 0;
  base b1;  	// class handle 
  
  initial begin
    b1 = new(); 	// memory allocation
    
    $display("\n----------printing ramdomized values----------------");
    $display("rand variabe - a  |   randc variable - b");
    
    repeat(10) begin
      b1.randomize();			// calling inbuild .randomize() function for generating random values for the class variable
      
      b1.print();	// calling print function
      
      i++;
      if((i-1) >= 3) begin
        $display("same value repeats|    unique value");
        $display(" before cycle     |    Cycle repeats  ----- Cyclic Randomization");
        i = 0;
      end
      
    end
  end
endmodule