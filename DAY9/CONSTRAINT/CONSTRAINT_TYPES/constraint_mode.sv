// constraint --  constraint mode
class parent;
  rand bit [7:0]a;
  
  // constraint
  constraint c1 {
    a > 10;	
    a < 25;
  }  
  
  constraint c2 {
    a inside {[31:61], 164, 178, [222:254]};
  }
  					// there are 2 constraint for same variable but at a time only one constraint should be enabled, otherwise conflict happens, so constraints modes are there ---constraint modes -----                                                                                              c1.constraint_mode(0) --> 0 means disable                                                      c1.constraint_mode(1) --> 1 means enable
  
  // function to print random generated values
  function void print();
    $display("	a = %0d", a);
  endfunction
  
endclass

module constraint_mode;
  parent p1;		// class handle
  
  initial begin
    p1 = new();		// object allocation
    
    $display("\n----------printing  constraint mode ramdomized values----------------");
    $display("constraint c2 disable -- running in constraint c1");
    p1.c2.constraint_mode(0);		// constraint c2 --- disable --> c1 default enable condition
    repeat(5) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
    
    $display("constraint c1 disable -- running in constraint c2");
    p1.c1.constraint_mode(0);		// constraint c1 --- disable
    p1.c2.constraint_mode(1);		// constraint c2 --- enable
    repeat(5) begin
      p1.randomize();		// calling randomize function for randomize
    
      p1.print();	
    end  
  end
endmodule