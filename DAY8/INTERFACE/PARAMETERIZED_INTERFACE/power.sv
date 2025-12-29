// parameterized interface
// design
module power(intf intff);
  
  assign intff.z = (intff.a ** intff.b);			// power
endmodule