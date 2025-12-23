// virtual class / abstaract class - Multiple Pure Virtual Methods 
virtual class base; 					// virtual class - class decleration
  pure virtual function void display();	// pure virtual function prototype
//   endfunction						// in pure virtual method not needed
  pure virtual task add;						
 
  pure virtual task log2(output int clog2);		// pure virtual task --  prototype
    
    function int print(int m);			// normal function
      $display("parent class print --->>> sum = %0d",m);
  	 return 1;
   endfunction
endclass

// virtual class only used by derived class.
// extends child class feom base class
class child extends base;
  int a, b, c, info = 0;
  protected int out;					// encapsulation
  
  function new(int a = 0, b = 0, c = 0);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction
  
  function void display();				// function definition
    $display("a = %0d | b = %0d | c = %0d", a, b, c);
    info++;
  endfunction
  
  task add;								// task definition
    out = (a + b + c); #10;
    $display("a = %0d | b = %0d | c = %0d | sum = %0d", a, b, c, out);
    info++;
  endtask
  
  extern task log2(output int clog2);	// extern task definition
  extern function int print(int m);		// extern function definition  
    
    
endclass
      
      
task child :: log2(output int clog2);	// extern task definition
	int i, value;
    value = out; #2;
    for(i = 0; value > 0; i++)
      value = value >> 1; #4;
    clog2 = i;
  info++;
endtask   
    
function int child :: print(int m);		// extern function definition
  $display("in child class print --->>> a = %0d | b = %0d | c = %0d | sum = %0d | clog2 = %0d", a, b, c, out, m);
  return info++;
endfunction

child c1;								// handle created
base b1;

module virtual_class_mixed_methods;
  int clog;
  
  //   base b1 = new();   -------->>> error not possible 
  // virtual class can only used by using derived class
  
  initial begin
    c1 = new(1, 2, 3);					// allocating object to child class
    
    b1 = c1;							// up casting (class assignment)
    
    b1.display();						// handl eb1 function call
    b1.add;
    b1.log2(clog);						// handle b1 task call
    $display("in module --->>> clog = %0d", clog); #10;
    c1.print(clog);						// normal function call in child class
    
    b1.print(clog);
  end
endmodule 