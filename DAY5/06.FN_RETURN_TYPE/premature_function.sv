// Function return type
// premature function
module premature_function;
  int num[0:4];
  int max;
  
  function int premature(int arr[]);
  
    if(arr[0] < arr[1])
      return arr[1];
    
    else if(arr[0] < arr[2])
      return arr[2];
    
    else if(arr[0] < arr[3])
      return arr[3];
    
    else if(arr[0] < arr[4])
      return arr[4];
    
    else
      return arr[0];
  endfunction
    
    initial begin
      
      // initialize
      repeat(5) begin
        foreach(num[i])
          num[i] = $urandom_range(1, 20);
        
        max = premature(num);
        $display("Input numbers = %0p\n\tthe max number = %0d", num, max);
      end
    end
endmodule