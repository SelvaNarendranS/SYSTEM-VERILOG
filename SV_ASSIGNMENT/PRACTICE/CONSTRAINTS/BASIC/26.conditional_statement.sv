// Q26. Generate
// a>b
// if a>50
// then
// b<20

class conditional_statement;
  rand byte unsigned a;
  rand bit[4:0] b;

  constraint condition {
    if(a > 50) {
      a > b;
    }
    else
      b < 20;
    solve a before b;
  }
    
endclass


module tb;
  conditional_statement h;
    
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
