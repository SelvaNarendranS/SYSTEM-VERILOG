// Global / Standalone Constraint Randomization  - class - with and without constraint and rand keyword

class base;
  rand bit [7:0]a;
  rand bit [7:0]c;		// rand variable 
  int unsigned b;
  int unsigned d;			// normal variable inside class
  
  // display function
  function void print();
    $display("\ta = %d | b = %0d | c = %0d | d = %0d", a, b, c, d);
  endfunction
  
endclass
    
module class_standalone_randomization;  
  base b1;		// class handle
  
  initial begin
    b1 = new();			// memory allocation
    
    $display("\n--------------------- The list of class standalone randomized values ----------------");
    
    repeat(10) begin
      std::randomize(b1.a);			// class rand variable
      std::randomize(b1.c);			// class normal variable
      std::randomize(b1.b) with { b1.b inside {[3614:82664], 36815, 649655};};	// global randomize - class nornal variable
      std::randomize(b1.d) with { b1.d inside {[3614:82664], 36815, 649655};};	// global randomize - class nornal variable
      
      						// here rand keyword is negleted by the Standalone method
      b1.print();				// calling class print function
    end
  end
  
endmodule