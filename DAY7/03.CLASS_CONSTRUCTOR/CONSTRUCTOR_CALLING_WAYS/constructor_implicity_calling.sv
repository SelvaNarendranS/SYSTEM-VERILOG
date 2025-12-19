// constructor calling ways - implicity calling
class constructor_calling;		// class in heap
  int a; 			
  string c;						// class - properties
  bit [3:0]b;  
endclass

module constructor_implicity_calling;
  real square;
  
  constructor_calling impli;					// handle created(null handle)
  //class  object1(handle1),
  
  initial begin
    impli = new();   			// handle is allocated with object memory(class properties default values allocated) - implicity calling
    
    impli.a = 52;
    impli.b = 10;
    impli.c = "SQUARE";						
    
    square = impli.a ** impli.b;
      
      $display("\n\t------ impli (object) --------");
    $display("$Time = %0t | a = %0d | b = %0d | c = %0s, %0s = %0d", $time, impli.a, impli.b, impli.c, impli.c, square); #1;
 
  end
endmodule