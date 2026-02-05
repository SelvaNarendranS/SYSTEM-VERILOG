// constraint --  implication constraint
class parent;
  rand bit unsigned [1:0]a;
  rand byte unsigned b;
  
  // constraint
  constraint c1 {
    (a < 2) -> (b inside {[50:250]});			// implication constraint
  }    			// it's just like if condition -- but it tell only about if part only no else part -- it is more perfect than "if"
  				// If left side true -> right must be true
  
  // function to print random generated values
  function void print();
    $display("	a = %0d | b = %0d	 	 %0s", a, b, (a < 2) ? "--  a < 2" : "");
  endfunction
  
endclass

module implication_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing implication constraint ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule