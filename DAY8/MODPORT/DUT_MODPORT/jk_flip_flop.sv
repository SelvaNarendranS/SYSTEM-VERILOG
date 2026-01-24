// modport - dut modport
// Design - jk flip flop

module jk_ff(intf.dut intff);	// interface instance --- getting port list as arguments from interface --> modport to design
  
  always @(posedge intff.clk or negedge intff.rst_n) begin
    if(!intff.rst_n)
      intff.q <= 0;
    else begin
      case({intff.j, intff.k})
        2'b00 : intff.q <= intff.q;		// no change
        2'b01 : intff.q <= 0;			    // reset
        2'b10 : intff.q <= 1;			    // set
        2'b11 : intff.q <= ~intff.q;	// toggle
      endcase
    end
  end
  
  assign intff.q_bar = ~intff.q;	// q bar
  
endmodule
