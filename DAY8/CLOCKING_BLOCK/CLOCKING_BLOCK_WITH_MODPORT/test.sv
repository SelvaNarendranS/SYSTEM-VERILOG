// clocking block with modport
// test

module test(intf.tb intff);
  
  // display 
  initial begin
    forever begin
      @(intff.cb);
      $display("time = %0t | sum_of_unit_scaled_digits of rst = %0d | a = %0d | z = %0d", $time, intff.rst, intff.a, intff.cb.z);
    end
  end
  
  initial begin
    
    // Initialization
    @(intff.cb);
    intff.cb.rst <= 1;
    intff.cb.a   <= 0;
    
    @(intff.cb);
    intff.cb.rst <= 0; // Release reset
    
    
    // data sending
    @(intff.cb);
    intff.cb.a <= 3114;				// passing input to the clocking block through modport and interface
    
    @(intff.cb);
    intff.cb.a <= 253;
    
    @(intff.cb);
    intff.cb.a <= 66;
    
    @(intff.cb);
    intff.cb.a <= 132;
    
    repeat(2) @(intff.cb);
  end
endmodule