// Function arguments - constant reference(call by constant reference)
module fn_argument_constant_reference;
  int a[5];
  int sum;
  integer count;
  
  function int add(const ref int num[$size(a)]);			// constant reference function
    int temp = 0;
    
    $display("received arguments num = %p", num);
    // adding
    foreach(num[i])
      temp += num[i];
    
    count++;							// global access incrementing
    return temp;
    
  endfunction
  
  initial begin
    count = 0;
    sum = 0;
    
    // initialize
    repeat(5) begin
      foreach(a[i]) begin
        a[i] = $urandom_range(1, 20);
      end
      
      $display("\ninput a = %p", a); #1;
      
      sum = add(a);						// function call
      $display("after function execution a = %p | sum = %0d | iteration = %0d", a, sum, count);
    end
  end
endmodule
      