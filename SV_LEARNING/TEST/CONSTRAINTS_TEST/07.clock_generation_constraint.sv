// Write a SystemVerilog program to generate a clock signal of different frequencies.
// Declare a global variable clock
// Use a method to generate clock
// Method must not directly use global variable
// Change frequency every 150 time units
// Show three frequency changes

class base ;
  randc bit [7:0]freq;
  
  // constraint
  constraint c {
    freq inside {[5:50]};
  }
  
  // display function
  function void print();
    $display("\nfreq = %d", freq);
  endfunction
  
endclass
    
module clock_generation;
  base b1;		// class handle
  logic clk;
  
  // clock generation
  task automatic run_clk(ref logic gen_clk, input int fq);
    forever begin
      #fq gen_clk = ~gen_clk;
    end
  endtask
  
  initial begin
    forever begin
      @(clk);
      $display("time = %0t | clk = %0d | freq = %0d", $time, clk, b1.freq);
    end
  end
    
  initial begin
    b1 = new();			// memory allocation
    clk = 0;
    
    $display("\n--------------------- The list of randomized values ----------------");
    
    repeat(3) begin
      if(b1.randomize()) begin 		// calling randomize function
        b1.print();				// calling class print function
        
        disable fork;			// disable fork to stop previous fork
        
        fork
          run_clk(clk, b1.freq);	//	passing frequency value as arguments
        join_none
        
        #150;					// waiting for 150 times
      end
      else
        $display("randomize failed");
    end
    
    $finish;
  end
  
endmodule

// https://edaplayground.com/x/8tdE