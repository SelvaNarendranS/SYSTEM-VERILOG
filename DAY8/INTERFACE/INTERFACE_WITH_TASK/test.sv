// interface_with_task
// test

module test(intf intff);
  
  initial begin
    // initialize
    intff.write(0);		#2;
    
    repeat(5) begin
      intff.write($urandom_range(1, 30)); #6;
    end
  end
endmodule