// Parameterized Class + Static Member
class base #(parameter MAX = 5);
  static int count = 0;
  
  function void counter();
    if(count < MAX) begin
      count++;
    end
  endfunction
endclass

module parameter_static;
  base #(3)b1;			// creating handle
  base #(3)b2;			// creating handle wit previous parameter value so static variable is comman ---- shared
  base b3;				// unique static variable
  
  initial begin 
    b1 = new();
    b2 = new();
    b3 = new();
    
    b1.counter();
    b2.counter();
    b3.counter();
    
    $display("base#(3) Static max = %0d", base#(3) :: count);	// count 1
    $display("base#(3) Static max = %0d", base#(3) :: count);	// shared
    $display("base Static max = %0d", base :: count);			// unique static variable
  end
endmodule    