// constructor with arguments(Parameterized Constructor)
class parameterized;
  int value;
  logic [7:0]data;				// class properties
  
  function new(int a, b);				// class methods
    value = a;
    data  = b;							// when object is created class properties is loaded with this default values
  endfunction
endclass

module parameterized_constructor;
  
  parameterized h1, h2;       		// null empty handle only created
  
  initial begin
    h1 = new(3432, 139);				// passing arguments for class properties
    h2 = new(9756555, 00045);			// handle has allocated with memory of class default properties
  
    $display("\nhandle1 by arguments => value = %0d | data = %0d", h1.value, h1.data);
    $display("handle2 by arguments => value = %0d | data = %0d", h2.value, h2.data);
  end
endmodule