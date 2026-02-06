// interface_with_function
// test

module test(intf intff);
  
  initial begin
    // initialize
    intff.add(0, 0);		#2;
    
    repeat(5) begin
      intff.add($urandom_range(0, 15), $urandom_range(0, 15)); #6;
    end
  end
endmodule