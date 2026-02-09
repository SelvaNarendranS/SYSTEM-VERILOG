// Global / Standalone Constraint Randomization  - Global Randomization with Dependency

class base1;
  rand bit [7:0]a;		// rand variable 
  
endclass

class base2;
  rand bit [7:0]b;		// rand variable 
    
endclass
    
module standalone_random_dependency;  
  base1 b1;		// class handle
  base2 b2;
  
  initial begin
    b1 = new();			// memory allocation
    b2 = new();
    
    $display("\n--------------------- The list of class_standalone__randomizationrandomized values ----------------");
    
    repeat(10) begin
      std::randomize(b1.a, b2.b) with {b1.a inside {[1:30]};
                                       b2.b inside {[15:60]};
                                       b1.a > b2.b;				// dependency
                                      };	// global constraint for both classes
      // global constraint is well use full to create a dependancy constraint between two class or different objects
      
      $display("\ta = %d | b = %0d", b1.a, b2.b);
    end
  end
  
endmodule