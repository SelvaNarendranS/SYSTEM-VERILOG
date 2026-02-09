// Write a constraint for an 8-bit variable that provides distribution:
// 80% → range 0–100
// 20% → range 101–255
// Declare a class Generic with data properties: var1, var2, var3, var4.

class Generic;
  rand bit [7:0]var1;
  rand bit [7:0]var2;
  rand bit [7:0]var3;
  rand bit [7:0]var4;
  
  // constraint
  constraint c1 {
    var1 dist {[0:100]:/ 80, [101:255]:/ 20};			// weighted distribution
    var2 dist {[0:100]:/ 80, [101:255]:/ 20};			// weighted distribution
    var3 dist {[0:100]:/ 80, [101:255]:/ 20};			// weighted distribution
    var4 dist {[0:100]:/ 80, [101:255]:/ 20};			// weighted distribution
  }
  
  // display function
  function void print();
    $display("var1 = %d | var2 = %0d | var3 = %0d | var4 = %0d", var1, var2, var3, var4);
  endfunction
  
endclass
    

module distribution_constraint;
  Generic g1;		// class handle
  
  initial begin
    g1 = new();			// memory allocation
    
    $display("\n--------------------- The list of randomized values ----------------");
    
    repeat(10) begin
      if(g1.randomize())	// calling randomize function
        g1.print();				// calling class print function
      else
        $display("Randomize failed");
    end
  end
  
endmodule

// https://edaplayground.com/x/VtaY