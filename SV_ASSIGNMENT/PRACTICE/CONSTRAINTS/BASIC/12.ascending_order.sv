// Q12. Generate ascending array.

class ascending_order;
  rand int unsigned a[10];
  
  
  constraint ascending_order_array {    
    foreach(a[i]) {
      a[i] inside {[0:100]};
      
      if(i > 0)
        a[i] >= a[i-1];
    }
  }
      
//   function void post_randomize();
//     a.sort();
//   endfunction  
  
endclass

module tb;
  ascending_order h;
    
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
