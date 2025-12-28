// Polymorphism via Function Argument
class base;
  virtual function void done();		// virtual class
  endfunction
endclass

class child1 extends base;			// extended class
  function void done();
    $display("Child 1");			// overridden class method
  endfunction
endclass

class child2 extends base;			// extended class
  function void done();
    $display("Child 2");			// overridden class method
  endfunction
endclass

module polymorphism_argument;
  base b1;
  child1 c1;
  
  task perform(base b);				// receive arguments as class
    b.done;
  endtask
  
  initial begin
    c1 = new();
    b1 = c1;
    perform(b1);					// passing class as argument
    
    $display("Explicitly calling the constructor");
    b1 = child2 :: new();			// Explicitly calling the constructor
    perform(b1);					// passing class as argument	
  end
endmodule