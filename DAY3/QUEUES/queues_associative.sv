// queues of associative array
module queues_associative;
  int arr[$][string];			// queues * associative
  string key;					//    row * column
  
  initial begin
    
    arr[0]   = '{"apple":12, "mango":54, "orange":86, "grapes":78, "gova": 64};
    arr[1]  = '{"bat":134, "ball":574, "stick":46, "gloves":67};
    arr[2] = '{"hp":1261, "dell":5624, "lenevo":866, "acer":314, "msi":879};
    
    $display("The entite array arr = %p", arr);
    $display("Size of array = %0d", arr.size());
    foreach(arr[index])
      $display("Size of each elements arr[%0d] = %p", index, arr[index].size());
    
    arr.push_back('{"a":24, "b":51, "c":6});
    $display("Pushback an data to specific element arr = %p", arr);
    $display("Size of array = %0d", arr.size());
    
    arr[2].sort();
    $display("The arr[2] arr = %p", arr[2]);
    
    foreach(arr[1][key])
      $display("The arr[1][%0s] element value arr = %0d", key, arr[1][key]);
    
    end
endmodule