// constraint -- basic constraint
class parent;
  rand int unsigned a;
  
  // constraint
  constraint c1 {
    a < 1000;			// relational constraint
  }							// created constraint sets the random variable range should be 0 - 1000
  
  // function to print random generated values
  function void print();
    $display("a = %0d", a);
  endfunction
  
endclass

module basic_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing basic constraint ramdomized values----------------");
    repeat(5) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule