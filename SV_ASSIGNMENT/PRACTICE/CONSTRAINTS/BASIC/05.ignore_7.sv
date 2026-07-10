// Q5. Generate values except 7.

class ignore;
  randc bit [3:0]a;
  
  constraint ignore_values {
    a != 7;
  }
  
endclass

module tb;
  ignore h;
    
  initial begin
    h = new();
    
    repeat(20) begin
      if(!h.randomize())
        $display("Randomization FAILED");
      else
        $display("[%0t] Randomization PASSED a = %0d", $time, h.a);
      #1;
    end
    
    #10;
    $finish;
  end
  
endmodule 
