// interface - simple interface using interface in design
// test

module test(intf intff);
  
  initial begin
    $monitor("a = %b | b = %b | z = %b", intff.a, intff.b, intff.z);
    
    // initialization 
    intff.a = 15;
    intff.b = 1;	#5;
    
    intff.a = 20;
    intff.b = 3;	#5;
    
    intff.a = 16;
    intff.b = 2;	#5;
    
    intff.a = 230;
    intff.b = 6;	#5;
  end
endmodule