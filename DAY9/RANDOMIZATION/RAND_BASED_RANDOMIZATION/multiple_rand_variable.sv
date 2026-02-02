// Rand Variable–Based Randomization  -- multiple rand variable
// it can only used inside classes
class base;
  rand int a;			// rand variable
  rand logic[3:0] b;
  randc bit[1:0] c;		// randc variable
  randc byte d;
  
  // function to print random generated values
  function void print();
    $display("  a	 = %0d   |    b        = %0d   |      c      = %0d  |    d        = %0d ", a, b, c, d);
  endfunction
  
endclass

module multiple_rand_variable;
  int i = 0, j = 0;
  base b1;  	// class handle 
  
  initial begin
    b1 = new(); 	// memory allocation
    
    $display("\n----------printing ramdomized values----------------");
    $display("rand int variabe - a | rand logic variable - b | randc bit variable - c | randc byte variable - d");
    
    repeat(10) begin
      b1.randomize();			// calling inbuild .randomize() function for generating random values for the class variable
      
      b1.print();	// calling print function
      
      i++;
      j++;
      if((i-1) >= 3) begin
        $display("                     |    			    |    unique value");
        $display("                     |    			    |    Cycle repeats ");
        i = 0;
      end
      
      if((j-1) >= 15) begin
        $display("					   |   same value repeats");
        $display("					   |    before cycle     ");
        j = 0;
      end
      
    end
  end
endmodule