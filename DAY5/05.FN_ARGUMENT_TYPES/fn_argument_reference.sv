// Function arguments - reference(call by reference
module fn_argument_reference;
  int a, b;
  integer count;
  
  function void swap(ref int num1, num2);			// reference function
    int temp;
    
    $display("received arguments num1 = %0d | num2 = %0d", num1, num2);
    // swaping
    temp = num1;
    num1 = num2;
    num2 = temp;
    count++;							// global access incrementing
  endfunction
  
  initial begin
    count = 0;
    
    // initialize
    repeat(5) begin
      a = $urandom_range(1, 20);
      b = $urandom_range(1, 20);
      $display("\ninput a = %0d | b = %0d", a, b); #1;
      
      swap(a, b);						// function call
      $display("after function execution a = %0d | b = %0d | iteration = %0d", a, b, count);
    end
  end
endmodule
      