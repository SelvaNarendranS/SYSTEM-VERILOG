// Arithmetic operators
module arithmetic_operators;
  int a, b, c, d;
  int sum, difference, multiply, divide, modulo, power;

  initial begin
    // initialze
    a = 31644; b = 263;
        
    $display("\na = %0d |  b= %0d", a, b);
    
    sum = a + b;								// Addition
    $display("sum of a & b = %0d", sum);
    
    difference = a - b;							// difference
    $display("difference of a & b = %0d", difference);
    
    multiply = a * b;							// multiply
    $display("multiply of a & b = %0d", multiply);
    
    divide = a / b;								// divide
    $display("divide of a & b = %0d", divide);
    
    c = 2; d = 5;
    power = c ** d;								// power
    $display("power of c & d = %0d\n", power);
  end
endmodule
    