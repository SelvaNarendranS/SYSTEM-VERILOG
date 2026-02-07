// Randomization --- randcase randomization

module randcase_randomize_basic;
  
  initial begin
    
    $display("\n----------printing randcase ramdomized values----------------");
    
    repeat(10) begin
      
      // randcase
      randcase
        10 : $display("10%% weight has been selected");
        60 : $display("60%% weight has been selected");
        30 : $display("30%% weight has been selected");
      endcase  				
      
      // case values(10, 30 ,60, ....) are weightage  --- according to the weightage each get picked and get randomized
    end  
  end
endmodule