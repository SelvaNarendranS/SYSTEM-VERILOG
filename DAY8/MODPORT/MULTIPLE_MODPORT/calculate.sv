// multiple modport
// design - multiplication + division

module calculate (intf.cal intff);		// receiving modport cal - as ports
  
  assign intff.multiply = (intff.en) ? intff.a * intff.b : 0;
  assign intff.divide   = (!intff.en && intff.b != 0) ? intff.a / intff.b : 0;
  
endmodule