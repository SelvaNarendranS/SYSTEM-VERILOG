// clocking block with modport -- Sum of Unit-Scaled Digits
// design
module sum_of_unit_scaled_digits(intf.dut intff);
  integer sum, store, temp, unit_digit;
  
  always @(posedge intff.clk) begin
    if(intff.rst) begin 
      intff.z <= 0;
      sum      = 0;
      store    = 0;
      unit_digit = 0;
    end
    else begin
      sum   = 0;
      store = intff.a;           
      unit_digit = store % 10;  
      
      while(store != 0) begin
        temp  = store % 10;
        sum   = sum + (temp * unit_digit); // adding and multiplying the given number
        store = store / 10;      
      end
      intff.z <= sum;            
    end
  end
endmodule
