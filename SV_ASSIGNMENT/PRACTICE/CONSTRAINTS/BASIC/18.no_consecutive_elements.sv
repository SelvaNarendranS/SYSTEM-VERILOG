// Q18. Generate array with no consecutive equal elements.

class no_consecutive_equal;
  rand int a[10];
  
  constraint no_consecutive_equal_elements {
    foreach(a[i])
      a[i] inside {[0:100]};
    
    foreach(a[i]){
      foreach(a[j]){
        if(i > j)
          a[i-1] != a[i];
      }
    }
  }  
endclass


module tb;
  no_consecutive_equal h;
    
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
