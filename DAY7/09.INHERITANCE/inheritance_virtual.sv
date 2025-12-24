// inheritance with virtual method
class parent;
  virtual function void print();
    $display("Parent class");
  endfunction
endclass

class child extends parent;				// extended class
  int a;
  function new(int a = 2);
    this.a = a;
  endfunction
  
  function void print();
    $display("child class - a = %0d", a);
  endfunction
endclass

module inheritance_virtual;
  parent p1; 					// parent hadle
  child c1;					// child handle
  
  initial begin 
  	c1 = new();
  	p1 = c1;					// upcasting

  
  	p1.print();
  end
endmodule