// Q14. Sum of array elements should be 100.

class sum_of_elements;
  rand int unsigned a[10];  
  
  constraint sum_of_array_elements {
    foreach(a[i])
      a[i] inside {[1:100]};
    a.sum(item) with (32'(item)) == 100;
  }
endclass


module tb;
  sum_of_elements h;
    
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
