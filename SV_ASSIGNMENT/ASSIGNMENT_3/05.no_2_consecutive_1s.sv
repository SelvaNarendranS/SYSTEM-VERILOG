// Write a constraint for a 16-bit variable such that no two consecutive 1's are generated.

class base;
  rand bit[15:0] val;
  
  // constraint
  constraint c1 {
    
    foreach(val[i])
      if(i > 0)
        !(val[i] && val[i-1]); 
  }
  
  function void print();
    $display("  var = %0d(%b)", val, val);
  endfunction
  
endclass

module no_2_consecutive_1s;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization of no two consecutive 1's in 16 bit variable ---");
    repeat(1) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      