// How does a dynamic array differ from an associative array? 
module dynamic_Vs_associative;
  int dyn[];				// dynamic array - null array
  int assoc[string];		// associative array
  
  initial begin
    
    // before size allocation to array
    $display("Before size allocation the size of the dynamic array = %0d", $size(dyn));
    $display("Before initializing value to the associative array = %0d", assoc.size());
    
    // allocating size to the dynamic array
    dyn = new[10];
    
    $display("\nThe size of the dynamic array after allocating = %0d", $size(dyn));
    
    // initializing 
    // dynamic array
    foreach(dyn[i]) 
      dyn[i] = $urandom_range(1, 500);
    
    // associative array
    assoc          = '{"a":314, "b":167};
    assoc["apple"] = 12;
    assoc["mango"] = 1;
    
    // display of arrays
    // dynamic
    $display("\nvalue in the dynamic array = %0p", dyn);
    $display("the size of the dynamic array = %0d", $size(dyn));
    
    // associative array
    $display("\nvalue in the associative array = %0p", assoc);
    $display("the size of the associative array = %0d", assoc.size());
  end
endmodule