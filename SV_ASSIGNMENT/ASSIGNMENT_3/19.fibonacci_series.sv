// Write a constraint to generate the Fibonacci series.

class base;
  rand int val[10];
  
  // constraint
   constraint fibonacci_series {
     val[0] == 0;
     val[1] == 1;			// initial starting values of the series
     
     foreach(val[i]){
       if(i > 1)
         val[i] == val[i-2] + val[i-1];		// fibonacci series values generation
     }
  }
  
  function void print(); 
    $display("  var = %0p", val);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of Fibonacci series generation ---");
    repeat(1) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      