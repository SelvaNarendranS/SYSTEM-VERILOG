// Queues declere 
module queues_array;
  logic [7:0]arr[$];   		// unbounded queque 
  string arr1[$];			// $ means unsigned infinity starting with 0 
  
  initial begin 
    // initialize
    arr  = '{10,20,50,80,90,154,234};
    arr1 = '{"sam","mano", "jack"}; 
  
    $display("\nQueues array entire elements arr = %p", arr);
    $display("Queues array Size = %0d", arr.size());
    
    $display("\nQueues array entire elements arr1 = %p", arr1);
    $display("Queues array Size = %0d", arr1.size());
    
    $display("\nQueues array row element part select :%p", arr[2:5]);
    $write("\nQueues array row element byte slice :\n");
    foreach(arr[i])
      $display("arr[%0d] = %0d", i, arr[i]);
   
  end
endmodule