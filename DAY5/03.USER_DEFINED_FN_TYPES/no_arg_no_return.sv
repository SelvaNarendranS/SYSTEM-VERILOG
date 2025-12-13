// Without Arguments & Without Return
// diamond and pyramid pattern
module noarg_noreturn;
  
  initial begin
    $display("---------- Diamond -----------");
    diamond();
    $display("---------- Pyramid -----------");
    pyramid();
  end
  
  function void diamond;
    int size = 5;
    int i, g, j;
    
    // upper part
    for(i = 0; i < size; i++) begin
      for(g = 0; g < size-i-1; g++)
        $write(" ");
        for(j = 0; j <= i; j++) begin
          $write("* ");
        end
      $write("\n");
    end
    
    // lower part
    for(i = size-2; i >= 0; i--) begin
      for(g = 0; g < size-i-1; g++)
        $write(" ");
      for(j = 0; j <= i; j++) begin
          $write("* ");
        end
      $write("\n");
    end
  endfunction
  
    function void pyramid;
    int size = 5;
    int i, g, j;
      
    for(i = 0; i < size; i++) begin
      for(g = 0; g < size-i-1; g++)
        $write(" ");
        for(j = 0; j <= i; j++) begin
          $write("* ");
        end
      $write("\n");
    end
    endfunction
  
endmodule