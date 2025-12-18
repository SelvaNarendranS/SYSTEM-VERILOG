// class properties
class properties;				// class in heap
  int a; 			
  string c;						// class - properties
  bit [3:0]b;
endclass

module  class_properties;
  int multiply, divide;
  
  properties prts1, prts2;		// handle created(null handle)
  //class  object1(handle1), object2(handle2)
  
  initial begin
    prts1 = new();
  	prts2 = new();   			// handle is allocated with object memory(class properties default values allocated)
  
  	// accessing and allocating values
  	prts1.a = 1242;
 	prts1.b = 13;
    prts1.c  = "MULTIPLY";
  
  	prts2.a = 1614;
 	prts2.b = 2;
    prts2.c = "DIVIDE";
    
    multiply = prts1.a * prts1.b;
    divide   = prts2.a / prts2.b;
    
    $display("\n\t------ Prts 1 (object) --------");
    $display("$Time = %0t | a = %0d | b = %0d | c = %0s, multiply = %0d", $time, prts1.a, prts1.b, prts1.c, multiply);
    
    $display("\n\t------ Prts 2 (object) --------");
    $display("$Time = %0t | a = %0d | b = %0d | c = %0s, divide = %0d", $time, prts2.a, prts2.b, prts2.c, divide);
    
  end
endmodule