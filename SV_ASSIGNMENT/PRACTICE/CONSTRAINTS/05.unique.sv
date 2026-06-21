// Write a class packet containing a fixed-size array payload[10] of 8-bit integers. Write a constraint using foreach and unique to ensure that all 10 elements have distinct values. (Try to solve it both with the unique keyword and without it, using nested foreach constraints).

class packet;
  rand bit [7:0]payload_a[10];
  rand bit [7:0]payload_b[10];
  
  constraint with_unique{
    unique {payload_a};
  }
  
  constraint without_unique{
    foreach(payload_b[i]) {
      foreach(payload_b[j]) {
        if(i < j)
          payload_b[i] != payload_b[j];
      }
    }
  }
  
endclass

module tb;

  packet pack;
  
  initial begin
    pack = new();
    
    repeat(10) begin
      if(!pack.randomize())
        $display("randomization faied");
      else
        $display("payload_a = %0p | payload_b = %0p", pack.payload_a, pack.payload_b);
    end
  end
  
endmodule
