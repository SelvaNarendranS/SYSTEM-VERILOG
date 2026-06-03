// covergroup decleration locations --- inside module

typedef enum bit[1:0]{RED, YELLOW, GREEN, BLUE} light;
module cg_module;
  
  light light_state;
  
  covergroup state_cg;
    state_change : coverpoint light_state;
    option.at_least = 2	;
  endgroup
  
  state_cg cg_inst;
  
  initial begin
    cg_inst = new();		// covergroup object allocation
    
    $monitor("light state = %0d(%0s)", light_state, 
             ((light_state == 2'b00) ? "RED" :
              (light_state == 2'b01) ? "YELLOW" :
              (light_state == 2'b10) ? "GREEN" : "BLUE"));
    
    // test stimulus
    repeat(2) begin
      light_state = RED;		#2;
      cg_inst.sample();
      $display("The coverage = %0.2f%%", cg_inst.get_inst_coverage());
    
      light_state = YELLOW;		#2;
      cg_inst.sample();
      $display("The coverage = %0.2f%%", cg_inst.get_inst_coverage());
      
      light_state = GREEN;		#2;
      cg_inst.sample();
      $display("The coverage = %0.2f%%", cg_inst.get_inst_coverage());
      
      light_state = BLUE;		#2;
      cg_inst.sample();
      $display("The coverage = %0.2f%%", cg_inst.get_inst_coverage());
      
    end
    
    $finish;
  end
  
endmodule  
