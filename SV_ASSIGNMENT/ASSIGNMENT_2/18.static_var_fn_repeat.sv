// Invoke static function for 'N' number of times and finally display the value of static variable. 

class base;
  static int val = 0;
  int a = 0;
  
  static function void increment();
    val++;				// static variable increment	
  endfunction
  
  function void increase();
    a++;
  endfunction
  
endclass

module static_variable_function;
  int N = 6;
  
  base b1, b2; 		// class handle
  
  initial begin
    
    repeat(N) begin
      base :: increment();
      $display("The static variable  val = %0d", base::val);
    end
    
    $display(" ------ class object allocation handle h1 --------");
    b1 = new();
  
    repeat(N) begin
      base :: increment();
      b1.increase();
      $write("The static variable  val = %0d", base::val);
      $display("\tThe automatic variable  a = %0d", b1.a);
    end
    
    $display(" ------ class object allocation for another handle b2 --------");
    b2 = new();
    
    repeat(N) begin
      base :: increment();
      b1.increase();
      b2.increase();
      $write("The static variable  val = %0d", base::val);
      $write("\t The automatic variable  a = %0d", b1.a);
      $display("\t The automatic variable  a = %0d", b2.a);
    end
    
  end

endmodule