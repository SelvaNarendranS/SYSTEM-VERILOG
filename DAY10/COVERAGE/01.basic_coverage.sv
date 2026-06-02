// Basic functional coverage

module basic_coverage;
  bit [7:0] in;
  bit [3:0] data_in;
  
  // covergroup
  covergroup basic_cg;
    INPUT : coverpoint in;		// coverpoint ---- auto bins has be assigned internally
    DATA : coverpoint data_in;
    
  endgroup
  
  // covergroup handle
  basic_cg inst_cg;	
  
  initial begin
    
    inst_cg = new();		// covergroup object allocation
    
    $monitor("in = %0d | data_in = %0d", in, data_in);
    
    // test stimulus
    
    // initialize
    in = 10;
    data_in = 7;		#5;
    inst_cg.sample();
    
    repeat(30) begin
      in = in + 1;
      data_in = (data_in + 1) % 16;		#5;
      inst_cg.sample();
    end
    
    // Printing final coverage percentage
    $display("Final Coverage = %0.2f%%", inst_cg.get_inst_coverage());
    
  end
    
endmodule
