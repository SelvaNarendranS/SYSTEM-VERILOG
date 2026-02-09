// Write a constraint to generate 18 zeros and no consecutive ones in a 32-bit variable. 

class base ;
  rand bit [32:0]var1;
  
  // constraint
  constraint c1 {
    $countones(var1) == 14;			// count ones  -- 32bit - 18zero = 14 ones
    
    foreach(var1[i])
      if(i < 32)
        !(var1[i] && var1[i+1]);
  }
  
  // display function
  function void print();
    $display("var1 = %d", var1);
  endfunction
  
endclass
    

module distribution_constraint;
  base b1;		// class handle
  
  initial begin
    b1 = new();			// memory allocation
    
    $display("\n--------------------- The list of randomized values ----------------");
    
    repeat(10) begin
      if(b1.randomize())	// calling randomize function
        b1.print();				// calling class print function
      else
        $display("Randomize failed");
    end
  end
  
endmodule

// https://edaplayground.com/x/pAVu