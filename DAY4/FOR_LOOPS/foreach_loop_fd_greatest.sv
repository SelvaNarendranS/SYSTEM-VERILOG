// FOREACH LOOP
// using dynamic array, assign values, and use foreach to count and print how many elements are greater than 10.
module foreach_loop;
  int arr[];
  int store[$];
  int j = 0, size = 10;
  
  initial begin 
    arr = new[8];	// arry creation
    
    // initialize
    foreach(arr[i])
      arr[i] = $urandom_range(1, size*2);
    $display("\nArray elements = %p", arr);
    
    // finding greater than 10
    foreach(arr[i]) begin
      if(arr[i] > size) begin
        store[j] = arr[i];
        j++;
      end
    end
    $display("Greater than %0d elements = %p\n", size, store);
  end
endmodule