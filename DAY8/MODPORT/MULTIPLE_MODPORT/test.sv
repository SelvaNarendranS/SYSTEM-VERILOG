// multiple modport
// test

module test(intf.tb intff); 	// receiving modport tb as arguments
  bit e = 0;
  
  initial begin
    $monitor("time = %0t | en = %0d | a = %0d | b = %0d | multiply = %0d | divide = %0d | power = %0d | square = %0d(%0s) --- %0s & %0s", 
             $time,  
             intff.en, 
             intff.a,
             intff.b,
             intff.multiply,
             intff.divide,
             intff.power,
             intff.square,
             (intff.en) ? "a" : "b",
             (intff.en) ? "multiply" : "divide",
             (intff.en) ? "power" : "square"
            );
    
    // initialization
    intff.en = 0;
    intff.a  = 0;
    intff.b  = 0;    
    #10;
    
    // sending data
    repeat(10) begin
      intff.en = e;
      intff.a  = $urandom_range(1, 10);
      intff.b  = $urandom_range(1, 10);
      e = ~e;
      #5;
    end
  end
endmodule