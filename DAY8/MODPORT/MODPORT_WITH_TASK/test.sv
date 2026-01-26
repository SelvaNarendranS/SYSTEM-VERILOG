// modport with task
// test

module test(intf.tb intff); 	// receiving modport tb as arguments
  bit e = 0;
  
  initial begin
    $monitor("time = %0t | rst = %0d | en = %0d |data_in = %0b | b2g = %0b | g2b = %0b --- %0s", $time, 
             intff.rst, 
             intff.en, 
             intff.data_in, 
             (intff.en) ? intff.b2g : 'b0,
             (!intff.en) ? intff.g2b : 'b0,
             (!intff.rst) ? ((intff.en) ? "binary 2 gray" : "gray to binary") : "RESET");
    
    // initialization and reset
    intff.reset();		// calling task in interface
    
    #10;
    // sending data and convertion enable signal by calling task asarguments
    repeat(10) begin
      intff.drive_data(e, $random);
      e = ~e;
      #5;
    end
  end
endmodule