// coverage sampling methods - with function sampling

// class
class parent;
  randc bit [3:0] val1;
  randc bit [2:0] val2;

  // coverage
  covergroup cg with function sample(bit[1:0] temp);			// implicit delay
    condition : coverpoint val1 iff(temp == 1'b1) {
      bins max[3] = {[1:7]};
    }
    value2: coverpoint val2 iff(temp == 1);
  endgroup
  
  function new();
    cg = new();
  endfunction

endclass

// testbench
module sample_methods;
  bit [1:0]tick;
  
  parent p1; 		// class handle
  
  initial begin
    p1 = new();		// objection allocation to class
    
    repeat(10) begin
      
      if(!p1.randomize())
        $display("randomization error");
      
      tick = $random;		#1;
      $display("val1 = %0d | val 2 = %0d | tick = %0d", p1.val1, p1.val2, tick);
      
      p1.cg.sample(tick);		// manual trigger for sampling
      
      $display("The coverage value = %0.2f%%", p1.cg.get_coverage);
    end
    
    #10;
    $finish;
  end
  
endmodule
