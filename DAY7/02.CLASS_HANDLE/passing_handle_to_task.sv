// class passing handle to task  
class handle_task;				// class definition
  int value;
  bit [4:0]data;				// class properties
endclass

module passing_handle_to_task;
  
 handle_task h1;			// only handle has been created (null handle)
  
  // 			(handle assigning) h1 and m handle shares same memory(object)
  task modify(handle_task m);				// receiving value 
    m.value = 2551;
    m.data  = 05;
  endtask
  
  initial begin
    
    h1 = new();					// empty handle(object) memory has been allocated(class properties default values allocated)
    
  	h1.value = 314;
 	h1.data  = 14;
    
    $display("\nhandle1 => value = %0d | data = %0d", h1.value, h1.data);
    
    modify(h1);
    
    $display("\nhandle1 => value = %0d | data = %0d", h1.value, h1.data);
    
  end
endmodule
