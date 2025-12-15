// Function arguments - constant reference(call by constant reference)
module fn_argument_constant_reference;
  int a[];							// dynamic array
  int average;
  integer count;
  
  function int avg(const ref int num[]);			// constant reference function
    int temp = 0;
    
    $display("received arguments num = %p", num);
    // adding
    foreach(num[i])
      temp += num[i];
    temp /= num.size();
    
    count++;							// global access incrementing
    return temp;
    
  endfunction
  
  initial begin
    count = 0;
    average = 0;
    
    a = new[10];						// dynamic array array declare
    // initialize
    repeat(5) begin
      foreach(a[i]) begin
        a[i] = $urandom_range(1, 20);
      end
      
      $display("\ninput a = %p", a); #1;
      
      average = avg(a);						// function call
      $display("after function execution a = %p | average = %0d | iteration = %0d", a, average, count);
    end
  end
endmodule
      