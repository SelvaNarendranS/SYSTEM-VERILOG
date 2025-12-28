// polymorphism with super
class base;
  virtual function void print();		// virtual function
    $display("Virtual base class");
  endfunction
endclass

class child extends base;				// extended class
  function void print();				// overridden function
    super.print();
    $display("Child class - overridden function base class");
  endfunction
endclass

module polymorphism_super;
  base b1;								// handle
  child c1;
  
  initial begin 
    c1 = new();							// object allocation
    b1 = c1;					  		// upcasting
    
    
    c1.print();							// child function call
  end
endmodule