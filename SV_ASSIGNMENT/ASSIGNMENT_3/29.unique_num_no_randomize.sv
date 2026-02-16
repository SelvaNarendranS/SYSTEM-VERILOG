// Write a code to generate unique numbers without using randomize.

module unique_numbers;
  int arr[10];
  int temp;
  int err;
  
  initial begin
    
    // generating random values
    foreach(arr[i]) begin
      temp = $urandom_range(1, 100);
      err = 0;
    
      // identifying repeared values generated
      do begin
        for(int j = 0; j < i; j++) begin
          if(arr[i] == temp) begin
            err = 1;
            break;
          end
        end
      end
      while(err);
      
      arr[i] = temp;
    end
    
    $display("\n--- Ramdomization to to generate unique numbers without using randomize ---");
    $display("\t arr = %0p", arr);
    
  end
endmodule