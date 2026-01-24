// modport - dut modport
// test

module test(intf intff);			// receiving intferface as arguments
  
  // clock generation
  initial begin
    intff.clk = 0;
    forever #5 intff.clk = ~intff.clk;
  end
  
  // display statement
  initial begin
    $monitor("$time = %0t | rst_n = %0d | j = %0d | k = %0d | q = %0d | q_bar = %0d", $time, intff.rst_n, intff.j, intff.k, intff.q, intff.q_bar);
  end
  
  initial begin
    
    // initialize values
    intff.rst_n = 0;		// reset
    intff.j	    = 0;
    intff.k 	= 0;		// interface.variable name
    #10;
    
    // release reset
    intff.rst_n = 1; 
    #10;
    
    
    // test input signals
    repeat(1) begin
      for(int i = 0; i < 8; i++) begin
        {intff.j, intff.k} = i; #10; 
      end
    end
  end
endmodule