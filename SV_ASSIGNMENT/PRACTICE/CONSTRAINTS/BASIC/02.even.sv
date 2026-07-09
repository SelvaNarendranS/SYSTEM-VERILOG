// Q2. Generate only even numbers from 0 to 100.

class even;
  rand int unsigned a;
  
  constraint even_values {
    a % 2 == 0;
    a inside {[0:100]};
  }
  
endclass

module tb;
  even h;
    
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
