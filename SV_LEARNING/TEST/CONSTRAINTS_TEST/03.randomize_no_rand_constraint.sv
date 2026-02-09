// Write code to randomize a variable without using the rand keyword.


// --- it can be achived by 2 ways
// --- 1. function based			-- constraints not avaiable to use
// --- 2. global randomize			-- constraints can be used

class base;
  bit [7:0]var1;
  bit [7:0]var2;			
  bit [7:0]var3;
  bit [7:0]var4;			// normal variable inside class
  
  // display function
  function void print();
     $display("var1 = %d | var2 = %0d | var3 = %0d | var4 = %0d", var1, var2, var3, var4);
  endfunction
  
endclass
    

module distribution_constraint;
  int unsigned var5;				// normal variable  
  base b1;		// class handle
  
  initial begin
    b1 = new();			// memory allocation
    
    $display("\n--------------------- The list of randomized values ----------------");
    
    repeat(10) begin
      std::randomize(b1.var1) with { b1.var1 inside {[30:91]};};			// global randomize
      b1.var2 = $random;
      b1.var3 = $urandom;
      b1.var4 = $urandom_range(20, 60);
      std::randomize(var5) with { var5 inside {[30:91], 36815, 649655};};			// global randomize
      
      b1.print();				// calling class print function
      $display("var5 = %0d ", var5);
    end
  end
  
endmodule

https://edaplayground.com/x/vDE2