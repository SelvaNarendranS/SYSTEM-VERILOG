// function based randomization	- all 

module function_randomization;
  int a;
  int unsigned b;
  int c;
  
  initial begin
    repeat(5) begin
      a = $random;		// generates random values  -- same values may be repeated
      		// generates signed random values --- for $random maximum 32bit size
      b = $urandom;  // generates unsigned 32 bit size value
      c = $urandom_range(1, 200); // generates within the fixed range
      
      $display("\n $random a = %0d", a);
      $display(" $urandom b = %0d", b);
      $display(" $urandom_range(1, 200) c = %0d", c);
    end
  end
endmodule