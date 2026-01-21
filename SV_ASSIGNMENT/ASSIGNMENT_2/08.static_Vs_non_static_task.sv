// Explain how a static task is invoked differently than a non-static task in a SystemVerilog class.

class base;
  static int count = 0;
  int value = 0;
  
  function new();
    value = ++count;		// counts no of new handle with memory allocated
  endfunction 
  
  // static task
  static task static_run();		// class method --- static task only one memory created to n handles of the same base class
    $display("static task count of normal task executed = %0d", count);
  endtask
  
  // normal task
  task run();			// class method  -- unique memory is created for every handle is creaated 
    $display("regular task value,count = %0d---(%0d)", value++, count);
  endtask
endclass

module static_Vs_non_static_task;
  base b1, b2;		// class handle
  
  initial begin
    b1 = new(); 		// object allocated for handle 1
    b2 = new(); 		// object allocated for handle 2
    
   base::static_run();					// static task call -- by class name
    
    repeat(3) b1.run();				// normal task call 
    $display();
    
    repeat(3) b2.run();				// normal task call 
  end
endmodule
