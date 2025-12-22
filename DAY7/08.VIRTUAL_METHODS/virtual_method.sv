// virtual methods - virtual without super key(parent child upcasting)
class parent;							// parent class
  
  virtual function void display();		// virtual function
    $display("class parent");
  endfunction
endclass

class child extends parent;				// child class
  
  function void display();				// due to virtual function definition previous display has been overritten
    $display("class child");
  endfunction
endclass

child c1;					// child handle
parent p1;					// parent handle

module virtual_methods;
  
  initial begin
    c1 = new();				// c1 object allocation
    p1 = c1;				// up casting 
    
    // calling display function in child handle
    $display("-------p1.display() ----------");
    p1.display();			// only child display prints because its has been overritten the parent display function
    
    // calling display function in child handle 
    $display("-------c1.display() ----------");
    c1.display();			// only child display prints because its has been overritten the parent display function
  end
endmodule