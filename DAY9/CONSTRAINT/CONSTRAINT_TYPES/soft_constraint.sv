// constraint --  soft constraint
class parent;
  rand int unsigned a;
  rand int unsigned b;   						
  
  // function to print random generated values
  function void print();
    $display("	a = %0d | b = %0d", a, b);
  endfunction
  
  // constraint
  constraint c1 {						// master constraint
    soft a > 20; 
    soft a < 100;					// declaring the variable a as soft constraint because for later the constraint permits to edit and "HARD" the constraint in child class or in module (randomization calling -- inline )     --- before add "soft" in prefix of the variable allows only the variable can be modified and can convert into HARD to solver
    b inside {[900:1053]};
  }
  
endclass

module soft_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing soft constraint ramdomized values----------------");
    repeat(10) begin
      
      // calling randomize function for randomize
      p1.randomize() with {						
        a inside {[100: 200]};			// soft constraint
      };							// constraint condition/expression can be overritten and "HARD" the master constraint --- only modifing the required variable condition which has master declared as "soft" -- to make the variable HARD to the solver -- the solver only sees the HARD constraint only
      p1.print();	
    end  
  end
endmodule