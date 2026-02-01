// function based randomization	- $urandom

module urandom;
  logic [3:0]a;
  int unsigned b;
  
  initial begin
    repeat(20) begin
      a = $urandom;		// generates random values  -- same values may be repeated
      b = $urandom;		// generates only unsigned random values --- for $random maximum 32bit size
      
      $display("\nLogic a = %0d", a);
      $display("unsigned int b = %0d", b);
    end
  end
endmodule