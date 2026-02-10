// Create a 61-bit variable constraint such that bits 0-31 are 1 and the remaining bits are 0.

class base;
  rand bit[60:0] val;
  
  // constraint
  constraint c1 {
    //     val == { {29{1'b0}}, {32{1'b1}} };  // concatenation and replication
    
//     // bit slicing method
    val[31:0] == '1;
    val[60:32] == '0;
  }
  
  function void print();
    $display("  var = %0d(%b)", val, val);
  endfunction
  
endclass

module variable_constraint;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("--- Ramdomization of variable constraint  ---");
    repeat(1) begin
      b1.randomize();	// calling random function for randomization
      
      b1.print();		// calling print function
    end
  end
endmodule
      