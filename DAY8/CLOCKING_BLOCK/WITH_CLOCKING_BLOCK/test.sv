// clocking block - with clocking block
// test

module test(intf intff);	// receiving interface as arguments
  logic d = 0;
  
  // display statement
  initial begin
    $monitor("$time = %0t | clk = %0d | rst = %0d | d = %0d | q = %0d | q_bar = %0d", $time, intff.clk, intff.rst, intff.d, intff.q, intff.q_bar);
  end
  
   initial begin
    
    // initialize values
    intff.cb.rst <= 1;		// reset
    intff.cb.d   <= 0;		// interface.variable name
    #10;
    
    // release reset
    intff.cb.rst <= 0; 
    #10;
    
    
    // test input signals
     repeat(5) begin
       @(intff.cb);
       intff.cb.d <= d; 
       d = ~d;
     end
   end
  
endmodule