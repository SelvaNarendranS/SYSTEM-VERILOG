// Basic function
module basic_function;
  int constant_value;
  
  function int return_const();
    int value = 10;
    return value;				// returning a constant value 
  endfunction
  
  initial begin
    
    constant_value = return_const(); #1;
    
    $display("the constant value = %0d", constant_value);
  end
endmodule
    