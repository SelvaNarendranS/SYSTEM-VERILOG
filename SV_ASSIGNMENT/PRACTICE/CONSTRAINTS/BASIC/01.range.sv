// Q1. Randomize a variable between 10 and 20.

class range;
  rand shortint unsigned a;
  
  constraint range_values {
    a inside {[10:20]};
  }
  
endclass

module tb;
  range r;
    
  initial begin
    r = new();
    
    repeat(20) begin
      if(!r.randomize())
        $display("Randomization FAILED");
      else
        $display("[%0t] Randomization PASSED a = %0d", $time, r.a);
      #1;
    end
    
    #10;
    $finish;
  end
  
endmodule 
