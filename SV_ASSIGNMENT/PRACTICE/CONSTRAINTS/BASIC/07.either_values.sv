// Q7. Generate either 0 or 100 only.

class either;
  rand int a;
  
  constraint either_values {
    a dist {0 := 50, 100 := 50};
  }
  
endclass

module tb;
  either h;
    
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
