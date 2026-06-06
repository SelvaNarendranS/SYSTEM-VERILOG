// coverage -- conditional coverpoint  iff

class coverage;
  bit [4:0] a; 
  bit [2:0] b;
  
  covergroup cg;
    Label_A : coverpoint a iff(b > 2);		// conditional iff coverpoint
  endgroup
  
  function new();
    cg = new();		// covergroup object allocation
  endfunction
  
endclass

// testbench
module testbench;
  coverage cov;		// class handle
  
  initial begin
    cov = new();		// class object allocation
    
    repeat(100) begin
      
      cov.a = $random;
      cov.b = $random;
      $display("a = %0d | b = %0d", cov.a, cov.b);
      
      cov.cg.sample();		// manual trigger for sampling
      
      $display("The coverage value = %0.2f%%", cov.cg.get_coverage);
    end
    
    #10;
    $finish;
  end
  
endmodule
