// class NULL handle
class null_handle;				// class definition
  int value;
  bit [4:0]data;				// class properties
endclass

module class_null_handle;
  
  null_handle h1, h2;			// only handle has been created (null handle)
  
  initial begin
    
    h2 = new();					// empty handle(object) memory has been allocated(class properties default values allocated)
    
  	h2.value = 314;
 	h2.data  = 14;
//     h1. data = 11; ------------ error - only empty handle is created no memory ha sbeen created
  
  	if(h1 == null)
    	$display("the handle1 is empty");
  	else if(h2 == null)
    	$display("the handle2 is empty");
      $display("\thandle2 => value = %0d | data = %0d", h2.value, h2.data);
    
    h1 = new();
    h1.value = 3614;
    $display("\thandle1 => value = %0d | data = %0d", h1.value, h1.data);
  end
endmodule
