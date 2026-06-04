// coverage sampling methods - manual method

// class
class parent;
  randc bit [2:0] val1;
  randc bit [1:0] val2;

  // coverage
  covergroup cg;			// implicit delay
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
    p1 = new();		// objection allocation to class
    
    repeat(10) begin
      
      if(!p1.randomize())
        $display("randomization error");
      $display("val1 = %0d | val 2 = %0d", p1.val1, p1.val2);
      
      p1.cg.sample();		// manual trigger for sampling
      
      $display("The coverage value = %0.2f%%", p1.cg.get_coverage);
    end
    
    #10;
    $finish;
  end
  
endmodule
