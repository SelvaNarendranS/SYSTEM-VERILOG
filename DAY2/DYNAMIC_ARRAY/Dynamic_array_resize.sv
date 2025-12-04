// resizing dynamic array
module dynamic_array;
  logic [3:0]arr[][];  //  dynamic array define
  
  initial begin
    // dynamic array create as 2D unpacked
    arr = new[5];  		// row create
    foreach(arr[i])
      arr[i] = new[2];  // column create
    
    // initialize
    arr = '{'{1,2},
            '{3,4},
            '{5,6},
            '{7,8},
            '{9,10}};
    
    
    // Display initilized values
    $display("\nDynamic array entire arr =%p", arr);
    $display("Dynamic array Size arr = %0d \n", arr.size());   // to find size of array
    
    // resizing the created dynamic array with previous value retain
    arr = new[8](arr);
    $display("\nDynamic array resize entire arr =%p", arr);
     $display("Dynamic array Size arr = %0d \n", arr.size());   // to find size of array
    
    // resizing the created dynamic array with previous value retain
    arr = new[8](arr);
    foreach(arr[i]) begin
      if(i > 4)
        arr[i] = new[2];
    end
    $display("\nDynamic array resize entire arr =%p", arr);
     $display("Dynamic array Size arr = %0d \n", arr.size());   // to find size of array
    
     // resizing the created dynamic array without previous value retain
    arr = new[4];
    $display("\nDynamic array without row resize entire arr =%p", arr);
     $display("Dynamic array Size arr = %0d \n", arr.size());   // to find size of array
    
    // resizing the created dynamic array without previous value retain
    foreach(arr[i])
      arr[i] = new[4];      
    $display("\nDynamic array without column resize entire arr =%p", arr);
     $display("Dynamic array Size arr = %0d \n", arr.size());   // to find size of array
    
  end
endmodule