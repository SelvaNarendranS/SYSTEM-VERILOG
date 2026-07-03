module tb;
  bit clk;
  bit enable;
  bit a, b;
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    enable = 0;
    a = 0;
    b = 0;
    $display("[%0t] en = %0d | a = %0d | b = %0d", $time, enable, a, b); #6
    
    repeat(30) begin
      enable = $random;
      a = $random;
      b = $random;		
      $display("[%0t] en = %0d | a = %0d | b = %0d", $time, enable, a, b);		#6;
    end
    
    $finish;
  end
  
  property valid;
    @(posedge clk) enable |-> ((a | b) == 1);
  endproperty
  
  assert property(valid)
    $display("Pass : [%0t] en = %0d | a = %0d | b = %0d", $time, enable, a, b);
  else
    $display("FAIL : [%0t] en = %0d | a = %0d | b = %0d", $time, enable, a, b);
    
endmodule
