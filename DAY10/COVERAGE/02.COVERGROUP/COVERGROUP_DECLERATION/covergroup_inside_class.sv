// covergroup decleration locations --- inside class

class class_cg;
  bit [3:0] a;
  shortint data;
  
  covergroup class_cov;
    track_a : coverpoint a {
      bins mid = {[3:14]};
      bins max = {15};
    }    
  endgroup
  
  function new();
    class_cov = new();		// covergroup object allocation
  endfunction
  
endclass

module sample;
  class_cg h1;		// class handle
  
  initial begin    
    h1 = new();
    
    $monitor("a = %0d", h1.a);
    
    // test stimulus
    h1.a = 0;
    
    repeat(16) begin
      h1.a = h1.a + 1;		#2;
      h1.class_cov.sample();
      $display("The coverage = %0.2f%%", h1.class_cov.get_inst_coverage()); 
    end
    
    $finish;
  end
  
endmodule  
