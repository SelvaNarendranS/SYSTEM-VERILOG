// coverage -- basic variable coverpoint

class coverage;
  byte unsigned a; 
  shortint unsigned b;
  
  covergroup cg;
    coverpoint a;		// basic coverpoint
    Label_B : coverpoint b;			// coverpoint with label
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
