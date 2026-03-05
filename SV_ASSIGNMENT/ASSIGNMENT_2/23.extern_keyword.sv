// What is the use of extern keyword in SV? 

class base;
  int a, b;
  
  function new(int a = 2, b = 5);
    this.a = a;
    this.b = b;
  endfunction
  
  extern function void display(int a, b);		// extern keyword --- function decleration
  
endclass

function void base :: display(int a, b);
  $display("The value display by extern ---- a = %0d | b = %0d", a, b);
endfunction

module extern_keyword;
  base b1;				// class handle 
  
  initial begin
    b1 = new();		// class handle object allocation
    
    b1.display(10, 67);		// calling class function
    
  end
endmodule