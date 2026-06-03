// covergroup decleration locations --- outside module and class

covergroup outside_cg(ref logic[7:0] data); // to define covergroup outside need to use parameterized covergroup 
    track_data : coverpoint data {
      bins min = {[3:14], [18:24]};
      bins mid = {[100:210]};
      bins max = default;
    }    
  endgroup

module sample;
  logic [7:0]data;
  
  outside_cg cg_inst;		// class handle
  
  initial begin    
    cg_inst = new(data);
    
    $monitor("data = %0d", data);
    
    // test stimulus
    
    repeat(10) begin
      data = $random;		#2;
      cg_inst.sample();
      $display("The coverage = %0.2f%%", cg_inst.get_inst_coverage()); 
    end
    
    $finish;
  end
  
endmodule  
