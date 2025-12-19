// constructor with arguments(Constructor + Method Combination)
class constructor_method;
  int value;
  logic [7:0]data;						// class properties
  int add, sub;
  
  function new(int a = 0, b = 0);		// initialization by default or user-definef values
    value = a;
    data  = b;							// when object is created class properties is loaded with this default values
  endfunction
  
  function void update(int addition, subraction);
    value = addition;					// updating the default value by new value
    add   = addition;
    sub   = subraction;					// storing values in class object
  endfunction
  
endclass

module constructor_method_combi;
  
  constructor_method h1;       		// null empty handle only created
  
  initial begin
    h1 = new(3432, 139);				// passing arguments for class properties
    									// handle has allocated with memory of class default properties
    $display("\nhandle1 by arguments => value = %0d | data = %0d", h1.value, h1.data);
    
    //  handle - h1 and hdl share same memory
    evaluate(h1);						// task call
    
    $display("handle1 evalute => value = %0d | data = %0d | add = %0d | sub = %0d", h1.value, h1.data, h1.add, h1.sub);
  end
  
  task evaluate(constructor_method hdl);	// task  definition
    int eva_add, eva_sub;
    
    // validation
    eva_add = hdl.value + hdl.data;
    eva_sub = hdl.value - hdl.data; #1;
    
    hdl.update(eva_add, eva_sub);			// class function call
  endtask
  
endmodule