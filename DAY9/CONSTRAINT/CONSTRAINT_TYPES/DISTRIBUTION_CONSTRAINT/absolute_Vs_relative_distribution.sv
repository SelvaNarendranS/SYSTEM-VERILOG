// constraint --  distribution constraint
class parent;
  rand bit [7:0]a;
  rand bit [7:0]b;
  
  // constraint
  constraint c1 {							
    a dist {[2:5] := 30, [10:15] := 80};			// Absolute weight distribution
    b dist {[2:5] :/ 30, [10:15] :/ 80};			// Relative (Proportional) Distribution
  }    						
  
  // function to print random generated values
  function void print();
    $display("	a = %0d 	| b = %0d", a, b);
  endfunction
  
endclass

module absolute_Vs_relative_distribution_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing absolute Vs relative distribution constraint ramdomized values----------------");
    $display("\tAbsolute | relative");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule
