// Q25. Generate  a!=b

class generate_not_equal;
  rand byte unsigned a;
  rand bit[4:0] b;

  constraint not_equal {
    a != b;
  }
    
endclass


module tb;
  generate_not_equal h;
    
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
