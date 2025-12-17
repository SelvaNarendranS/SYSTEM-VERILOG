// Automatic task
module automatic_task;
  int count;
  
  task automatic behaviour(input int a);
    int value;
    value = 1;
    value++;
    a++;
    $display("Time = %0t | In task The value = %0d | the count = %0d", $time, value, a);
  endtask
  
  initial begin
    // initialize
    count = 1; #1;
    
      behaviour(count); #5;
      behaviour(count); #2; 
      behaviour(count); #7;
      behaviour(count);
 
  end
endmodule

// Automatic task
module automatic_task;
  int count;
  
  task automatic behaviour;
    int value = 1;
    value++;
    count++; 				// global access 
    $display("Time = %0t | In task The value = %0d | the global count = %0d", $time, value, count);
  endtask
  
  initial begin
    // initialize
    count = 0; #1;
    
      behaviour(); #5;
      behaviour(); #2; 
      behaviour(); #7;
      behaviour();
 
  end
endmodule