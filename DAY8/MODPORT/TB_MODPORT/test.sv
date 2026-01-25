// modport - testbench modport
// test

module test(intf.tb intff);			// receiving intferface.modport as arguments
  
  // clock generation
  initial begin
    intff.clk = 0;
    forever #5 intff.clk = ~intff.clk;
  end
  
  // display statement
  initial begin
    $monitor("$time = %0t | rst_n = %0d | s = %0d | r = %0d | q = %0d | q_bar = %0d", $time, intff.rst_n, intff.s, intff.r, intff.q, intff.q_bar);
  end
  
  initial begin
    
    // initialize values
    intff.rst_n = 0;		// reset
    intff.s	    = 0;
    intff.r 	= 0;		// interface.variable name
    #12;
    
    // release reset
    intff.rst_n = 1; 
    #10;
    
    
    // test input signals
    repeat(1) begin
      for(int i = 0; i < 8; i++) begin
        {intff.s, intff.r} = i; #10; 
      end
    end
  end
endmodule