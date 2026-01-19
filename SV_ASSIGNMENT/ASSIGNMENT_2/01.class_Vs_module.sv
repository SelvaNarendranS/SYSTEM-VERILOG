// What is a class in SystemVerilog, and how does it differ from a module

// class
class base;		// class supports OOPS mainly for Verification, data management -- Testbenches & its is dynamic in nature 
  int a;			// class properties
  
  function void display(int num);		// class method
    a = num;
    $display("class base a = %0d", a);
  endfunction
endclass

// module
module class_VS_module;		// 	Static in nature -- mainly for RTL and does not support OOPS
  base b1;		// class handle
  
  initial begin
    b1 = new();			// class constructor object allocation
    
    $display("Displaying class method display");
    b1.display(10);
  end
endmodule