// function based randomization	- $random

module random;
  logic [3:0]a;
  int b;
  
  initial begin
    repeat(20) begin
      a = $random;		// generates random values  -- same values may be repeated
      b = $random;		// generates signed random values --- for $random maximum 32bit size
      
      $display("\nLogic a = %0d", a);
      $display("int b = %0d", b);
    end
  end
endmodule