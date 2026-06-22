//  Interdependent Variables
// Write a class coordinates with two random integers x and y (both 16-bit signed). Write constraints to ensure:
// x is never 0.
// x is never equal to y.
// The absolute difference between x and y is always greater than 50.

class interdependent;
  rand shortint x;
  rand shortint y;
  
  constraint rand_gen {
    x != 0;
    x != y;
    ((x-y) > 50) || ((y-x) > 50);
  }
  
endclass

module tb;
  interdependent pack;

initial begin
    pack = new();
    
    repeat(10) begin
      if(!pack.randomize())
        $display("randomization faied");
      else
        $display(" x = %0d | y = %0d", pack.x, pack.y);
    end
  end
  
endmodule
