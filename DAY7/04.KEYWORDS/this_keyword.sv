// class this keyword
class this_key;
  int a, b;					// class properties
  	
  function new(int a, b);	// class methods
    this.a = a;				// both class properties and methods argument variable manes are same so this keyword is used 
    this.b = b;
 // this. class_property = argument
    $display("The assigned values in class a = %0d | b = %0d", a, b);
  endfunction
endclass

module this_keyword;
  
  this_key h1;				// empty null class handle create
  
  initial begin
    h1 = new(23, 62);		//  allocating a object(memory) to created handle
  end
endmodule
    
    