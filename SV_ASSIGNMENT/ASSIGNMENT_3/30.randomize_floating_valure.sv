// Write a code to generate a random floating-point number between 1.35 and 2.57.

class base;
  rand int unsigned num;
  real val;
  
  // constraint
  constraint float_randomize {
    num inside {[1350:2570]};			// get randomize between numbers only 
  }     
  
  function post_randomize();
    val = num / 1000.0;						// changing int data type to floating value
  endfunction
  
  function void print();
    $display("floating random out  num = %0d decimal value val = %0.2f", num, val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of random floating-point number between 1.35 and 2.57 ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule