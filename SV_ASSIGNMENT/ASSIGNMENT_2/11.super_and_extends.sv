// What is the difference between extends and super in SystemVerilog? 

// class super keyword
class top;
  int a;					// class properties
  	
  function new(int a);	// class methods
    this.a = a;				// both class properties and methods argument variable manes are same so this keyword is used 
    $display("\nThe assigned values in class top a = %0d", a);
  endfunction
  
endclass

class middle extends top;			// middle class from top (sub class of main class)
  int b;
  
  function new(int z);
    super.new(9);				// constructor for his superior
    b = z;
    $display("The assigned values in class middle b = %0d", b);
  endfunction
  
  function void change(int v1, v2);			// accessing and overwriting superior parent class's by using super key
    super.a = v1;			// super means it points its superior the base class from child
    b = v2;
    $display("\nThe assigned values to top class data from middle class a = %0d | b = %0d", super.a, b);
  endfunction
  
endclass
   
module super_and_extends;
  
  // empty null class handle create
  middle b1;				//  middle class handle 
  
  initial begin
    b1 = new(23);		//  allocating a object(memory) to created handle
   	#2;
    b1.change(315, 678);	//  calling function in middle class
    
  end
endmodule