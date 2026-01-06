// Code for queue build-in methods size, insert (n/2 position, n position, n-1 p delete, pop_front, pop_back, push_front and push_back.
module queue_methods;
  
  int queue[$];			// unbounded queue
  int temp;
  
  initial begin
    
    // initial display of queue
    $display("The values in the queue = %p", queue);
    $display("The size of the queue   = %0d", queue.size());		// size of queue
    
    // initializtion of queue by assigning values
    // insert method
    queue.insert(0, 61);
    queue.insert(1, 15);
    queue.insert(0, 74);
    queue.insert(2, 34);
    
    $display("\n----- insert method -----");
    $display("The values in the queue = %p", queue);
    $display("The size of the queue   = %0d", queue.size());		// size of queue
    
    // insert method on specific location
    temp = (queue.size())/2;
    queue.insert(temp, 178);
    $display("\n----- insert method - n/2 position-----");
    $display("The values in the queue = %p", queue);
    $display("The size of the queue   = %0d", queue.size());
    
    queue.insert(queue.size(), 958);
    $display("\n----- insert method - n position -----");
    $display("The values in the queue = %p", queue);
    $display("The size of the queue   = %0d", queue.size());
    
    temp = (queue.size())-1;
    queue.insert(temp, 2549);
    $display("\n----- insert method - n-1 position -----");
    $display("The values in the queue = %p", queue);
    $display("The size of the queue   = %0d", queue.size());
    
    // delete method
    queue.delete(2);
    $display("\n----- delete method - index 2-----");
    $display("The values in the queue = %p", queue);
    $display("The size of the queue   = %0d", queue.size());
    
    // pop front method
    temp = queue.pop_front();
    $display("\n----- pop front method -----");
    $display("The values in the queue = %p", queue);
    $display("pop front value = %0d", temp);
    $display("The size of the queue   = %0d", queue.size());
    
    // pop back method
    temp = queue.pop_back();
    $display("\n----- pop back method -----");
    $display("The values in the queue = %p", queue);
    $display("pop front value = %0d", temp);
    $display("The size of the queue   = %0d", queue.size());
    
    // push front method
    queue.push_front(26783);
    $display("\n----- push front method -----");
    $display("The values in the queue = %p", queue);
    $display("The size of the queue   = %0d", queue.size());
    
    // push back method
    queue.push_back(583410);
    $display("\n----- push back method -----");
    $display("The values in the queue = %p", queue);
    $display("The size of the queue   = %0d", queue.size());
  end
endmodule