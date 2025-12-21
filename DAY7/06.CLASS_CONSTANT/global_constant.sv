// Constant class properties ---- Global constants
class constant;
  const int location = 'hffac;	// Global constant -- value declared at decleration 
  const int value = 5;
  byte data;
  
  function new(int data);
    this.data = data;
    $display("data = %0d | location = %0h | value = %0d", data, location, value);
  endfunction
  
//   function int add(int a);
//     return (a + (int'(data)) + value);
//   endfunction
endclass

// constant properties work for extended class also
class child extends constant;
  
  function new(int data);
    super.new(data);
  endfunction
  
  function int add(int a);
    return (a + (int'(super.data)) + super.value);
  endfunction
endclass

module global_constant;
  int v1, d1;
  int out;
  
  child h1;
  initial begin
    
    h1 = new(36);
  
  	out = h1.add(145);
  	$display("-------- addition -----------");
  	$display("data = %0d | location = %0h | value = %0d | add = %0d", h1.data, h1.location, h1.value, out);
  end
endmodule