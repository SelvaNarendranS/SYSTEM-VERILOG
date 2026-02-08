// Global / Standalone Constraint Randomization  - multiple classes

class base1;
  rand bit [7:0]a;		// rand variable 
  
endclass

class base2;
  rand bit [7:0]b;		// rand variable 
    
endclass
    
module multiple_class_standalone__randomization;  
  base1 b1;		// class handle
  base2 b2;
  
  initial begin
    b1 = new();			// memory allocation
    b2 = new();
    
    $display("\n--------------------- The list of class_standalone__randomizationrandomized values ----------------");
    
    repeat(10) begin
      std::randomize(b1.a, b2.b) with {b1.a inside {[1:30]};
                                       b2.b inside {[30:60]};
                                      };	// global constraint for both classes
      
      $display("\ta = %d | b = %0d", b1.a, b2.b);
    end
  end
  
endmodule