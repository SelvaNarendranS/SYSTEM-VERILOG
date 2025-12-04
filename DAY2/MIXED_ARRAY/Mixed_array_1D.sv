// 1D packed and 1D unpacked
module mixed_array_1D;	
  logic [7:0]arr[0:4];
  
  initial begin
    // Initialize
    arr = '{1,2,3,4,5};
    
    // Display initialize values
    $display("mixed array entire arr  = %p\n", arr);
    
    // reallocate values to specific bit & individual array element access
    arr[3] = 6;
    $display("mixed array Bit Slice arr[3] = %d\n", arr[3]);
    
    arr[2:4] = '{6,8,9};
    $display("Part select arr[%0d:%0d] = %p\n",2, 4, arr[2:4]);
    
    $display("\nmixed array entire arr  = %p", arr);
    foreach(arr[i]) $display("mixed array arr[%0d]  = %0d", i, arr[i]);
    
  end
endmodule