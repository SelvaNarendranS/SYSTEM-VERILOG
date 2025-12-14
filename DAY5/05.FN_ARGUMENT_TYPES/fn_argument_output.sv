// Function arguments - output
module fn_argument_output;
  int a, b, c, d;
  int out1, out2, out3, out4;
  
  function int ascending_order(int num1, num2, num3, num4,
                               output int v1, v2, v3, v4);			// send multiple outputs by way of arguments 
    int temp[4];
    int min;
    temp = '{num1, num2, num3, num4};
    
    for(int i = 0; i < 4; i++) begin
      for(int j = i+1; j < 4; j++) begin
        if(temp[i] > temp[j]) begin
          min     = temp[i];
          temp[i] = temp[j];
          temp[j] = min;
        end
      end
    end
    v1 = temp[0];
    v2 = temp[1];
    v3 = temp[2];
    v4 = temp[3];
    return ($size(temp));
    
  endfunction
  
  initial begin
    
    // initialize
    repeat(5) begin
      a = $urandom_range(1, 20);
      b = $urandom_range(1, 20);
      c = $urandom_range(1, 20);
      d = $urandom_range(1, 20);
      
      ascending_order(a, b, c, d, out1, out2, out3, out4); #1;
      $display("inputs => a = %0d | b = %0d | c = %0d | d = %0d |\n\t ascending order => %0d, %0d, %0d, %0d", a, b, c, d, out1, out2, out3, out4);
    end
  end
endmodule
    
  