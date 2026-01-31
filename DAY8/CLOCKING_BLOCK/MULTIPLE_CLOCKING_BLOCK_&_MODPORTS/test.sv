// multiple clocking block with modports
// test

module test(intf.tb intff); 	// receiving modport tb as arguments
  
  initial begin
    
    // initialization
    @(intff.drive);
    intff.drive.rst_n		 <= 0;		// reset condition
    intff.drive.en 			 <= 0;
    intff.drive.system_clk	 <= 0;
    intff.drive.baud_rate  	 <= 0;
    intff.drive.required_clk <= 0;
    
    repeat(5) @(intff.sample); // Observe for 5 cycles
    display();
    
    intff.drive.rst_n <= 1;
    @(intff.drive);
    
    // sending data to dut
    @(intff.drive);
    intff.drive.en 			<= 1;
    intff.drive.system_clk	<= 100_000;
    intff.drive.baud_rate  	<= 9600;
    intff.drive.required_clk 	<= 50_000;	
      
    //waiting for Ticks
    $display("--- Waiting for Ticks ---");
    
    // Waiting for the Baud Tick
    @(intff.sample iff intff.sample.baud_tick == 1'b1); 
    $display("Captured BAUD TICK at time %0t", $time);
    display();
    
    // Waiting for the clk Tick
    @(intff.sample iff intff.sample.clk_tick == 1'b1); 		// in events iff -- only if condition 
    $display("\nCaptured clk TICK at time %0t", $time);
    display();
   
  end
    
  // display statement
  task display();
    $display("time = %0t | rst = %0d | en = %0d | system_clk = %0d | baud_rate = %0d | required_clk = %0d | clk_tick = %0d | clk_cycle = %0d | baud_tick = %0d | baud_cycle = %0d", 
             $time,  
             intff.sample.rst_n,
             intff.sample.en, 
             intff.sample.system_clk,
             intff.sample.baud_rate,
             intff.sample.required_clk,
             intff.sample.clk_tick,
             intff.sample.clk_cycle,
             intff.sample.baud_tick,
             intff.sample.baud_cycle
            );
  endtask
             
endmodule