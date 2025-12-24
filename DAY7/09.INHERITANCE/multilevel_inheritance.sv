// multilevel_inheritance
class great_grand_parent;
  int a;
  
  function new(int a = 10);
    this.a = a;
  endfunction
  
  task print;
    #5;
    $display("time = %0t | a = %0d --- GREAT GRAND PARENT", $time, a);
  endtask
endclass

// extended class from great grand parent
class grand_parent extends great_grand_parent;
  int b;
  
  function new(int a, b);
    super.new(a);					// constructor super new to superior - and argument passing
    this.b = b;
  endfunction
endclass

// extended class from grand parent
class parent extends grand_parent;
  int c;
  
  function new(int a, b, c = 30);
    super.new(a, b);				// constructor super new to superior - and argument passing
    this.c = c;
  endfunction
  
  function void display();
    $display("a = %0d | b = %0d | c = %0d --- PARENT", a, b, c);
  endfunction
endclass

// extended class from parent
class child extends parent;
  int d;
  
  function new(int a, b, c, d);
    super.new(a, b, c);				// constructor new to superior - and argument passing
    this.d = d;
  endfunction
  
  function void sum();
    $display("a = %0d | b = %0d | c = %0d | d = %0d | sum = %0d --- CHILD", a, b, c, d, (a+b+c+d));
  endfunction
endclass

module multilevel_inheritance;
  child c1;						// created child handle
  
  initial begin
    c1 = new(40, 50, 60, 70); 				// constructor new() - object allocation
    
    c1.print;
    c1.display;
    c1.sum;
  end
endmodule