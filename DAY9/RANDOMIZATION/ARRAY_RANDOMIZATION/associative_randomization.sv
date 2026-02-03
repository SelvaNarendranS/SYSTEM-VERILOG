// function based randomization	- associative Randomization
class base;
  rand int unsigned b[int];		// key - int, value - int
  rand int unsigned c[int];		// rand variable -- associative array
  
endclass
  
module assoc_randomize;
  int a[int];		// nornal variable assiciative array
  int key;
  base h1;			// base class handle
  
  initial begin
    h1 = new();				// class object allocation
        
    repeat(5) begin		// keys are randomized
      key = $urandom_range(1, 200);		
      a[key] = $urandom_range(1, 750);    // generates value to each element 
      h1.b[key] = $urandom_range(1, 750);		// random values allocation to a specific class variable
      h1.c[key] = 0;		// allocating key to c variavle  with dummy value		
    end
    
    $display("\t\t-------random values by function based ----'$urandom_range'----");
    $display("The array of elements normal variable a = %0p", a);
    $display("The array of elements class rand variable b = %0p\n", h1.b);
    
    $display("\t\t-------random values by function based ----'randomize()'----");
    repeat(2) begin
      h1.randomize();
      $display("The array of elements class rand variable b = %0p, \n\t\tc = %0p", h1.b, h1.c);
    end
    
  end
endmodule