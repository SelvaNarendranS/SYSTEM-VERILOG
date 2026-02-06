// constraint --  solve before constraint
class parent;
  rand int unsigned a;
  rand int unsigned b;
  
  // constraint
  constraint c1 {
    a inside {[1: 100]};
    b == a / 2;
    solve a before b;		// solve before constraint
  }    						// it is used to control the constraint solver to execute first -- the "solve" variable and then only the "before" will get executed
  
  // function to print random generated values
  function void print();
    $display("	a = %0d | b = %0d", a, b);
  endfunction
  
endclass

module solve_before_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing solve before constraint ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule