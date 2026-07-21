// Q23. a*b==100

class product_of_two;
  rand int unsigned a;
  rand byte unsigned b;
  
  constraint product_of_two_values {
    a * b == 100;
  }
    
endclass


module tb;
  product_of_two h;
    
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
