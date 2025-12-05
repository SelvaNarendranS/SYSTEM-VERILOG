// Associative array methods
// function first(), last(), prev(), next(), delete(index) & delete()
module associative_array;
  logic [7:0]arr[int];
  int index;
  
  initial begin
    arr[6]    = 16;
    arr[2]    = 7;
    arr[51]   = 38;
    arr[8]    = 450;
    arr[3614] = 50;
    arr[794]  = 31;
    
    $display("\nAssociative array Entire array elements arr = %p", arr);
    $display("Associative array size() = %0d", arr.size());
    
    $display("\nAssociative array num() = %0d", arr.num());				// num() & size() both are same Returns the number of entries.
    
    $display("\nAssociative array exists(1000) = %0d", arr.exists(1000));		// Returns 1 if index 4 is exists else 0
    
    $display("\nAssociative array exists(3614) = %0d", arr.exists(3614));		// Returns 1 if index 4 is exists else 0
    
    arr.first(index);															// Returns smallest index number from allocated index value to variable name index
    $display("\nfirst Index = %0d", index);
    $display("Associative array first() = %0d", arr[index]);	
    
    arr.last(index);															// Returns largest index number from allocated index value to variable name index
    $display("\n last Index = %0d", index);
    $display("Associative array last() = %0d", arr[index]);
    
    index = 8;
    $display("\npresent Index = %0d", index);
    arr.prev(index);
    $display("Associative array prev() = %0d", arr[index] );				// Returns previous value of index number from given index
    $display("Previous Index = %0d", index);
    
    index = 51;
    $display("\npresent Index = %0d", index);
    arr.next(index);
    $display("Associative array next() = %0d", arr[index]);							// Returns next value of index number from given index
    $display("Next Index = %0d", index);
    
    $display("\nAssociative array Entire array elements before delete arr = %p", arr);
    index = 6;
    arr.delete(6);				// delets the element with the given index number.
    $display("deleting Index = %0d", index);
    $display("Associative array Entire array elements after delete arr = %p", arr);
    $display("Associative array size() = %0d", arr.size());
    
    arr.delete();				// delets entire array
    $display("\nAssociative array Entire array elements arr = %p", arr);
    $display("Associative array size() = %0d", arr.size());
    
  end
endmodule

