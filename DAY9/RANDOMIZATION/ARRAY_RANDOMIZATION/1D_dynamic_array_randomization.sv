// function based randomization	- 1D Dynamic-Array Randomization
class base;
  rand int unsigned b[], c[];		// rand variable
endclass
  
module dyn_arr_randomize;
  int a[];		// nornal variable dynamic array
  int size;
  base h1;			// base class handle
  
  initial begin
    size = $urandom_range(1, 15);		// generating random value for dynamic array size
    
    h1 = new();				// class object allocation
    
    a = new[size];		// array size allocation for normal variable
    h1.b = new[size];	// // array size allocation for class rand variable
    h1.c = new[3];
    
    foreach(a[i]) begin
      a[i] = $urandom_range(1, 750);		// generates value to each element 
      h1.b[i] = $urandom_range(1, 750);		// random values allocation to a specific class variable
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