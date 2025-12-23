// virtual class / abstaract class - Multiple Pure Virtual Methods 
virtual class base; 						// virtual class - class decleration
  pure virtual function void display();			// pure virtual function prototype
//   endfunction								// in pure virtual method not needed
  pure virtual task add;						
 
    pure virtual task log2(output int clog2);		// pure virtual task --  prototype
    
endclass

// virtual class only used by derived class.
// extends child class feom base class
class child extends base;
  int a, b, c;
  protected int out;							// encapsulation
  
  function new(int a = 0, b = 0, c = 0);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction
  
  function void display();						// function definition
    $display("a = %0d | b = %0d | c = %0d", a, b, c);
  endfunction
  
  task add;										// task definition
    out = (a + b + c); #10;
    $display("a = %0d | b = %0d | c = %0d | sum = %0d", a, b, c, out);
  endtask
  
  task log2(output int clog2);					// task definition
    int i, value;
    value = out; #2;
    for(i = 0; value > 0; i++)
      value = value >> 1; #4;
    clog2 = i;
  endtask
    
endclass

child c1;				// handle created
base b1;

module multiple_pure_virtual_methods;
  int clog;
  
  //   base b1 = new();   -------->>> error not possible 
  // virtual class can only used by using derived class
  
  initial begin
    c1 = new(1, 2, 3);				// allocating object to child class
    
    b1 = c1;				// up casting (class assignment)
    
    b1.display();						// handl eb1 function call
    b1.add;
    b1.log2(clog);						// handle b1 task call
    $display("clog = %0d", clog);
  end
endmodule 