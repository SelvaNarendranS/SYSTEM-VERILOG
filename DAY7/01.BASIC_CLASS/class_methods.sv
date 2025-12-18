// class methods
class methods;					// class in heap
  int a; 			
  string c;						// class - properties
  bit [3:0]b;
  
  // initialization
  function new();				// class methods - function constructor
    a = 52;
    b = 10;
    c = "SQUARE";
  endfunction
  
endclass

module  class_methods;
  int square;
  
  methods mtds;					// handle created(null handle)
  //class  object1(handle1),
  
  initial begin
    mtds = new();   			// handle is allocated with object memory(class properties default values allocated)
    
      square = mtds.a ** mtds.b;
      
      $display("\n\t------ mtds (object) --------");
      $display("$Time = %0t | a = %0d | b = %0d | c = %0s, square = %0d", $time, mtds.a, mtds.b, mtds.c, square); #1;
 
  end
endmodule