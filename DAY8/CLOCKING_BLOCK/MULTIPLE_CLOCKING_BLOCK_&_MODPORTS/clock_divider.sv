// multiple clocking block with modports
// design - clock divider

module clock_divider(intf.clk_div intff);		// receiving modport clk_div - as ports
  
  // local parameter -  find clock cycle count
  logic [31:0]divider;
  assign divider = intff.system_clk / intff.required_clk * 2; // *2 to seprate clk HIGH & LOW
  
  // counter
  reg [31:0]count;	// clk cycle counter
  
  always @(posedge intff.clk or negedge intff.rst_n) begin
    if(!intff.rst_n) begin
      intff.clk_tick <= 0;
      count			 <= 0;
    end
    else if(intff.en) begin
      if(count == divider - 1) begin
        count 	  	   <= 0;
        intff.clk_tick <= 1;		// it's a non blocking assignment
      end
      else begin
        intff.clk_tick <= 0;
        count 		   <= count + 1;
      end
    end
  end    
  
  assign intff.clk_cycle = divider;			// it's a continuous assignment
  
endmodule