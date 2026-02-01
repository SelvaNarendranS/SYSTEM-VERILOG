// function based randomization	- $urandom_range(min, max)

module urandom_range;	// its a bounded -- range of randomization value can be changed
  logic [3:0]a;
  int unsigned b;
  int c; 
  bit [4:0]max_size;
  
  initial begin
    repeat(16) begin
      max_size = $urandom;		// generates random value that used for size of urandom_range -size
      
      a = $urandom_range(1, 100);		// generates random values  -- same values may be repeated
      b = $urandom_range(1, 500);		// generates only within the specific range
      c = $urandom_range(1, max_size);			// generated max size has used has size
     
      $display("\nLogic $urandom_range(1, 100) a = %0d", a);
      $display("unsigned int $urandom_range(1, 500) b = %0d", b);
      $display("unsigned int $urandom_range(1, 'max_size'%0d) c = %0d", max_size, c);
    end
  end
endmodule