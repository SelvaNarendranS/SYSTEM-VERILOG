// task - multiple input and output as arguments
module multiple_argument_task;
  int v1, v2;
  int addition, subraction, multiplication;
  real division;
  
  task calculate;
    input int a, b;
    output int add, sub, multiple;
    output real divide;
    
    add 	 = a + b; #2;
    sub 	 = a - b; #1; 
    multiple = a * b; #5;
    divide   = real'(a) / b; 
    
  endtask
  
  initial begin
  
    repeat(5) begin
      v1 = $urandom_range(1, 20); 
      v2 = $urandom_range(1, 20);
      
      calculate(v1, v2, addition, subraction, multiplication, division);
      
      $display("Time = %0t | a = %0d | b = %0d | sum = %0d | sub = %0d | multiple = %0d | divide = %0.3f", $time, v1, v2, addition, subraction, multiplication, division);
    end
  end
endmodule
      