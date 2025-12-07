// conditional statements
// check odd even using if else condition
module odd_even;
  byte a;
  
  initial begin
    // initialize
    repeat(10) begin
      a = $urandom; #1;
      if( a % 2 == 0)
        $display("a = %0d - Even", a);
      else
        $display("a = %0d - Odd", a);
    end
  end
endmodule