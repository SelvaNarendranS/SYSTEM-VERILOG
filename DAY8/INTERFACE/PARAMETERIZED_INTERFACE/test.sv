// parameterized interface
// test

module test(intf intff);
  
  initial begin
    $monitor("a = %0d | b = %0d | z = %0d", intff.a, intff.b, intff.z);
    
    // initialization 
    intff.a = 15;
    intff.b = 3;	#5;
    
    intff.a = 20;
    intff.b = 3;	#5;
    
    intff.a = 16;
    intff.b = 2;	#5;
    
    intff.a = 234;
    intff.b = 4;	#5;
  end
endmodule