// constraint -- over-riding constraints
class parent;
  rand int unsigned a;
  rand byte unsigned b;
  
  // constraint
  constraint c1 {
    a > 1000 && a < 5000;	// Relational / Logical Constraint
    b inside {[1:200]};		// range constraint
  }							
  
  // function to print random generated values
  function void print();
    $display("a = %0d | b = %0d ", a, b);
  endfunction
  
endclass

// extended class
class child extends parent;
  
  // over riding constraint from parent
   constraint c1 {
     a != 5 && (a inside {[1:10]});		// Relational / range constraint
     b < 123;							// logical constraint
  }
endclass

module over_riding_constraints;
  child c1;		// class child handle
  parent p1;	// class parent handle
  
  initial begin
    c1 = new();		// child object allocation
    p1 = new();		// parent object allocation
    
    $display("\n----------printing parent ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end 
    
    
    $display("\n----------printing child -- overwritten constraint ramdomized values----------------");
    repeat(10) begin
      c1.randomize();		// calling randomize function for randomize
    
      c1.print();	
    end 
    
  end
endmodule