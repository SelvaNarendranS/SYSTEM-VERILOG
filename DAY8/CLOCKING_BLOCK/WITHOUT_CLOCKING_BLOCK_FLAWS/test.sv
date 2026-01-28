// clocking block - Race condition(without clocking block)
// test

program test(intf intff);	// receiving interface as arguments
  logic d = 0;
  
  // clock generation
  initial begin
    intff.clk = 0;
    forever #5 intff.clk = ~intff.clk;
  end
  
  // display statement
  initial begin
    $monitor("$time = %0t | clk = %0d | rst = %0d | d = %0d | q = %0d | q_bar = %0d", $time, intff.clk, intff.rst, intff.d, intff.q, intff.q_bar);
  end
  
   initial begin
    
    // initialize values
    intff.rst = 1;		// reset
    intff.d   = 0;		// interface.variable name
    #10;
    
    // release reset
    intff.rst = 0; 
    #10;
    
    
    // test input signals
     repeat(5) begin
       intff.d = d; 
       d = ~d;
       #10;
     end
   end
  
endprogram