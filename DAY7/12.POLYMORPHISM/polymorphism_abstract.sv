// Polymorphism Using Abstract Class
virtual class base;
  
  pure virtual function void print();		// function prototype
   
endclass

class child1 extends base;					// extended class - inherited
  
  function void print();
    $display("CHILD - 1");
  endfunction
endclass

class child2 extends base;					// extended class - inherited
  
  function void print();
    $display("CHILD - 2");
  endfunction
endclass

module polymorphism_abstract;
  child1 c1_1;
  child2 c2_1;
  base b1;
  
  initial begin
    c1_1 = new();
    b1 = c1_1;
    b1.print();
    
    c2_1 = new();
    b1 = c2_1;
    b1.print();
  end
endmodule
    