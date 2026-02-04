// pre_randomize() and post_randomize()

class base;
  rand int unsigned a;
  
  // function to print random generated values
  function void print();
    $display("a = %0d", a);
  endfunction
  
  // function pre_randomize
  function void pre_randomize();
    $display("pre_randomize has been executed --- before randomize : a = %0d", a);
  endfunction
  
  // function post_randomize
  function void post_randomize();
    $display("post_randomize has been executed --- after randomize : a = %0d", a);
  endfunction
  
endclass

module pre_post_randomize;
  base b1;  	// class handle 
  
  initial begin
    b1 = new(); 	// memory allocation
    
    $display("\n-----------------randomization start ----------------");
    $display("randomization --- randomize() function called");
    if(b1.randomize()) begin
      $display("Randomization successful");
      b1.print();		// calling print function in class
    end
  end
endmodule