// Create a class A with 4 different data type variable. 

// base class
class a;
  logic [15:0] value1;
  real value2;		
  time value3;
  longint value4; 	// variables -- class properties -- different data type
  
  function new(int a, b, c, d);
    value1 = a;
    value2 = b;
    value3 = c;
    value4 = d;
  endfunction
  
  function void dispaly();
    $display("The values logic - num1 = %0d | real - num2 = %0.2f | time - value1 = %0d | longint value = %0d", value1, value2, value3, value4);
  endfunction
  
endclass

module two_diff_data_types;
   a class_a;		// class handle
  
  initial begin
    
    class_a= new($urandom, 114.17, $urandom, $urandom);  // object allocation
    $display("------ 4 different data type -----------");
    class_a.dispaly();		// calling dispaly function
  end
endmodule
  