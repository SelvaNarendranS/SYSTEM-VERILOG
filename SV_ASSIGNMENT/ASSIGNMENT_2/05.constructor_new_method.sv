// What is the purpose of the new method in SystemVerilog, and how does it differ from a constructor
// Default constructor
class constructor_new;
  logic [7:0]data;				// class properties
  
  function new(int value);				// class methods
    data = value;				// when object is created class properties is loaded with the passed argument value at constructor new is called
  endfunction
endclass

module constructor_purpose;
  
  constructor_new h1, h2;       // null empty handle only created
  
  initial begin
    h1 = new(30);
    h2 = new(214);					// handle has allocated with memory of class with the passed argument value
  
  	$display("\nhandle1 => data = %0d", h1.data);
    $display("handle2 => data = %0d", h2.data);
  end
endmodule 