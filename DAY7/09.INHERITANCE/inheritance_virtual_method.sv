// inheritance - inheritance_virtual method
class base;
  int a = 10;
  
  virtual function void display();
    $display("Parent - a = %0d", a);
  endfunction
endclass

class child extends base; 					// child inherited base
  int b = 20;
  
  function void display();
    $display("Child - a = %0d, b = %0d", a, b);
  endfunction
endclass

child c1;			// child handle
base p1;

module inheritance_virtual_method;
  
  initial begin
    c1 = new();
    p1 = c1;						// up casting 
    $display("---------p1.display---------");
    p1.display;						// run time binding
    $display("---------c1.display---------");
    c1.display;
  end
endmodule
    