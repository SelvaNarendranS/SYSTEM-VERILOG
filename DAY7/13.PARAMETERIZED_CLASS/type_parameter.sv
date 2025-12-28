// Type Parameter (parameter type)
class base #(parameter type S = int,			// parameter type(keyword) - for data type 
             parameter value = 0);				// integer parameter
//datatype - from parameter variable name
  S DEPTH, data;
  S info;
  
  function new(int a, b);
    DEPTH = a;
    data = b;
  endfunction
  
  function void show();
    $display("base class -- DEPTH = %0d, data = %0d, info = %0d, value = %0d", DEPTH, data, info, value);
  endfunction
endclass

module type_parameter;
  base #(byte, 16)b1;			// creating handle bt changing parameter value - from default
  base b2;						// creating handle by default value of parameter
  base #(logic[2:0], 62)b3;
  
  initial begin
    b1 = new(210, 30);
    b2 = new(6142, 78141);			// object allocation
    b3 = new(1, 2); 
    
    $display("Type parameter - byte");
    b1.show();			// class function call
    $display("\ndefault parameter");
    b2.show();
    $display("\n type parameter - logic");
    b3.show();
  end
endmodule    