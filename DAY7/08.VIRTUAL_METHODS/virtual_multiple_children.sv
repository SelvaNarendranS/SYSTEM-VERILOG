// Virtual Method with Multiple Children
class parent;
  int a;
  
  function new(int a = 1);						
    this.a = a;
  endfunction
  
  // extern function decleration
  extern virtual function void display();				// virtual function

    
endclass

class child1 extends parent;							// child 1
  int b;
  
  function new(int a = 2, b = 3);
    super.new(a);
    this.b = b;
  endfunction
  
  // extern function decleration
  extern function void display();

endclass

class child2 extends parent;							// child 2
  int c;
  
  function new(int a = 4, c = 6);
    super.new(a);
    this.c = c;
  endfunction
  
  // extern function decleration
  extern function void display();
  
endclass

// exten function definition of parent
function void parent :: display();
  $display("a = %0d -- parent", a);
endfunction

// exten function definition of child1
function void child1 :: display();
  $display("a = %0d | b = %0d -- child1", a, b);
endfunction

// exten function definition of child2
function void child2 :: display();
  $display("a = %0d | c = %0d -- child2", a, c);
endfunction

parent p1;								// handle creation
child1 cld1;
child2 sup_cld1;

module virtual_multiple_children;
  
  initial begin							
    cld1     = new();					//  object allocated to childs		
    sup_cld1 = new();
    
    // up casting (class assignment)
    p1 = cld1    ;
    p1 = sup_cld1;
    
    $display("-------- sup_cld1.display -----------");
    sup_cld1.display();
    
    $display("-------- cld1.display -----------");
    cld1.display();
    
    $display("-------- p1.display -----------");
    p1.display();
    
  end
endmodule