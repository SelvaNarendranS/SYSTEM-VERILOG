// DO-WHILE LOOP
// toggle an LED value (0 ↔ 1) five times, and print the LED value on every iteration.
module do_while_loop;
  bit led;
  byte max = 5;
  int i = 0, count = 1;
  
  initial begin
    
    do begin
      if(!led) begin
        led = 1;
        $display("0-1 transition of LED - %0d", count);
        count++;
      end
      else
        led = 0;
      i++;
    end
    while(i < max*2);
  end
endmodule