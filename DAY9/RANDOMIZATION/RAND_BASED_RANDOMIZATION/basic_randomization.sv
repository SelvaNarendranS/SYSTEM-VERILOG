// basic randomization
// class
class base;
  rand logic[3:0] a;	// rand keyword -- rand variable
endclass

module basic_randomization;
  logic [3:0]b;
  base h1;		// class hahdle
  
  initial begin 
    h1 = new();		// object allocation
    
    repeat(5) begin
      h1.randomize();		// randomizing class variables
      b = $random();		// normal variable randomization
      
      $display("\nThe class variable a = %0d", h1.a);
      $display("The normal variable b = %0d", b);
    end
  end
endmodule
