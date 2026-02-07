// constraint --  distribution constraint  -- Relative (Proportional) Distribution
class parent;
  rand bit [7:0]a;
  rand bit [7:0]b;
  
  // constraint
  constraint c1 {							// Relative (Proportional) Distribution
    a dist {[2:9]:/80, [70:80] :/ 50};						
    b dist {[2:5] :/ 30, [10:15] :/ 80};			// specific set of range
  }    						// distribition constraint which gives weightage to the specific valve/ specific range mentioned in the constraint ----  more the weightage means more possibility times the value get randomized
  
  						// ":/" -- relative distribution which gives shared weights to the range values -- eg., [1:3] := 30 --> 1 = 10%, 2 = 10%, 3 = 10% -- all values has shared weights any value can be randomized accordingly 
  
  // function to print random generated values
  function void print();
    $display("	a = %0d | b = %0d", a, b);
  endfunction
  
endclass

module relative_distribution_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing distribution constraint -- relative distribution constraint ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule