// function based randomization	- seed random

module seed_random;			// random value are generated with one selected seed value  -- Repeatable Results - every run
  logic [7:0] a;
  int seed = 100;			// same sequence repeats
  
  initial begin
    
    // initialize seed value
    $display("initializing seed value");
      a = $urandom(seed);		// generates random values  specific seed set 
      
    $display("a = %0d | seed = %0d", a, seed);
      
    $display("\nrelease seed value");
    repeat(5) begin
      a = $urandom;		// generates random values  specific seed set 
      
      $display("a = %0d | seed = %0d", a, seed);
    end
  end
endmodule