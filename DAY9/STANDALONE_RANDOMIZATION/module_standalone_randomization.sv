// Global / Standalone Constraint Randomization  - module level - with and without constraint

module module_global_randomize;
  byte unsigned a;
  int unsigned b;				// normal variable  
  
  initial begin
    
    $display("\n--------------------- The list of module level global randomized values ----------------");
    
    repeat(10) begin
      std::randomize(a);					// global randomize without constraint
      std::randomize(b) with {b inside {[30:91], 36815, 649655};};	// global randomize with constraint
      
      $display("a = %0d | b = %0d", a, b);
    end
  end
  
endmodule