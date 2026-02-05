// constraint -- if - conditional constraint
class parent;
  rand bit unsigned [1:0]a;
  rand byte unsigned b;
  randc byte unsigned c;
  static bit [1:0]i;
  
  // if conditional operator
  constraint c1 {
    if(a < b)						// conditional operator
      c inside {[1 : 60]};		
  }    								// only if condition is used -- for false condition become unconstrained 
  
  // function to print random generated values
  function void print();
    $display("	a = %0d | b = %0d | c = %0d	 --	 %0s", a, b, c, (a < b) ? "a < b" : "");
  endfunction
  
endclass

module if_conditional_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing only if conditional constraint ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule