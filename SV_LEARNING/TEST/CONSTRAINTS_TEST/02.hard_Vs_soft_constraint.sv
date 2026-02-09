// What is the difference between hard constraints and soft constraints? 

class base;
  rand bit [7:0]var1;
  rand bit [7:0]var2;
  
  // constraint     ---- // master condition constraint
  constraint c1 {
    soft var1 inside {20,164, 31};						// soft constraint
    var2 dist {[0:100]:/ 80, [101:255]:/ 20};			// weighted distribution  -- Hard constraint
  }								// var1 is declared as soft constraint because to give access to change the constraint future --- in child class / by inline constraint
  
  // display function
  function void print();
    $display("var1 = %d | var2 = %0d", var1, var2);
  endfunction
  
endclass
    

module distribution_constraint;
  base b1;		// class handle
  
  initial begin
    b1 = new();			// memory allocation
    
    $display("\n--------------------- The list of randomized values ----------------");
    
    repeat(10) begin
      if(b1.randomize() with {			// calling randomize function
        var1 inside {[1:200]};})			// changing the soft constraint to HARD by over writting the soft constraint by hard constraint
        b1.print();				// calling class print function
      else
        $display("Randomize failed");
    end
  end
  
  // whereas var2 is not yet modified works in the master condition constraint
  
endmodule

// https://edaplayground.com/x/cR_c