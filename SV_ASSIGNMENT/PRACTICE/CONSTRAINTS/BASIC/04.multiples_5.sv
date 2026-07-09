// Q4. Generate multiples of 5..

class multiples;
  rand byte unsigned a;
  
  constraint multiples_5_values {
    a % 5 == 0;
  }
  
endclass

module tb;
  multiples h;
    
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
