module timing;
  bit clk, start, done;
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    start = 0;
    done = 0;
    $display("[%0t] start = %0d | done = %0d", $time, start, done); @(posedge clk);
    
    // true condition --- enable =1 then b should 1 after 3 cycles
    start = 1;
    done = 1;
      $display("[%0t] start = %0d | done = %0d", $time, start, done);
    repeat(3) @(posedge clk);
    
    // false condition
    // true condition --- enable =1 then b should 1 after 3 cycles
    start = 1;
    done = 1;
      $display("[%0t] start = %0d | done = %0d", $time, start, done);
    repeat(1) @(posedge clk);
    
    done = 0;
   
    $finish;
  end
  
  property valid;
    @(posedge clk) start |=> ##[1:3] done;
  endproperty
  
  assert property(valid)
    $display("PASS : [%0t] start = %0d | done = %0d", $time, start, done);
  else
    $display("FAIL : [%0t] start = %0d | done = %0d", $time, start, done);
    
endmodule
