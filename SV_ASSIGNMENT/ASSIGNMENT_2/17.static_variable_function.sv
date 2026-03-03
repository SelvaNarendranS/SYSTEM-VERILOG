// Create a class H with a static variable and a static function and increment the value of the static variable.

class H;
  static int val = 0;
  
  static function void increment();
    val++;				// static variable increment	
  endfunction
  
endclass

module static_variable_function;
  
  H h1, h2; 		// class handle
  
  initial begin
    
    repeat(5) begin
      H :: increment();
      $display("The static variable  val = %0d", H::val);
    end
    
    $display(" ------ class object allocation handle h1 --------");
    h1 = new();
  
  repeat(5) begin
      H :: increment();
      $display("The static variable  val = %0d", H::val);
    end
    
    $display(" ------ class object allocation for another handle h2 --------");
    h2 = new();
    
    repeat(5) begin
      H :: increment();
      $display("The static variable  val = %0d", H::val);
    end
    
  end

endmodule