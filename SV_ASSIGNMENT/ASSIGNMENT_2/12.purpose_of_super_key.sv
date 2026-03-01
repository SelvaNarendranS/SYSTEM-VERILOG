// What is the purpose of super in SystemVerilog inheritance, and how is it used in a derived class?

// class super keyword
class top;
  int a, b;					// class properties
  	
  function new(int a, b);	// class methods
    this.a = a;				// both class properties and methods argument variable manes are same so this keyword is used 
    this.b = b;
 // this. class_property = argument
    $display("The assigned values in class top a = %0d | b = %0d", a, b);
  endfunction
endclass

class middle extends top;			// middle class from top (sub class of main class)
  int c, d;
  
  function new(int z, y);
    super.new(9, 6);				// constructor for his superior
    c = z;
    d = y;
    $display("The assigned values in class middle c = %0d | d = %0d", c, d);
  endfunction
  
endclass

class bottom extends middle;		// bottom class from middle class from  top (sub bub class of sub class of main class)
  int c, e;
  
  function new(int e, c);
    super.new(3, 5);				// constructor for his superior
    super.c = c;
    this.e = e;
    $display("The assigned values in class middle c = %0d | e = %0d", super.c, e);
  endfunction
  
  function void change(int v1, v2);			// accessing and overwriting superior parent class's by using super key
    
    super.a = v1;					
    super.b = v2;
    $display("\nThe assigned values in all class data from bottom class a = %0d | b = %0d | c = %0d | d = %0d", a, b, super.c, super.d);
  endfunction
  
endclass
   
module super_keyword;
  
  // empty null class handle create
  bottom b1;				//  seprate handle for all class( ~ bottom + middle + top) 
  
  initial begin
    b1 = new(23, 62);		//  allocating a object(memory) to created handle
   	#2;
    b1.change(315, 678);	//  calling function in bottom class
    
  end
endmodule