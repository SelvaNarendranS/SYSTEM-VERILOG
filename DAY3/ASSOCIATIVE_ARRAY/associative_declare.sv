// Associative array declare
module associative_array;
  logic [3:0]arr[int];
  reg [3:0]arr1[*];   		// * = means wildcard - all data types are accepted;
  int arr2[string];
  
  initial begin
    arr[100]  = 1;
  	arr[200]  = 2;
    arr[300]  = 3;
    arr[1000] = 10;
    
    $display("\nAssociative array Direct assignment elements of Entire array = %p", arr);
    $display("Associative array size = %0d", arr.size());
    
    arr = '{101:1, 201:2, 301:3, 501:5, 1001:10};
    
    $display("\nAssociative array assignment pattern elements of Entire array = %p", arr);
    $display("Associative array size = %0d", arr.size());
    
    
    arr1 = '{151:1, 271:2, 3091:3, 51:5, "data":10};
    
     $display("\nAssociative array array assignment pattern elements of Entire array = %p", arr1);
    $display("\nAssociative array array assignment pattern elements of specific location 'data' = %0d", arr1["data"]);
    $display("Associative array size = %0d", arr1.size());
    
    
    arr2 = '{"sdvxds":1, "xdba5r":2};
    
    $display("\nAssociative array assignment pattern elements of Entire array = %p", arr2);
    $display("Associative array size = %0d", arr2.size());
    
  end
endmodule

