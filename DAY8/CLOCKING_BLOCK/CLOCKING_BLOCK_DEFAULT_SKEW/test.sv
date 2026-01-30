// clocking block - with default skew
// test

module test(intf intff);	// receiving interface as arguments
  logic t = 0;
  
  // display statement
  initial begin
    $monitor("$time = %0t | clk = %0d | rst = %0d | t = %0d | q = %0d | q_bar = %0d", $time, intff.clk, intff.rst, intff.t, intff.q, intff.q_bar);
  end
  
   initial begin
    
    // initialize values
    intff.cb.rst <= 1;		// reset
    intff.cb.t   <= 0;		// interface.variable name
    #5;
    
    // release reset
    intff.cb.rst <= 0;     
    
    // test input signals
     repeat(10) begin
       @(intff.cb);
       intff.cb.t <= t; 
       t = ~t;
     end
   end
  
endmodule