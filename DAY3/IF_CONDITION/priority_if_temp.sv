// conditional statements
// check temperature using priority if condition
module priority_if;
  byte temp;
  
  initial begin
    // initialize
    repeat(10) begin
      temp = $urandom; #1;
      priority if(temp > 100)
        $display("temp = %0d | Emergency ~ Overheat ", temp);
      else if(temp >= 80)
        $display("temp = %0d | High ~ Warning ", temp);
      else if(temp >= 60)
        $display("temp = %0d | Alert ~ Medium ", temp);
	  else
        $display("temp = %0d | Normal ", temp);
    end
  end
endmodule