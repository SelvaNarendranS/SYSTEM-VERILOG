// Write a constraint for sorting elements in a dynamic array.

class base;
  rand int unsigned num[];		// dynamic array
  
  // constraint
  constraint sort_randomize {
    num.size() == 10;
    
    foreach(num[i]) 
      num[i] inside {[1:200]};
    
    // another way
//     foreach(num[i]) {
//       if(i > 0)
//         num[i] > num[i-1];
//       }
  }     
  
  function post_randomize();
    foreach(num[i])
      num.sort();
  endfunction
  
  function void print();
    $display("\t  num = %0p", num);
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization of sorting elements in a dynamic array ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule