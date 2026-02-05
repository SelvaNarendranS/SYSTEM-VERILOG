// constraint --  unique constraint  -- unique array elements
class parent;
  rand bit a;
  rand bit [7:0]b[5];
  
  // constraint
  constraint c1 {
    foreach(b[i])
      (a) -> (b[i] inside {[1:9]});      
    unique {b};				// unique constraint
  }    						// unique keyword is used to prevent the variable values to generate only unique (no duplicate values -- repeated values) within the given constraint -- once it prints all possible values means repeats the cycle  
  
  // function to print random generated values
  function void print();
    $display("	a = %0d | b = %0p	 	 %0s", a, b, (!a) ? "-------  a != 1" : "--  a == 1");
  endfunction
  
endclass

module unique_array_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing unique constraint -- unique array elements ramdomized values----------------");
    repeat(10) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule