// clocking block - individual skew
// test

module test(intf intff);
  
  initial begin
    $monitor("Time = %0t | clk = %0d | a = %b | b = %b | z = %b", $time, intff.clk, intff.a, intff.b, intff.z);
    
    // initialization 
    intff.cb.a <= 0;
    intff.cb.b <= 0;	#5;
    
    repeat(2) begin
      for(int i = 0; i < 4; i++) begin
        @(intff.cb);				// wait for the clocking blocking behaviour(negedge / posedge)
        {intff.cb.a, intff.cb.b} <= i;		// generate output stimulus
      end
    end
  end
endmodule