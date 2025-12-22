// virtual methods - non- virtual flaws without super key(parent child upcasting)
class parent;							// parent class
  
  function void display();
    $display("class parent");
  endfunction
endclass

class child extends parent;				// child class
  
  function void display();
    $display("class child");
  endfunction
endclass

child c1;					// child handle
parent p1;					// parent handle

module non_virtual_flaws;
  
  initial begin
    c1 = new();				// c1 object allocation
    p1 = c1;				// up casting 
    
    // calling square function in child handle
    p1.display();			// only parent display prints
  end
endmodule