// Create an object for the class and invoke display function .convert display as pure virtual method and invoke the method. 


virtual class base;		// abstract class(virtual class)
		  
  pure virtual function void display();		// function prototype
    
endclass

// extended (derived) class
class child extends base;
  int a, b;
  
  function new (int a, b);
    this.a = a;
    this.b = b;
  endfunction
  
  // function definition
  function void display();
    $display("The values in child class a= %0d | b = %0d", a, b);
  endfunction 
  
endclass

module pure_virtual_function;
  
  child c1; 		// class handle
  
  initial begin
    
    $display(" ------ class object allocation handle c1 --------");
    c1 = new(34, 164);
  
  repeat(5) begin
      c1.display();
    end
  end

endmodule