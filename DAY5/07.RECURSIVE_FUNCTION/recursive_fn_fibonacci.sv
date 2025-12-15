// Recursive function
// fibonacci numbers
module recursive_fn_fibonacci;
  int range;
  int number;
  
  function automatic int fibonacci_no(int value);
    
    if (value < 0) begin
      return 0;
    end
    
    if (value <= 1) begin
      return value;
    end
    
    // Recursive function -  Call itself and sum
    return fibonacci_no(value - 1) + fibonacci_no(value - 2);
  endfunction
  
  initial begin
    // initialize
    repeat(5) begin
      range = $urandom_range(1, 20);
      number = fibonacci_no(range);
    
      $display("The %0dth fibanacci number is = %0d", range, number); #1;
    end
  end
endmodule