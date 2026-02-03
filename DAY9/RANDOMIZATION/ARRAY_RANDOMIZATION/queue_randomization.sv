// queue Randomization
class base;
  rand byte unsigned b[$];
  rand byte unsigned c[$];		// rand variable
  
  constraint queue {
    b.size == 5;
    c.size == 5;
  }
  
endclass
  
module queue_arr_randomize;
  int a[$];		// nornal variable queue array
  base h1;			// base class handle
  
  initial begin
    h1 = new();				// class object allocation
        
    repeat(5) begin
      a.push_back($urandom_range(1, 750));		// generates value to each element 
      h1.b.push_back($urandom_range(1, 250));		// random values allocation to a specific class variable
    end
    $display("\t\t-------random values by function based ----'$urandom_range'----");$display("random values by function based");
    $display("The array of elements normal variable a = %0p", a);
    $display("The array of elements class rand variable b = %0p\n", h1.b);
    
    $display("\t\t-------random values by function based ----'randomize()'----");
    repeat(5) begin
      h1.randomize();
      $display("The array of elements class rand variable b = %0p, \n\t\tc = %0p", h1.b, h1.c);
    end
    
  end
endmodule