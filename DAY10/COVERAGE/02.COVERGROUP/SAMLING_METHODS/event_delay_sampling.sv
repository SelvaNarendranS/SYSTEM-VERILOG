// coverage sampling methods - event delay

// class
class parent;
  bit clk;
  randc bit [2:0] val1;
  randc bit [1:0] val2;

  // coverage
  covergroup cg @(posedge clk);			// implicit delay
    coverpoint val1;
    value2: coverpoint val2;
  endgroup
  
  function new();
    cg = new();
  endfunction

endclass

// testbench
module sample_methods;
  
  parent p1; 		// class handle
  
  initial begin
    #1;
    forever #5 p1.clk = ~p1.clk;
  end
  
  initial begin
    p1 = new();		// objection allocation to class
    
    repeat(10) begin
      @(posedge p1.clk);
      
      if(!p1.randomize())
        $display("randomization error");
      
//       @(posedge p1.clk);
//       p1.cg.sample();			// explicit delay
      $strobe("val1 = %0d | val 2 = %0d", p1.val1, p1.val2);
      
      @(posedge p1.clk);
      $display("The coverage value = %0.2f%%", p1.cg.get_coverage);
    end
    
    #10;
    $finish;
  end
  
endmodule
