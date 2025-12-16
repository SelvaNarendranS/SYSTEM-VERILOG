// Basic task
// No return task
module task_no_return;
  int value1, value2 ;
  
  task no_return(input int a, b);
   
    #1;
    $display("Time = %0t | Received argument value => a = %0d | b = %0d | sum = %0d", $time, a, b, a+b);		//  receive argument and no return type
  
  endtask
  
  initial begin
    
    // initialize 
    value1 = 31698; 
    value2 = 676; #1;
    
    no_return(value1, value2); #1;		// pass by value
    no_return(168352, 314);			// pass by direct number
    
  end
endmodule
    