// function based randomization	- 3D Static-packed Randomization
class base;
  	// ROW * COLUMN * DEPTH
  rand bit [1:0][5:0][6:0] b;
  rand bit [3:0][3:0][2:0] c;		// rand variable
endclass
  
module static_arr_randomize;
  logic [1:0][6:0][6:0] a;		// nornal variable fixed array
  base h1;			// base class handle
  
  initial begin
    h1 = new();				// class object allocation

    foreach(a[i,j]) begin
      a[i][j] = $urandom_range(1, 150);		// generates value to each element 
      h1.b[i][j] = $urandom_range(1, 150);		// random values allocation to a specific class variable
    end
    $display("\t\t-------random values by function based ----'$urandom_range'----");
    $display("The array of elements normal variable a = %0p", a);
    $display("The array of elements class rand variable b = %0p\n", h1.b);
    
    $display("\t\t-------random values by function based ----'randomize()'----");
    repeat(5) begin
      h1.randomize();
      $display("The array of elements class rand variable b = %0p, \n\t\tc = %0p\n", h1.b, h1.c);
    end
    
  end
endmodule