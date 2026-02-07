// constraint --  constraint mode
class parent;
  rand bit [7:0]a;
  
  // constraint
  static constraint c1 {			// static constraint
    a == 10;
  }  					// static constraint has a single memory location only in the class --- so it is common to all of it's child classes --- if enable or disable is done in any class child objects it will affect to all other child objects
  
  // function to print random generated values
  function void print();
    $display("	a = %0d", a);
  endfunction
  
endclass

module constraint_mode;
  parent h1, h2, h3;		// class handle
  
  initial begin
    h1 = new();		// object allocation
    h2 = new();
    h3 = new();
    
    $display("\n----------printing  static constraint ramdomized values----------------");
    repeat(10) begin
      h1.randomize();		// calling randomize function for randomize
    
      h1.print();	
    end  
    
    $display("\nconstraint disable -- in h2 handle");
    h2.c1.constraint_mode(0);		// disabling constraint in h2 handle 
    repeat(10) begin
      h1.randomize();		// calling randomize function for randomize
    
      h1.print();	
    end					// due to the static constraint th e constraint is shared between all the (class handles)objects --- it reflects to it's class objects
    
    $display("\nconstraint enable -- in h3 handle");
    h3.c1.constraint_mode(1);
    repeat(10) begin
      h1.randomize();		// calling randomize function for randomize
    
      h1.print();	
    end
  end
endmodule