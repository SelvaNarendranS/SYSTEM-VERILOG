// 21. Two variables
// a
// b
// Generate
// a < b

class two_variables;
  rand int a;
  rand byte unsigned b;
  
  constraint two_variables_randomize {
    a < b;
  }
    
endclass


module tb;
  two_variables h;
    
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
