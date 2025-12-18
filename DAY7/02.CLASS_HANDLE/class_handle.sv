// class handle
class handle;						// class definition
  byte number;
  int data;							// class properties
  real value;
  
  function new(byte num,
              int da,
              real va);					// class methods
    number = num;
    data   = da;
    value  = va;				
  endfunction    
  
endclass

module class_handle;
  
  handle sub1, sub2;			// only handle has been created	(null handle)		
  // class name - handle1, handle2, handle3
  
  initial begin
    sub1 = new(113, 68734176, 314.61974);						// empty handle(object) memory has been allocated (class properties default values allocated)
    sub2 = new($random, $urandom_range(1, 1000), ($urandom/8));
    
    $display("----------the object values--------------");
    $display("**************** object 1 ****************"); 
  	$display("number = %0d | data = %0d | value = %0f", sub1.number, sub1.data, sub1.value);	// class properties access
    
    $display("**************** object 2 ****************"); 
    $display("number = %0d | data = %0d | value = %0.2f", sub2.number, sub2.data, sub2.value);
    
  end
endmodule
   