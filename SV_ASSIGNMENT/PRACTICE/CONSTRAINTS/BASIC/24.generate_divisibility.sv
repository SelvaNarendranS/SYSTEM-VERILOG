// Q24. Generate a divisible by b

class generate_divisibility;
  rand byte unsigned a;
  rand bit[4:0] b;

  constraint divisibility {
    b > 0;
    
    b inside {[2:31]};
    
    a % b == 0;
  }
    
endclass


module tb;
  generate_divisibility h;
    
  initial begin
    h = new();
    
    repeat(20) begin
      if(!h.randomize())
        $display("Randomization FAILED");
      else
        $display("[%0t] Randomization PASSED, a = %0d | b = %0d", $time, h.a, h.b);
      #1;
    end
    
    #10;
    $finish;
  end
  
endmodule 
