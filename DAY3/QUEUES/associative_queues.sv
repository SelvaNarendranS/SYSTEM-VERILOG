// Associative of queues
module associative_queues;
  int arr[string][$];			// associative * queues
  string key;					//         row * column
  
  initial begin
    
    arr["offices"]   = '{12, 54, 86, 34, 78};
    arr["location"]  = '{134, 574, 46, 67, 264};
    arr["employees"] = '{1261, 5624, 866, 314, 879};
    arr["projects"]  = '{24, 51, 6};
    
    $display("The entite array arr = %p", arr);
    $display("Size of array = %0d", arr.size());
    foreach(arr[index])
      $display("Size of each elements arr[%0s] = %0d", index, arr[index].size());
    
    arr["location"].push_front(145);
    $display("Push an data to specific element arr[location] = %p", arr["location"]);  
    
    arr["offices"].sort();
    $display("The arr[offices] arr = %p", arr["offices"]);
    
    key = "location";
    arr.delete(key);
    $display("The entite array arr = %p", arr);
    
    end
endmodule