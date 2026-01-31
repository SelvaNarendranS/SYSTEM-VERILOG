// clocking block with modports
// design - baud_generator

module baud_generator(intf.baud intff);		// receiving modport baud - as ports
  
  // local parameter -  find clock cycle count
  logic [31:0]clk_cycle1;
  assign clk_cycle1 = (intff.baud_rate > 0) ? intff.system_clk / intff.baud_rate : 0;
  
  // counter
  reg [31:0]count;	// clk cycle counter
  
  always @(posedge intff.clk or negedge intff.rst_n) begin
    if(!intff.rst_n) begin
      intff.baud_tick <= 0;
      count			  <= 0;
    end
    else if(intff.en) begin
      if(count == clk_cycle1 - 1) begin
        count 	  		<= 0;
        intff.baud_tick <= 1;		// it's a non blocking assignment
      end
      else begin
        intff.baud_tick <= 0;
        count 		 	<= count + 1;
      end
    end
  end  
  
  assign intff.baud_cycle = clk_cycle1;		// it's a continuous assignment
  
endmodule
