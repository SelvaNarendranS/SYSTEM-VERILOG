// function definition methods
// function pass by name 
module pass_by_name;
  int a, b;
  string rn_value;
  
  function string return_value(int value1, value2);
    
    $display("Received 2value to function value1, value2 = %0d, %0d", value1, value2);
    
    return ((a == b) ? "EQUAL" : "NOT EQUAL");				// global variable access and conditional statement 
    
  endfunction
  
  initial begin
    
    // initialize
    a = 1634; 
    b = 145; #1;
    
    rn_value = return_value(.value1(a), .value2(b));
    
    $display("pass by name => sent --- a = %0d | b = %0d - returned value from function = %0s\n", a, b, rn_value);
    
    a = 417; 
    b = 417; #1;
    
    rn_value = return_value(.value1(a), .value2(b));
    
    $display("pass by name => sent --- a = %0d | b = %0d - returned value from function = %0s", a, b, rn_value);
  end
endmodule

    
