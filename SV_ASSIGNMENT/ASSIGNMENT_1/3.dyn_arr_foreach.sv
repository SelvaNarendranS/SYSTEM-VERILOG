// write a code for dynamic array give the value of array using foreach display the size shuffle the array elements.
module dyn_arr_foreach;
  
  // dynamic array declare
  int dyn_arr[];
  
  initial begin
    
    // before size allocation to array
    $display("before size allocation the size of the array = %0d", $size(dyn_arr));
    
    // allocating size to the dynamic array
    dyn_arr = new[10];
    
    $display("the size of the array = %0d", $size(dyn_arr));
    
    // initializing the values to the dynamic array using foreach
    foreach(dyn_arr[i]) begin
      dyn_arr[i] = $urandom_range(1, 100);
      $display("value in the array = %0p", dyn_arr);
    end
    
    // shuffle of array elements
    dyn_arr.shuffle();
    $display("\n---------------------------------------------");
    $display("value in the array after shuffle = %0p", dyn_arr);
    
  end
endmodule
    