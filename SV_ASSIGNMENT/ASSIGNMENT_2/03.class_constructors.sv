//  Explain how constructors are defined in SystemVerilog classes and their purpose.

class base;
  int a, b;		// class property
  logic [7:0]data[]; 	// dynamic array
  
  function new(int a);	// class method -- constructor
    this.a = a;
    b = 30;			// setting default value at object(memory)allocation - initialize static variable
    data = new[b];		// Allocate memory for dynamic arry
  endfunction
    
endclass

module constructors;
  base b1, b2;		// handle 
  
  initial begin
    b1 = new(60);			// constructor new() -- object allocation
    b2 = new(32);			// another constructor
    b2.b = 14; 				// default value over ridding
    
    $display("Base class b1 a = %0d | b= %0d | size of dynamic array = %0d", b1.a, b1.b, b1.data.size());
    $display("Base class b2 a = %0d | b= %0d | | size of dynamic array = %0d", b2.a, b2.b, b2.data.size());
  end
endmodule
