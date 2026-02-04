// constraint --  foreach constraint
class parent;
  rand byte unsigned a[10];
  
  // constraint
  constraint c1 {
    foreach(a[i]) 			// foreach constraint
      a[i] inside {[1:152]};		// foreach is used for allocating random values for each elements
  }    			
  
  // function to print random generated values
  function void print();
    $display("	a = %0p", a);
  endfunction
  
endclass

module foreach_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing foreach constraint ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule