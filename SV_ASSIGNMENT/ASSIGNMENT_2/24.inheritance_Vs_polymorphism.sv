// Difference between inheritance and polymorphism 

// base class
virtual class base;					// abstract class		
  int a;
  
  function new(int a = 10);			// default value allocated
    this.a = a;
  endfunction
  
  virtual function void print();			// virtual method
  endfunction
endclass

// extended class --- derived class from base
class child1 extends base;						// inheritance
  int b;
  
  function new(int a = 20, b = 41);		// b has no default value pass by value
    super.new(a);		// base class memory allocation
    this.b = b;
  endfunction
  
  // overritte function
  function void print();
    $display("In child1 -- a = %0d | b = %0d", a, b);
  endfunction
  
endclass

// extended class --- derived class from child1
class child2 extends child1;			// inheritance
  int c;
  
  function new(int a = 20, b = 67, c = 3);		// b has no default value pass by value
    super.new(a, b);		// child1 class memory allocation
    this.c = c;
  endfunction
  
  // overritte function
  function void print();
    $display("In child2 -- a = %0d | b = %0d | c =%0d", a, b, c);
  endfunction
  
endclass

// another extended class from base
class base_child1 extends base;
  int z;
  
  function new(int a = 20, b = 3);		// b has no default value pass by value
    super.new(a);		// base class memory allocation
    z = b;
  endfunction
  
  // overritte function
  function void print();
    $display("In base_child1 -- a = %0d | z = %0d", a, z);
  endfunction
  
endclass
    

module inheritance;
  base_child1 b_ch1;			// base_child1  handle
  child2 h1, h2;		// child 2 handle
  base b1;			// base handle
  
  initial begin
    $display("Allocating memory to Child2 handle");
    
    h1 = new(14, 24, 45);		// object allocation --- inheritance accessing
    
    h1.print();			// function call
    
    $display("\nallocating memory to base_child and assigning(pointing) to the base virtual class handle ");
    
    // polymorphism
    
    b_ch1 = new(15, 27);
    b1 = b_ch1;			// pointing child to base
    
    b1.print();			
    
    $display("\n another handle pointing with new handle");
    h2 = new(5, 84, 164);
    b1 = h2;
    
    b1.print();
    
  end
endmodule
