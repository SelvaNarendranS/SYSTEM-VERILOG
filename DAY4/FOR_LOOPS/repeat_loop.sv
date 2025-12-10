// REPEAT LOOP
// generate a clock with period 10 time units (toggle signal every 5 time units)
module repeat_loop;
  reg clk; 
  int time_period = 10;

  initial begin
	$monitor("Time = %0t | clk = %b", $time, clk);
    
    clk = 1'b0;
    repeat(8*2) begin
      #(time_period /2) clk = ~clk;
    end

    #10 $finish;
  end
endmodule
