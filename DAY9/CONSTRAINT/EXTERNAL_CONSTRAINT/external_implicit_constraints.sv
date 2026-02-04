// constraint -- external constraints -- -- implicit type
class parent;
  rand int unsigned a;
  rand byte b;
  
  // external implicit constraint
  constraint c1;			// external inplicit constraint prototype	-- due to implicit type prototype may or may not be defined
//   extern constraint c2;			// external inplicit constraint prototype
  
  // function to print random generated values
  function void print();
    $display("a = %0d | b = %0d ", a, b);
  endfunction
  
endclass

// constraint definition --- constraint class name ::(scope resolution) constraint name{ condition/ expression;}
constraint parent::c1 {		// not mandatory to define constraint due to implicit type
  (a > 1000) && (a < 5000);	// Relational / Logical Constraint
  b inside {[100:250]};		// range constraint
}			// using scope resolution constraint can be defined outside the class

module external_inplicit_constraints;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing external implicit ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule