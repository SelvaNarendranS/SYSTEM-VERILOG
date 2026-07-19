// Q19. Generate Fibonacci sequence.

class fibonacci_sequence;
  rand int unsigned a[];
  
  constraint fibonacci_seq {
    a.size() inside {[1:100]};
    
    a[0] == 1;
    a[1] == 1;
    
    foreach(a[i]) {
      if(i>1)
        a[i] == a[i-1] + a[i-2];
    } 
  }
    
endclass


module tb;
  fibonacci_sequence h;
    
  initial begin
    h = new();
    
    repeat(20) begin
      if(!h.randomize())
        $display("Randomization FAILED");
      else
        $display("[%0t] Randomization PASSED, a = %0p", $time, h.a);
      #1;
    end
    
    #10;
    $finish;
  end
  
endmodule 
