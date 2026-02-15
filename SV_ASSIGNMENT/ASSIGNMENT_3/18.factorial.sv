// Write a constraint to generate the factorial of a given number.

class base;
  rand longint unsigned temp[];		// dynamic array
  rand longint unsigned num;
  int val;
  
  // constraint
  constraint factorial {
    
    num inside {[1:25]};		// limiting the number to protect from overflow
    
    temp.size() == num;			// random number generation and set as dynamic array size
    
    temp[0] == 1;
    foreach(temp[i])
      if(i > 0)
        temp[i] == temp[i-1] * (i+1);	// evaluating factorial of the number
      
  }
  
  
  function void post_randomize();
    val = temp[temp.size()-1];		// final value is stored in temp of MSB bit
  endfunction
  
  function void print();
    $display("  	    num = %0d      | var = %0d", num, val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization factorial of a given generation value ---");
    $display("random generated number | factorial value");
    repeat(5) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      