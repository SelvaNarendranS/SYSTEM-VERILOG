// Write a code to check if a random number is an Armstrong number.

class base;
  rand int unsigned data;
  // constraint
  constraint  randomize_number {
    data inside {[0:1000]}; 
  }     
  
  function post_randomize();
    longint unsigned result;
    int temp, unit_digit;
    longint arm_value;
    int digits = 0;
    
    temp = data;
    
    // counting number of digits of the random number
    while(temp != 0) begin
      temp = temp / 10;
      digits++;
    end
    
    // calculating armstrong number
    temp 	  = data;
    arm_value = 0;
    for(int i = 0; i < digits; i++) begin
      unit_digit = temp % 10;
      arm_value += (unit_digit ** digits);
      temp 		 = temp / 10;
    end
    
    // checking the randomized number and calculated armstrong number are equal
    if(arm_value == data)
      $display("Randomize value is a armstrong number 		-- data = %0d | armstrong = %0d", data,arm_value);
    else
      $display("Randomize value is not a armstrong number	-- data = %0d | armstrong = %0d", data,arm_value);
    
  endfunction
  
endclass

module tb;
  base b1; 		// base handle
  
  initial begin
    b1 = new();			// object allocation
    
    $display("\n--- Ramdomization to check the random number is an armstrong number ---");
    repeat(10) begin
      b1.randomize();	// calling random function for randomization
    
    end
  end
endmodule