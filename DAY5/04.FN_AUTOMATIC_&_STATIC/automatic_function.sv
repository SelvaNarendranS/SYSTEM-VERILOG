// Automatic function
module automatic_function;
  int count;
  
  function automatic int behaviour(int a);
    int value = 1;
    value++;
    a++;
    $display("In function The value = %0d | the count = %0d", value, a);
  endfunction
  
  initial begin
    // initialize
    count = 1;
    
      behaviour(count); #1;
      behaviour(count); #1;
      behaviour(count);
      behaviour(count);
 
  end
endmodule
    
