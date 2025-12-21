// static methods -- Non-Static function Accessing Static Variable 
class static_methods;
  static int count = 0, non_count = 0;		// static variable
  int a, b;									// non static variable
  
  function new(int a = 0, b = 0);
    this.a = a;
    this.b = b;
  endfunction
  
  function void square;						// non static variable and static variable in non static method
    int area;
    area = a * b;
    non_count++;
    $display("a, b = %0d, %0d | area = %0d | non_count = %0d | count = %0d", a, b, area, non_count, count);
  endfunction
  
  static task increment();					// static task - inside only static variables are allowed
    count++;
  endtask
 
endclass

module static_variable_fn;
  int out;
  
  static_methods h1, h2, h3;
  
  initial begin
    h1 = new(12, 3);
    h2 = new(48, 15);
    h3 = new(20, 31);
    
    h1.square();						// non static function call 
    h2.square();
    h3.square();
    
    static_methods::increment();		// calling static function
    static_methods::increment();
    static_methods::increment();
    static_methods::increment();
    
    $display("count = %0d",static_methods::count);			// accessing static variable 
  end
endmodule
    