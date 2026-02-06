// constraint -- relational constraint 
class parent;
  rand int unsigned a;
  rand byte unsigned b;
  
  // constraint
  constraint c1 {
    a > b;	// Relational constraint
  }							
  
  // function to print random generated values
  function void print();
    $display("a = %0d | b = %0d ", a, b);
  endfunction
  
endclass

module relational_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing relational constraint ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule