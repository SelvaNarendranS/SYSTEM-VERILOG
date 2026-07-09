// Q3. Generate only odd numbers.

class odd;
  rand byte unsigned a;
  
  constraint even_values {
    a % 2 == 1;
  }
  
endclass

module tb;
  odd h;
    
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
