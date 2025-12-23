// virtual class / abstaract class
virtual class base; 						// virtual class - class decleration
  virtual function void display();			// function prototype
  endfunction
endclass

// virtual class only used by derived class.
// extends child class feom base class
class child extends base;
  int a, b, c;
  
  function new(int a = 0, b = 0, c = 0);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction
  
  function void display();
    $display("a = %0d | b = %0d | c = %0d", a, b, c);
  endfunction
endclass

child c1;				// handle created
base b1;

module basic_virtual_class;
  
  //   base b1 = new();   -------->>> error not possible 
  // virtual class can only used by using derived class
  
  initial begin
    c1 = new(1, 2, 3);				// allocating object to child class
    
    b1 = c1;				// up casting (class assignment)
    
    b1.display();
  end
endmodule
    