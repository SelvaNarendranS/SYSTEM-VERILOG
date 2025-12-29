// Parameterized Class Used as Argument
class base #(parameter SIZE = 8);
  virtual function void done();		// virtual class
  endfunction
endclass

class child1 #(parameter SIZE = 8) extends base #(SIZE);			// extended class
  function void done();
    $display("Child 1 SIZE = %0d",SIZE);			// overridden class method
  endfunction
endclass

module parameter_class_argument;
  base #(10) b1;			// base parameter and child parameter should be same
  child1 #(10) c1;
  
  task perform(base #(10) b);				// receive arguments as class -- for receive argument parameter should be same as handle created
    b.done;
  endtask
  
  initial begin
    c1 = new();
    b1 = c1;
    perform(b1);						// passing class as argument
    
  end
endmodule