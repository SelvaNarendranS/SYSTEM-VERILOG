// Write a single constraint to generate a random value for bit [8:0] var1 in the ranges:

// 1–34

// 127

// 129–156

// 192–202

// 257–260

// Also show how to:
// i. Randomize all variables
// ii. Randomize only var2
// iii. Randomize var1 and var4
// iv. Randomize var1, var3, var4 

class Generic;
  rand bit [8:0]var1;
  rand bit [8:0]var2;
  rand bit [8:0]var3;
  rand bit [8:0]var4;
  
  // constraint
  constraint c1 {
    var1 inside {[1:34], 127, [129:156], [192:202], [257:260]};
  }
  
//   constraint 
  
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
    $display("randomize specific set of range & value");
    g1.var2.rand_mode(0);
    g1.var3.rand_mode(0);
    g1.var4.rand_mode(0);			// randomize disable
    
    g1.randomize();			// calling randomize function
    g1.print();				// calling class print function
    
    #5;
    
    $display("\ni. Randomize all variables");
    g1.var2.rand_mode(1);
    g1.var3.rand_mode(1);
    g1.var4.rand_mode(1);				// randomize enable		
    g1.c1.constraint_mode(0);			// constraint disable
    
    g1.randomize();			// calling randomize function
    g1.print();				// calling class print function
    
    #5;
    
    $display("\nii. Randomize only var2");
    g1.var1.rand_mode(0);
    g1.var2.rand_mode(1);
    g1.var3.rand_mode(0);
    g1.var4.rand_mode(0);				// randomize enable		
    g1.c1.constraint_mode(0);			// constraint disable
    
    g1.randomize();			// calling randomize function
    g1.print();				// calling class print function
    
    #5;
    
    $display("\niii. Randomize var1 and var4");
    g1.var1.rand_mode(1);
    g1.var2.rand_mode(0);
    g1.var3.rand_mode(0);
    g1.var4.rand_mode(1);				// randomize enable		
    g1.c1.constraint_mode(1);			// constraint disable
    
    g1.randomize();			// calling randomize function
    g1.print();				// calling class print function
    
    #5;
    
    $display("\niv. Randomize var1, var3, var4");
    g1.var1.rand_mode(1);
    g1.var2.rand_mode(0);
    g1.var3.rand_mode(1);
    g1.var4.rand_mode(1);				// randomize enable		
    g1.c1.constraint_mode(1);			// constraint disable
    
    g1.randomize();			// calling randomize function
    g1.print();				// calling class print function
    
    #5;
  end
  
  
  
endmodule

// https://edaplayground.com/x/TTR7