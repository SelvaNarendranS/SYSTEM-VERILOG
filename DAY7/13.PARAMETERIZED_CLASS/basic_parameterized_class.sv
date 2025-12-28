// Parameterized Class – Basic (int parameter)
class base #(parameter int DEPTH = 8);			// parameter - default integer -- changed to int
  function void show();
    $display("value in parameter inside class DEPTH = %0d", DEPTH);
  endfunction
endclass

module basic_parameterized_class;
  base #(16)b1;			// creating handle bt changing parameter value - from default
  base b2;				// creating handle by default value of parameter 
  
  initial begin
    b1 = new();
    b2 = new();			// object allocation
    
    $display("Changed parameter");
    b1.show();			// class function call
    $display("\ndefault parameter");
    b2.show();
  end
endmodule    