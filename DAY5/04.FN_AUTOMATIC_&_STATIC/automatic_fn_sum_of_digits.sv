// Automatic function
// automatic function that calculates the sum of digits of any integer.
module automatic_function;
  int num;
  int sum;
  
  initial begin
    repeat(10) begin
      num = $urandom_range(30, 0);
      sum = sum_digit(num);
      $display("num = %0d | sum od digits = %0d", num, sum);
    end
  end
  
  function automatic int sum_digit(int a);
    int temp;
    while(a !=0) begin
      temp = a % 10;
      sum_digit += temp;
      a /= 10;  
    end
  endfunction
  
endmodule