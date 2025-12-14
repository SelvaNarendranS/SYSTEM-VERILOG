// Static function
module static_function;
  int count;
  
  function static void behaviour();
    int value;
    value = 1;
    $display("In function The value = %0d | the count = %0d", value, count);
    value++;
    count++;
  endfunction
  
  initial begin
    // initialize
    count = 1;
    
    behaviour(); #1;
    behaviour(); #1;
   	behaviour();
    behaviour();
    
  end
endmodule
    