// Q16. Generate palindrome array.

class palindrome;
  rand int a[10];
  
  constraint palindrome_array {
    foreach(a[i]) {
      a[i] inside {[0:100]};

      a[a.size()-1-i] == a[i]; 
    }
  }
  
endclass


module tb;
  palindrome h;
    
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
