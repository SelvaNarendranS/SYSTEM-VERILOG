// Array Manipulation Method
// Array locator methods optional 'With' clause			// latest Simulator required for with clause
module array_locator;
  int arr[16];
  int temp[$];
  
  initial begin
    arr = '{1, 3, 3, 4, 10, 6, 14, 3, 8, 6, 7, 11, 22, 26, 47,45};	// initialize
    
//     temp = arr.min() with (item < 4);							// min function with clause
//     $display("\nmin function with clause with item < 4 temp = %p", temp);
    
    temp = arr.min();											// min function without with clause
    $display("\nmin function without with clause temp = %p", temp);
    
 
//     temp = arr.max(item) with (item < 7);						// max function with clause
//     $display("\nmax function with clause with item > 7 temp = %p", temp);
    
    temp = arr.max();											// max function without with clause
    $display("\nmax function without with clause temp = %p", temp);
    
 
//     temp = arr.unique(item) with (item > 7);					// unique function
//     $display("\nunique function with item >= 1 temp = %p", temp);
//     $display("Size/ number of elements = %0d", temp.size());
    
    temp = arr.unique();										// unique function
    $display("\nunique function without with clause temp = %p", temp);
    $display("Size/ number of elements = %0d", temp.size());
    
    temp = arr.unique_index() ;									// unique_index function
    $display("\nunique_index function without with clause temp = %p", temp);
    $display("Size/ number of elements = %0d", temp.size());
    
//     temp = arr.unique_index() with (item >= 15) ;									// unique_index function
//     $display("\nunique_index function with clause temp = %p", temp);
//     $display("Size/ number of elements = %0d", temp.size());
  end
endmodule