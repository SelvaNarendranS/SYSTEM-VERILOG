// Write a associative array example .explain its functionality. 
// function first(), last(), prev(), next(), delete(index) & delete()
module associative_methods;
  logic [7:0]arr[string];
  string index;
  
  initial begin
    arr["a"]  = 16;
    arr["b"]  = 7;
    arr["c"]  = 38;
    arr["d"]  = 450;
    arr["e"]  = 50;
    arr["f"]  = 31;
    
    $display("\nAssociative array Entire array elements arr = %p", arr);
    $display("Associative array size() = %0d", arr.size());
    
    $display("\nAssociative array num() = %0d", arr.num());				// num() & size() both are same Returns the number of entries.
    
    $display("\nAssociative array exists(1000) = %0d", arr.exists("c"));		// Returns 1 if index c is exists else 0
    
    $display("\nAssociative array exists(3614) = %0d", arr.exists("g"));		// Returns 1 if index g is exists else 0
    
    arr.first(index);															// Returns smallest index number from allocated index value to variable name index
    $display("\nfirst Index = %0s", index);
    $display("Associative array first() = %0d", arr[index]);	
    
    arr.last(index);															// Returns largest index number from allocated index value to variable name index
    $display("\n last Index = %0s", index);
    $display("Associative array last() = %0d", arr[index]);
    
    index = "d";
    $display("\npresent Index = %0s", index);
    arr.prev(index);
    $display("Associative array prev() = %0d", arr[index] );				// Returns previous value of index number from given index
    $display("Previous Index = %0d", index);
    
    index = "b";
    $display("\npresent Index = %0s", index);
    arr.next(index);
    $display("Associative array next() = %0d", arr[index]);							// Returns next value of index number from given index
    $display("Next Index = %0d", index);
    
    $display("\nAssociative array Entire array elements before delete arr = %p", arr);
    index = "c";
    arr.delete("c");				// delets the element with the given index number.
    $display("deleting Index = %0s", index);
    $display("Associative array Entire array elements after delete arr = %p", arr);
    $display("Associative array size() = %0d", arr.size());
    
    arr.delete();				// delets entire array
    $display("\nAssociative array Entire array elements arr = %p", arr);
    $display("Associative array size() = %0d", arr.size());
    
  end
endmodule
