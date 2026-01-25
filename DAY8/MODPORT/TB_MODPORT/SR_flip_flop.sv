// modport - testbench modport
// Design - sr flip flop

module sr_ff(intf.dut intff);	// interface instance --- getting port list as arguments from interface --> modport to design
  
  always @(posedge intff.clk or negedge intff.rst_n) begin
    if(!intff.rst_n)
      intff.q <= 0;
    else begin
      case({intff.s, intff.r})
        2'b00 : intff.q <= intff.q;		// no change
        2'b01 : intff.q <= 0;			    // reset
        2'b10 : intff.q <= 1;			    // set
        2'b11 : intff.q <= 1'bx;		  // not defined
      endcase
    end
  end
  
  assign intff.q_bar = ~intff.q;	// q bar
  
endmodule
