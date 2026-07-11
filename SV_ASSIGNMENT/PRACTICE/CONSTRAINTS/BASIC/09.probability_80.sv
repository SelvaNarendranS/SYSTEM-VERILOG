// Q9. Randomize boolean signal with 80% probability of 1.

class probability;
  rand bit a;
  
  constraint probability_values {
    a dist {1 := 80, 0 := 20};
   }
    
endclass

module tb;
  probability h;
    
  initial begin
    h = new();
    
    repeat(20) begin
      if(!h.randomize())
        $display("Randomization FAILED");
      else
        $display("[%0t] Randomization PASSED a = %0d", $time, h.a);
      #1;
    end
    
    #10;
    $finish;
  end
  
endmodule 
