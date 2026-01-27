// multiple modport
// design - power + square

module root(intf.rt intff);		// receiving modport rt - as ports
  
  assign intff.power  = (intff.en) ? intff.a ** intff.b : 0;
  assign intff.square = (intff.en) ? intff.a ** 2 : intff.b ** 2;
  
endmodule