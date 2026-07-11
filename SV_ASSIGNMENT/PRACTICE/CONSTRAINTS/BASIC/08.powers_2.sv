// Q8. Generate powers of two.

class power;
  rand longint unsigned a;
  rand shortint unsigned exp;
  
  constraint power_values {
//     a < 50;
    exp < 50;
    a == (1'b1 << exp);
  }
  
//   function void post_randomize();
//     a = 2**a;
//   endfunction
  
endclass

module tb;
  power h;
    
  initial begin
    h = new();
    
    repeat(20) begin
      if(!h.randomize())
        $display("Randomization FAILED");
      else
        $display("[%0t] Randomization PASSED a = %0d, exp = %0d", $time, h.a, h.exp);
      #1;
    end
    
    #10;
    $finish;
  end
  
endmodule 
