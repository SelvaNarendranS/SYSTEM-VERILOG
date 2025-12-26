// interface - simple interface using interface in design
// design
module shift_reg(intf intff);
  
  assign intff.z = (intff.a >> intff.b);			// right shift
endmodule