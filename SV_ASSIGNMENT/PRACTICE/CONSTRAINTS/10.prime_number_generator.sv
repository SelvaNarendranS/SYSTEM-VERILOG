// Prime Number Generator (Algorithmic Constraint)
// Write a class prime_gen with a 16-bit variable prime_num. Write a constraint that forces prime_num to always be a prime number.
// (Hint: You will need to use a constraint with a function call inside it, or a solve...before with a helper function—but remember that functions called in constraints must be pure and cannot have side effects).

class prime_gen;
  rand bit[15:0] prime_num;
  rand int is_prime;
  
  constraint prime {
    solve is_prime before prime_num;
    
    if (is_prime)
      prime_generation(prime_num);
    else
      !prime_generation(prime_num);
    
    prime_num inside {[1:10]};
    
    prime_num == is_prime;
  }
  
  function int prime_generation(bit[15:0] num);
    int i; 	
    if(num < 2)
      return 0;
    else if(num >= 2) begin
      for(i = 2; i <= num/2; i++) begin
        if(num % i == 0)
          return 0;
      end
      return 1;
    end
  endfunction
  
endclass

module tb;
  prime_gen pr;

initial begin
    pr = new();
    
    repeat(10) begin
      if(!pr.randomize())
        $display("randomization faied");
      else
        $display(" prime_num = %0d", pr.prime_num);
    end
  end
  
endmodule
