// How do you instantiate an object of a class in SystemVerilog
class base;
  int a;		// class property
endclass

module instantiate_object;
  base b1;		// handle 
  
  initial begin
    b1 = new();			// constructor -- object allocation
    b1.a = 60;			// value allocate to the class base handle property
    
    $display("Base class a = %0d", b1.a);
  end
endmodule