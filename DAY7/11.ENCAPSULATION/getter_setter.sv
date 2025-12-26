// encapsulation -- getter setter
class register;
  local int data;
  
  task set(input int a);			// sets input value to local variable 
    if(a > 0)
      data = a;
  endtask
  
  function int get();
    return data;					// gets - gives the stored value
  endfunction
endclass

module getter_setter;
  register r1;						// class handle;
  
  initial begin
    r1 = new();
    
    r1.set(20);						// task call & argument pass
    r1.set(-6);				  		// ignored
    $display("data = %0d",r1.get);	// function call 
  end
endmodule