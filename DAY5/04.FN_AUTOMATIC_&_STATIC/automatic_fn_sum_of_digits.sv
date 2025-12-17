// Automatic function
// automatic function that calculates the sum of digits of any integer.
module automatic_function;
  int num;
  int sum, count;
  
  initial begin
    repeat(10) begin
      num = $urandom_range(30, 0);
      sum = sum_digit(num, count);
      $display("num = %0d | sum of digits = %0d | count = %0d", num, sum, count);
    end
  end
  
  function automatic int sum_digit(int a, output int b);
    int temp, b = 0;
    while(a !=0) begin
      temp = a % 10;
      sum_digit += temp;
      a /= 10;  
    end
    b++;
  endfunction
  
endmodule
