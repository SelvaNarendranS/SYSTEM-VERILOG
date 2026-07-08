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
    $display("[%0t] en = %0d | a = %0d | b = %0d", $time, enable, a, b); @(posedge clk);
    
    // true condition --- enable =1 then b should 1 after 3 cycles
    enable = 1;
    a = 1;
    $display("[%0t] en = %0d | a = %0d | b = %0d", $time, enable, a, b);
    @(posedge clk);
    
    a = 0; 
    @(posedge clk);
    @(posedge clk); 
    
    b = 1;
    @(posedge clk);
    b = 0;
    
    // false condition
    enable = 1;
    a = 1;
    b = 0;   @(posedge clk);
    $display("[%0t] en = %0d | a = %0d | b = %0d", $time, enable, a, b);
    a = 0;
    repeat(3) @(posedge clk);
   
    $finish;
  end
  
  property valid;
    @(posedge clk) 
    disable iff (enable)
    (a) | -> ##3 (b == 1);
  endproperty
  
  assert property(valid)
    $display("Pass : [%0t] en = %0d | a = %0d | b = %0d", $time, enable, a, b);
  else
    $display("FAIL : [%0t] en = %0d | a = %0d | b = %0d", $time, enable, a, b);
    
endmodule
