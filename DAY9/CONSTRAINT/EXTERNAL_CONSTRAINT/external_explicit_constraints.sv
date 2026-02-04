// constraint -- external explicit constraints
class parent;
  rand int unsigned a;
  rand byte b;
  
  // extern constraint
  extern constraint c1;			// explicit constraint prototype  -- due to extern keyword prototype must be mandatory to be definded
  
  // function to print random generated values
  function void print();
    $display("a = %0d | b = %0d ", a, b);
  endfunction
  
endclass

// constraint definition --- constraint class name ::(scope resolution) constraint name{ condition/ expression;}
constraint parent :: c1 {			// mandatory to define constraint due to extern keyword
  (a < 1000);	// Relational / Logical Constraint
  b inside {[1:156]};		// range constraint
}			// using (scope resolution) and extern keyword constraint can be defined outside the class

module external_explicit_constraints;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing external explicit ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end 
    
  end
endmodule