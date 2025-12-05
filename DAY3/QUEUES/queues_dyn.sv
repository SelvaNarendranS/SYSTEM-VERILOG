// Queues of dynamic array 
module queues_dyn;		// $ means unsigned infinity starting with 0 
  int arr[$][];   		// unbounded queque & dynamic array
  
  initial begin 
    // array create
    arr = '{{}, {}};
    
    // initialize
    arr[0] = '{10, 12, 4};
    arr[1] = '{7, 6};
    
    $display("\nunbounded Queues of dynamic array entire elements arr = %p", arr);
    $display("unbounded Queues of dynamic array Size = %0d", arr.size());
    
    arr.insert(1, '{30,52,45});									// insert function
    arr.insert(3, '{310,562,845});
    arr.insert(4, '{130,952,1445});    
    $display("\nAfter Insert function array elements arr = %p",  arr);
    $display("after insert array Size = %0d", arr.size());   //  Size function
    
    arr.push_back('{25,87});												// Push back function
    $display("\nAfter Push back function array elements arr = %p",  arr);
    $display("after push back array Size = %0d", arr.size());
    
    arr.push_back('{62,87,265});											// Push front function
    $display("\nAfter push front function array elements arr = %p",  arr);
    $display("after push front array Size = %0d", arr.size());
    
    arr.pop_back();													// Push back function
    $display("\nAfter pop back function array elements arr = %p",  arr);
    $display("after pop back array Size = %0d", arr.size());
    
    arr.pop_front();												// Push back function
    $display("\nAfter pop front function array elements arr = %p",  arr);
    $display("after pop front array Size = %0d", arr.size());
    
    $display("\nDynamic array column size arr[2] = %0d", arr[2].size());
   
  end
endmodule