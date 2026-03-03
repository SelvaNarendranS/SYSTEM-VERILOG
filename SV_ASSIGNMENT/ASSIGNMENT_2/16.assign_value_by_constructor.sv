// Create a class G extended from class F .Add a class constructor to assign the  value for the class F VARIABLE

// base class
class F;
  int num1;
  integer num2;			// variables -- class properties
  
  function new (int a, b);
    num1 = a;
    num2 = b;
  endfunction
  
endclass

// extended class
class G extends F;
  
  function new(int a, b);  		// constructor
    super.new(a, b);			// to assign values to the base class variables
  endfunction
  
  function void dispaly();
    $display("The values int - num1 = %0d | integer - num2 = %0d ", num1, num2);
  endfunction
  
endclass

module assign_value_by_constructor;
   G class_G;		// class handle
  
  initial begin
    
    class_G = new($urandom, $urandom);  // object allocation
    $display("------ assign value to base class by child constructor -----------");
    class_G.dispaly();		// calling dispaly function
  end
endmodule
  