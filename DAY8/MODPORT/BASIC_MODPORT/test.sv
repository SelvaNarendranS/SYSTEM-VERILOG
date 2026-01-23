// modport - Basic modport
// test

module test(intf.tb intff);			// receiving intferface.modeport as arguments
  
  initial begin
    
    // initialize values
    // accessing ports for test bench from mordport inside interface
    intff.a = 0;
    intff.b = 0;
    intff.c = 0;		// interface.modport name.variable name
    #5;
    
    // test input signals
    repeat(5) begin
      intff.a = $urandom_range(0, 255);
      intff.b = $urandom_range(0, 255);
      intff.c = $urandom_range(0, 255);
      #10;
      
      $display("$time = %0t | a = %0d | b = %0d | c = %0d | sum = %0d | subtract = %0d", $time, intff.a, intff.b, intff.c, intff.sum, intff.subtract);
    end
  end
endmodule