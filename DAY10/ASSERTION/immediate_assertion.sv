module test;
  bit[7:0] data;
  bit enable;
  
  initial begin
    
    data = 10;
    enable = 0;
    $display("Test 1: data=%0d, enable=%b", data, enable);
    assert (data == 10)
      $display("pass: data = 10");
    else
      $display("Fail: data = %0d", data);
    
    #1;
    $display("Loop test starts");
    for(int i = 0; i <= 9; i++) begin
      data = $random;
      enable = i[0];	
      $display("Test%0d: data=8'h%0h, enable=%b", i+1, data, enable);	#5;
    end
    
    $finish;
  end
  
  // assertion
  always @(data, enable) begin 
    assert ((data < 100) && enable)
      $display("pass: data < 100 enable = %0d", enable);
    else
      $error("Fail: data > 100 or enable = 0");
  end
  
endmodule  
