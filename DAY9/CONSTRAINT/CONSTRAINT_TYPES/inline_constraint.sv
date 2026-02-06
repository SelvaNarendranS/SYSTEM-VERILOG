// constraint --  inline constraint
class parent;
  rand int unsigned a;
  rand int unsigned b;   						
  
  // function to print random generated values
  function void print();
    $display("	a = %0d | b = %0d", a, b);
  endfunction
  
endclass

module inline_constraint;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing inline constraint ramdomized values----------------");
    repeat(10) begin
      // calling randomize function for randomize
      p1.randomize() with {						
        a inside {[1: 100]};
        b dist {[1:20] := 50, [30:90] := 70};
      };							// delcaring the constraint at the randomize calling --- defining the constraint using "with" -- and ended with semicolon
    
      p1.print();	
    end  
  end
endmodule