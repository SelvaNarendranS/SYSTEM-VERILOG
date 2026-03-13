// Explain inheritance with code.

// base class
class base;
  int a;
  
  function new(int a = 10);			// default value allocated
    this.a = a;
  endfunction
  
  function void print();
    $display("In BASE -- a = %0d", a);
  endfunction
  
endclass

// extended class --- derived class from base
class child1 extends base;
  int b;
  
  function new(int a = 20, b);		// b has no default value pass by value
    super.new(a);		// base class memory allocation
    this.b = b;
  endfunction
  
  // overritte function
  function void print();
    $display("In child1 -- a = %0d | b = %0d", a, b);
  endfunction
  
endclass

// extended class --- derived class from child1
class child2 extends child1;
  int c;
  
  function new(int a = 20, b, c = 3);		// b has no default value pass by value
    super.new(a, b);		// child1 class memory allocation
    this.c = c;
  endfunction
  
  // overritte function
  function void print();
    $display("In child2 -- a = %0d | b = %0d | c =%0d", a, b, c);
  endfunction
  
endclass

module inheritance;
  child2 h1;		// child 2 handle
  
  initial begin
    $display("Allocating memory to Child2 handle");
    
    h1 = new(14, 24, 45);		// object allocation
    
    h1.print();			// function call
  end
endmodule
