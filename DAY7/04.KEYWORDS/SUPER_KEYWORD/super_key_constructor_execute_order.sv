// Class super keyword(2 handles - parent, child)
class parent;				// parent class (main class)
  int a;
  function new(int b = 3);
    a = b;
    $display("\t a = %0d -- class parent",a);
  endfunction
endclass

class child extends parent;		// child class from parent (sub class of main class)
  function new();				// constructor -> parent class -> child class, because child ha s both parent and child - it is auto matically created - without "super" key, unless parent has input arguments  
    $display("\t a = %0d -- class child", super.a);
  endfunction
endclass

module super_key_constructor_execute_order;
  
  child c1;						// child class handle (contains a parent sub-object inside it)
  parent p1;					// parent class handle (separate, independent parent object)
  
  initial begin
    $display("child class handle memory allocation by constructor");
  	c1 = new();
    
    $display("parent class handle memory allocation by constructor");
    p1 = new();
    
  end
endmodule 