// constraint -- conditional constraint  -- ternary operator
class parent;
  rand bit unsigned [1:0]a;
  rand byte unsigned b;
  randc byte unsigned c;
  
  // ternary operator
  constraint c1 {
    ((a < b) ? (c == b) : (c > b)); 		// in ternary operator only relational operator are supported
  }   
  
  //   ((a < b) ? (c inside {[1:20]}); : c > b); 	// this will lead to error because ; : should not come together 
  
  // function to print random generated values
  function void print();
    $display("	a = %0d | b = %0d | c = %0d	 --	 %0s", a, b, c, (a < b) ? "c = b" : "c > b");
  endfunction
  
endclass

module ternary_conditional_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing ternary operator -- conditional constraint ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule