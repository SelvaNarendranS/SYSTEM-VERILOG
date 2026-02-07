// constraint --  distribution constraint  -- Absolute (Fixed) Weight Distribution
class parent;
  rand bit [7:0]a;
  rand bit [7:0]b;
  
  // constraint
  constraint c1 {							// Absolute weight distribution constraint
    a dist {0:=10, 1:=70, 2:=20};			// specific set of values			
    b dist {2 := 30, [10:15] := 80};			// specific set of range
  }    						// distribition constraint which gives weightage to the specific valve/ specific range mentioned in the constraint ----  more the weightage means more possibility times the value get randomized
  
  						// ":=" -- Absolute weight distribution which gives equal weights to the range values -- eg., [1:3] := 30 --> 1 = 30%, 2 = 30%, 3 = 30% -- all values has equal weights any value can be randomized accordingly 
  
  // function to print random generated values
  function void print();
    $display("	a = %0d | b = %0d", a, b);
  endfunction
  
endclass

module absolute_distribution_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing distribution constraint -- absolute weight distribution constraint ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule
