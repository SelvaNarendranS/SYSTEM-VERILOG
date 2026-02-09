// Global / Standalone Constraint Randomization  - Return Value & Failure Handling

class base;
  rand bit [7:0]a;		// rand variable 
    
endclass
    
module standalone_random_return; 
  bit [7:0]b;
  base b1;		// class handle
  
  // display function
  function void print();
    $display("\ta = %d | b = %0d", b1.a, b);
  endfunction
  
  initial begin
    b1 = new();			// memory allocation
    
    $display("\n--------------------- The list of class_standalone__randomizationrandomized values ----------------");
    
    repeat(10) begin
      if(std::randomize(b1.a, b) with {
        b1.a inside {[1:50]};
        b inside {[90:150]};				// global randomization with status 
        solve b1.a before b;
      })
        print();				// calling print function
      else
        $display("Randomization Failed"); 		// failure handling statement
    end
    
//     $display("\n failure handling");
//     repeat(1) begin
//       if(std::randomize(b1.a, b) with {
//         b1.a > 0; b1.a < 1;			// condition for failure -- false condition
//         b inside {[1:2]};
//       })
//         print();				// calling print function
//       else
//         $display("Randomization Failed"); 		// failure handling statement
//     end
  end
  
endmodule