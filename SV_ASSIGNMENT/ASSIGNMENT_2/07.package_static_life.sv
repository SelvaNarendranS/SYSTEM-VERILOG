// Explain the visibility and lifetime of static variables within a package in SystemVerilog.

// package
package pkg;
  
  int count;		// normal variable -- but visible to all classes 
  
  function void increment();
    count++;
  endfunction

endpackage

// class --- a dynamic class
class execute;
  
  string a;
  
  function new(string name);
    a = name;
  endfunction
  
  task trigger();
    pkg :: count++;			// accessing the package variable via scoped resolution
    $display("[%s] the increment count value = %0d", a, pkg::count);
  endtask
  
endclass

// testbench
module tb;
  
  import pkg::*;		// importing package
  
  // class handles
  execute e1;
  execute e2;
  
  initial begin
    e1 = new("execute -- e1");
    e2 = new("execute -- e2");
    
    #10;
    e1.trigger();		// shared count
    
    #10;
    e2.trigger();		// shared count
    
    #10;
    increment();		// calling package function
    $display("[testbench] the increment count value = %0d",count);
    
    #10;
    $finish;
  end
  
endmodule
