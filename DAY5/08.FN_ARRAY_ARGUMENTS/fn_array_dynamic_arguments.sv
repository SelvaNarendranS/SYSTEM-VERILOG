// Function array arguments
// dynamic array
module fn_array_dynamic_arguments;
  parameter int size = 10;
  int arr[], value[];
  int count;
  
  function static int dynamic_array(const ref int array[], output int val[]);
   
    int sum = 0;
    foreach(array[i])
      sum += array[i];
    $display("the array = %0d", sum);
    val = {sum, array};
    count++;
    
  endfunction
  
  initial begin
    // initialize
    count = size;
    arr = new[size];
    value = new[count+1];
    foreach(arr[i]) begin
      arr[i] = $urandom_range(1, 20);
    end
    
    $display("the arr = %p", arr);
    
    dynamic_array(arr, value);
    
    $display("the array = %p | value = %p", arr, value);
    
    dynamic_array(arr, value);
    
    $display("the array = %p | value = %p", arr, value);
  end
endmodule