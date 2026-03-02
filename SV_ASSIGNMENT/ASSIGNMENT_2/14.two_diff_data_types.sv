// Create a class B extended from Class A with 2 different data type variables.

// base class
class a;
  int num1;
  integer num2;			// variables -- class properties
  
  function new (int a, b);
    num1 = a;
    num2 = b;
  endfunction
  
endclass

// extended class
class b extends a;
  byte value1;
  bit[5:0] value2;		// variables -- class properties -- different data type
  
  function new(int a, b, c, d);
    super.new(a, b);
    value1 = c;
    value2 = d;
  endfunction
  
  function void dispaly();
    $display("The values int - num1 = %0d | integer - num2 = %0d | byte - value1 = %0d | bit value = %0d", num1, num2, value1, value2);
  endfunction
  
endclass

module two_diff_data_types;
   b class_b;		// class handle
  
  initial begin
    
    class_b = new($urandom, $urandom, $urandom, $urandom);  // object allocation
    $display("------ 2 class of different data type -----------");
    class_b.dispaly();		// calling dispaly function
  end
endmodule
  
