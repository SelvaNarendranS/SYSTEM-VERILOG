// virtual methods - virtual function with super key (parent child upcasting)
class parent;							// parent class
  int a;
  
  function new(int a);
    this.a = a;
  endfunction
  
  virtual function void square();		// virtual function
    $display("class parent -- square a ** 2 = %0d", a ** 2);
  endfunction
endclass

class child extends parent;				// child class
  int b;
  
  function new(int a, b);
    super.new(a);
    this.b = b;
  endfunction
  
  function void square();
    super.square();						// calling parent square function	
    $display("class child -- square a to times of b = %0d", a ** b);
  endfunction
endclass

child c1;					// child handle
parent p1;					// parent handle

module virtual_function_super_key;
  int v1, v2;
  
  initial begin
    // initialize
    v1 = 2;
    v2 = 3;
    
    c1 = new(v1, v2);
    p1 = c1;				// up casting 
    
    // calling square function in child handle
    $display("-------p1.square() ----------");
    p1.square();			// calling p1 == gives 2 display - from parent and child
    
    // calling  function in child handle 
    $display("-------c1.square() ----------");
    c1.square();			// calling c1 == gives only overritten square function -- in child only
    
  end
endmodule
