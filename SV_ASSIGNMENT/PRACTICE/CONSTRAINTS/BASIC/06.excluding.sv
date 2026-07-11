// Q6. Generate values between 0 and 100 excluding 25-50.

class excluding;
  rand int a;
  
  constraint excluding_values {
    a inside {[0:100]};
    !(a inside {[25:50]});
  }
  
endclass

module tb;
  excluding h;
    
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
