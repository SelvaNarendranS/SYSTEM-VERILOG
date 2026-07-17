// Q17. Generate alternating even and odd values.

class alternating_odd_even;
  rand int a[10];
  
  constraint alternating_odd_even_array {
    foreach(a[i]){
      a[i] inside {[0:100]};   
      
      if(i > 0)
        (a[i-1] % 2 == 0) != (a[i] % 2 == 0);
    }    
  }

  
endclass


module tb;
  alternating_odd_even h;
    
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
