// Q15. Array should contain exactly three zeros.

class exactly_3_zero;
  rand int a[10];
  int zero;
  
  constraint exactly_3_zero_array {
    foreach(a[i])
      a[i] inside {[0:100]};
    
    a.sum(item) with (int'(item == 0)) == 3;
  }
endclass


module tb;
  exactly_3_zero h;
    
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
