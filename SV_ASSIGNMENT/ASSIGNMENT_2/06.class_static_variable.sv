// What is the scope of a static variable within a SystemVerilog class, and how does it differ from an instance variable? 
class base;
  int value;			// normal value
  static int data; 		// static property -- class static variable
  
  function new(int a);
    value = a;		// normal variable is loaded with a value received as argument
  endfunction
  
  task run();
    value++;		
    data++;			// both increments once every tine task called
  endtask
endclass

module class_static_variable;
  base b1, b2;			// class handle
  
  initial begin
    b1 = new(10);			// object allocated for handle 1
    b1.run;					// task call
    
    $display("b1 ---> value = %0d | data = %0d", b1.value, base::data);
    
    b1.run();				// task call 2nd time od sane handle 1
    $display("b1 ---> value = %0d | data = %0d", b1.value, base::data);
    
    b2 = new(10);
    b2.run();				// task call of handle 2 --- here only the normal value will increments from the new start point
    $display("b2 ---> value = %0d | data = %0d", b2.value, base::data); // the static variable the -- one shared memory location for all instances
  end
endmodule
    
