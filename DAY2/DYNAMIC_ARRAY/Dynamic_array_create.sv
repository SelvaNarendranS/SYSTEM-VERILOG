module dynamic_array;
  logic [3:0]arr[];  //  dynamic array define
  
  initial begin
    // dynamic array create
    arr = new[5];
    
    // initialize
    arr = '{1, 2, 3, 4, 5};
    
    // Display initilized values
    $display("\nDynamic array entire arr =%p \n", arr);
    
    $display("part select nibble arr[3] = %b", arr[3]);
    arr[3][2] = 0;   //  bit select
    $display("part select nibble arr[3] = %b", arr[3]);
    
    // Changing values 
    arr[4] = 9;
    $display("\nDynamic array entire arr =%p", arr);
    
    // access individual elements
    foreach(arr[i])
      $display("Dynamic array row elements arr[%0d] = %0d", i, arr[i]);
  end
endmodule