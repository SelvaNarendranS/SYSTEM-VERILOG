// function definition methods
// function default value as arguments 
module default_value_as_arguments;
  int a, b;
  byte rn_value;
  
  function logic [7:0] return_value(bit [1:0]value1 = 3, 
                                   bit [3:0]value2 = 12);
    
    $display("default 2value to function value1, value2 = %0d, %0d", value1, value2);
    
    return (value2 << value1);
    
  endfunction
  
  initial begin
    
    rn_value = return_value();					// only calling the function without any arguments passed 
    
    $display("returned value(default arguments) from function = %0d\n", rn_value);
    
    // initialize
    a = 1; 
    b = 7; #1;
    
    rn_value = return_value(a, b);					// passing arguments and overwriting the default values
    
    $display("Positional arguments => sent --- a = %0d | b = %0d - returned value from function = %0d", a, b, rn_value);
  end
endmodule
    