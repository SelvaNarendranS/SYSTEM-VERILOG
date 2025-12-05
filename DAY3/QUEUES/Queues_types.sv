// Queues types 
module queues_types;		// $ means unsigned infinity starting with 0 
  logic [7:0]arr[$];   		// unbounded queque 
  reg [7:0]arr_bnd[$:10];	// bounded queue  array size is 10
  							
  initial begin 
    // initialize
    arr = '{10,20,50,80,90,154,234};
  
    $display("\nunbounded Queues array entire elements arr = %p", arr);
    $display("unbounded Queues array Size = %0d", arr.size());
    
    $write("\nunbounded Queues array row element byte slice :\n");
    foreach(arr[i])
      $display("arr[%0d] = %0d", i, arr[i]);
    
    arr_bnd = '{21,64,26,98,5,100,36,94};
    
    $display("\nbounded Queues array entire elements arr_bnd = %p", arr_bnd);
    $display("bounded Queues array Size = %0d", arr_bnd.size());
    
    arr_bnd = '{21,64,26,98,5,100,36,94,3,7,99,25};		// 25 is out of range so negleted index 11
    
        
    $display("\nbounded Queues array entire elements arr_bnd = %p", arr_bnd);
    $display("bounded Queues array Size = %0d", arr_bnd.size());
    
    $write("\nbounded Queues array row element byte slice :\n");
    foreach(arr_bnd[i])
      $display("arr_bnd[%0d] = %0d", i, arr_bnd[i]);
   
  end
endmodule