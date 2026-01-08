// write a code for queue array with 4 elements... insert 1in the 1st index.. delete element in 3rd index... insert 9 as the last element... shuffle, reverse the elements 
module queue_array;
  int arr[$];			// queue array
  
  initial begin
    
    // initialize value to the array
    // push method
    arr.push_back(36);
    arr.push_back(79);
    arr.push_back(415);
    arr.push_back(16784);
    
    // initial display of queue
    $display("\n----- initialize of array -----");
    $display("The values in the queue = %p", arr);
    $display("The size of the queue   = %0d", arr.size());		// size of queue
    
    // insert method
    arr.insert(0, 1);		// 1st index
    $display("\n----- insert method 1st index -----");
    $display("The values in the queue = %p", arr);
    $display("The size of the queue   = %0d", arr.size());		// size of queue
    
    // delete method
    arr.delete(2);			// 3rd index
    $display("\n----- delete method - 3rd index-----");
    $display("The values in the queue = %p", arr);
    $display("The size of the queue   = %0d", arr.size());		// size of queue
    
    //insert method
    arr.insert(arr.size, 9);		// last index
    $display("\n----- insert method last index -----");
    $display("The values in the queue = %p", arr);
    $display("The size of the queue   = %0d", arr.size());		// size of queue
    
    // shuffle method
    arr.shuffle();
    $display("\n----- shuffle method -----");
    $display("The values in the queue = %p", arr);
    $display("The size of the queue   = %0d", arr.size());		// size of queue
    
    // reverse the array elements
    arr.rsort();
    $display("\n----- reverse sort -----");
    $display("The values in the queue = %p", arr);
    $display("The size of the queue   = %0d", arr.size());		// size of queue
  end
endmodule