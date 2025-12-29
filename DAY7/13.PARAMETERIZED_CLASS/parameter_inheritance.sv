// Parameterized Class with Inheritance
class base #(parameter int DEPTH = 8);			// parameter
  function void show();
    $display("base class --- value in parameter inside class DEPTH = %0d", DEPTH);
  endfunction
endclass

class child #(parameter WIDTH = 4, 
             parameter DEPTH = 8) extends base #(DEPTH);			// parameter in extended class
  function void show();
    $display("child class --- value in parameter inside class DEPTH = %0d, WIDTH = %0d", DEPTH, WIDTH);
  endfunction
endclass

module parameter_inheritance;
  child #(16, 32)c1;			// creating handle bt changing parameter value - from default
  child c2;				        // creating handle by default value of parameter 
  
  initial begin
    c1 = new();
    c2 = new();			// object allocation
    
    $display("Changed parameter");
    c1.show();			// class function call
    $display("\ndefault parameter");
    c2.show();
  end
endmodule    