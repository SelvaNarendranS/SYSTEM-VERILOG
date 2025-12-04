// Dynamic array methods function delete
module dynamic_array;
  logic [3:0]arr[];  //  dynamic array define
  
  initial begin
    // dynamic array create
    arr = new[5];
    
    // initialize
    arr = '{1, 2, 3, 4, 5};
    
    // Display initilized values
    $display("\nDynamic array entire arr = %p", arr);
    $display("Dynamic array Size arr = %0d \n", arr.size());   // to find size of array
    
    // resizing the created dynamic array with previous value retain
    arr = new[arr.size() + 3](arr);
    foreach(arr[i])
      arr[i] = i;
    arr[5] = 6;
    arr[6] = 7;
    arr[7] = 8; 								// Values assigning to new locations
    $display("\nDynamic array entire arr = %p ", arr);
    $display("Dynamic array Size arr = %0d \n", arr.size());	   // to find size of array
    
    arr.delete();            				// Array delete function
    $display("\nDynamic array entire arr = %p ", arr);
    $display("Dynamic array Size arr = %0d \n", arr.size());	   // to find size of array
    
  end
endmodule