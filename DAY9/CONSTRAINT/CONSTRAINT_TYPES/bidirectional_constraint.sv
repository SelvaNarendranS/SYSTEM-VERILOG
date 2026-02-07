// constraint --  bidirectional constraint
class parent;
  rand bit [7:0]a;
  
  // constraint
  constraint c1 {		// hard constraint	
    a > 10;			// bidirectional constraint	
    a < 25;
  }  
  
  constraint c2 {		// hard constraint	
    a > 14;			// bidirectional constraint
  }
  					// constraint - c1 & c2 both are hard constraint but -- c1 and c2 express the condition to the came variable bidirectionaly ---> c1 --- tells a should start from 10 ---> but in c2 -- a should start from 14 here the value get overcorrected by by the c2 hard constraint. -----> this happens due to all constraints are executed parallelly
  
  // function to print random generated values
  function void print();
    $display("	a = %0d", a);
  endfunction
  
endclass

module bidirectional_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing bidirectional constraint ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule